import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../generated/l10n.dart';
import '../../core/blocs/single_contact/single_contact_bloc.dart';
import '../../core/models/contact_model.dart';
import '../../core/widgets/profile_image_widget.dart';
import '../edit_contact_page/edit_contact_page.dart';

class SingleContactPage extends StatefulWidget {
  const SingleContactPage({
    super.key,
    required this.singleContactBloc,
    required this.id,
  });

  static const String route = '/contact';

  final SingleContactBloc singleContactBloc;
  final Object id;

  @override
  State<SingleContactPage> createState() => _SingleContactPageState();
}

class _SingleContactPageState extends State<SingleContactPage> {
  SingleContactBloc get _bloc => widget.singleContactBloc;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetContactByIdEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<SingleContactBloc, SingleContactState>(
            bloc: _bloc,
            builder: (_, state) {
              if (state.state != null) {
                return IconButton(
                  tooltip: S.of(context).edit,
                  onPressed: () async {
                    final updatedContact = await Navigator.pushNamed(
                      context,
                      EditContactPage.route,
                      arguments: state.state,
                    );
                    if (updatedContact != null) {
                      _bloc.add(
                        UpdateContactEvent(updatedContact as ContactModel),
                      );
                    }
                  },
                  icon: const Icon(Icons.edit),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: BlocBuilder<SingleContactBloc, SingleContactState>(
              bloc: _bloc,
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state.error != null) {
                  return Center(
                    child: Text(state.error!),
                  );
                } else {
                  return Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 48.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 48.0),
                                  Text(
                                    '${state.state!.firstName} ${state.state!.lastName ?? ''}'
                                        .trim(),
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  state.state!.phoneNumber != null &&
                                          state.state!.phoneNumber!.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () {
                                            final uri = Uri(
                                              scheme: 'tel',
                                              path: state.state!.phoneNumber,
                                            );
                                            launchUrl(
                                              uri,
                                            );
                                          },
                                          child: Text(
                                            state.state!.phoneNumber!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  state.state!.email != null &&
                                          state.state!.email!.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () {
                                            final uri = Uri(
                                              scheme: 'mailto',
                                              path: state.state!.email,
                                            );
                                            launchUrl(
                                              uri,
                                            );
                                          },
                                          child: Text(
                                            state.state!.email!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        child: ProfileImageWidget(
                          imagePath: state.state!.avatarUrl,
                          radius: 48.0,
                        ),
                      ),
                    ],
                  );
                }
              }),
        );
      }),
    );
  }
}
