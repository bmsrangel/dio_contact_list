import 'package:dio_contact_list/src/configurations/get_it_configuration.dart';
import 'package:flutter/material.dart';

import 'src/app_widget.dart';

void main() {
  configureDependencies();
  runApp(const AppWidget());
}
