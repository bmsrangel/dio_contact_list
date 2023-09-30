import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/blocs/contacts/contacts_bloc.dart';
import '../core/dtos/new_contact_dto.dart';
import '../core/widgets/profile_image_widget.dart';
import 'edit_contact_page.dart';
import 'single_contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
    required this.contactsBloc,
  });

  final String title;
  final ContactsBloc contactsBloc;

  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactsBloc get _bloc => widget.contactsBloc;

  @override
  void initState() {
    super.initState();
    _bloc.add(const GetAllContactsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<ContactsBloc, ContactsState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator.adaptive();
            } else if (state.error != null) {
              return Text(state.error!);
            } else if (state.state.isEmpty) {
              return const Text('No contacts registered yet');
            } else {
              return ListView.separated(
                itemCount: state.state.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (_, index) {
                  final contact = state.state[index];
                  return ListTile(
                    title: Text(
                      '${contact.firstName} ${contact.lastName ?? ''}'.trim(),
                    ),
                    leading: ProfileImageWidget(
                      imagePath: contact.avatarUrl,
                      radius: 18.0,
                    ),
                    onTap: () => Navigator.pushNamed(
                      context,
                      SingleContactPage.route,
                      arguments: contact.id,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newContactDTO = await Navigator.pushNamed(
            context,
            EditContactPage.route,
          );
          if (newContactDTO != null) {
            _bloc.add(CreateContactEvent(newContactDTO as NewContactDTO));
            _bloc.add(const GetAllContactsEvent());
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
