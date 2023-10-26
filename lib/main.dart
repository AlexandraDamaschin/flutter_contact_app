import 'package:contact_app_with_flutter/contacts/contacts_screen.dart';
import 'package:contact_app_with_flutter/repository/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ContactsScreen(),
    );
  }
}
