import 'package:flutter/material.dart';

import 'src/app_widget.dart';
import 'src/core/configurations/get_it_configuration.dart';

void main() {
  configureDependencies();
  runApp(const AppWidget());
}
