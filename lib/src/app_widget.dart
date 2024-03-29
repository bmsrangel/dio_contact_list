import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import '../generated/l10n.dart';
import 'core/blocs/contacts/contacts_bloc.dart';
import 'core/blocs/single_contact/single_contact_bloc.dart';
import 'core/models/contact_model.dart';
import 'pages/edit_contact_page/edit_contact_controller.dart';
import 'pages/edit_contact_page/edit_contact_page.dart';
import 'pages/home/home_page.dart';
import 'pages/single_contact_page/single_contact_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3a94d1)),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => HomePage(
              title: S.of(context).homePageTitle,
              contactsBloc: GetIt.I.get<ContactsBloc>(),
            ),
        SingleContactPage.route: (context) {
          final contactId = ModalRoute.of(context)!.settings.arguments as int;
          final SingleContactBloc bloc = GetIt.I.get<SingleContactBloc>(
            param1: SingleContactState(
              isLoading: true,
            ),
          );
          return SingleContactPage(
            id: contactId,
            singleContactBloc: bloc,
          );
        },
        EditContactPage.route: (context) {
          final contactModel =
              ModalRoute.of(context)!.settings.arguments as ContactModel?;
          return EditContactPage(
            title: S.of(context).editContactPageTitle,
            contactModel: contactModel,
            controller: GetIt.I.get<EditContactController>(),
          );
        },
      },
    );
  }
}
