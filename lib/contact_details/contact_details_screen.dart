import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

import '../components/contact_details_row.dart';
import '../models/contact.dart';

class ContactDetailsScreen extends StatelessWidget {
  final Contact contact;

  const ContactDetailsScreen({Key? key, required this.contact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Contact details',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
              child: Avatar(name: '${contact.firstName} ${contact.lastName}')),
          const SizedBox(height: 16),
          Column(children: [
            Text(
              "${contact.firstName} ${contact.lastName}",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ]),
          const SizedBox(height: 28),
          ContactDetailsRow(
            userInfo: contact.email,
            singleIcon: Icons.email_outlined,
          ),
          ContactDetailsRow(
            userInfo: "@${contact.username}",
            singleIcon: Icons.account_circle_outlined,
          )
        ]),
      ),
    );
  }
}
