import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/contact.dart';

void main() {
  runApp(BytebankApp());
  save(Contact(0, 'riq', 1001)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xff34af23),
          accentColor: Colors.green[900],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green[500],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
    );
  }
}
