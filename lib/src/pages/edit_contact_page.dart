import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../core/dtos/new_contact_dto.dart';
import '../core/models/contact_model.dart';
import '../core/widgets/custom_text_form_field_widget.dart';
import '../core/widgets/profile_image_widget.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({
    super.key,
    required this.title,
    this.contactModel,
  });

  static const String route = '/edit';

  final String title;
  final ContactModel? contactModel;

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  ContactModel? get _contact => widget.contactModel;

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _firstName$;
  late final TextEditingController _lastName$;
  late final TextEditingController _phone$;
  late final TextEditingController _email$;

  final ValueNotifier<String?> _avatarUrl = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _firstName$ = TextEditingController(text: _contact?.firstName);
    _lastName$ = TextEditingController(text: _contact?.lastName);
    _phone$ = TextEditingController(text: _contact?.phoneNumber);
    _email$ = TextEditingController(text: _contact?.email);
    _avatarUrl.value = _contact?.avatarUrl;
  }

  @override
  void dispose() {
    _firstName$.dispose();
    _lastName$.dispose();
    _phone$.dispose();
    _email$.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_contact?.firstName ?? widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ValueListenableBuilder<String?>(
                valueListenable: _avatarUrl,
                builder: (_, avatarUrl, __) => ProfileImageWidget(
                  imagePath: avatarUrl,
                  radius: 50.0,
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                controller: _firstName$,
                labelText: 'First Name',
                validator: Validatorless.required('This field is mandatory'),
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                controller: _lastName$,
                labelText: 'Last Name',
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                controller: _phone$,
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                controller: _email$,
                labelText: 'E-mail',
                keyboardType: TextInputType.emailAddress,
                validator:
                    Validatorless.email('This e-mail address is not valid'),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_contact == null) {
                      final newContactDTO = NewContactDTO(
                        firstName: _firstName$.text,
                        lastName: _lastName$.text,
                        phoneNumber: _phone$.text,
                        email: _email$.text,
                        avatarUrl: _avatarUrl.value,
                      );
                      Navigator.pop(context, newContactDTO);
                    } else {
                      final updatedContact = _contact!.copyWith(
                        firstName: _firstName$.text,
                        lastName: _lastName$.text,
                        phoneNumber: _phone$.text,
                        email: _email$.text,
                        avatarUrl: _avatarUrl.value,
                      );
                      Navigator.pop(context, updatedContact);
                    }
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
