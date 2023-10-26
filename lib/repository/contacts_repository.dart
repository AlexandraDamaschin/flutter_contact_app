import 'dart:async';

import 'package:contact_app_with_flutter/utilis/extensions.dart';

import '../local_data/sample_input.dart';
import '../models/contact.dart';

class ContactsRepository {
  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];

    for (var element in sampleData) {
      var firstAndLastName = element.splitAtFirstWord();
      var contact = Contact(
          firstName: firstAndLastName[0],
          username: "",
          email: "",
          lastName: firstAndLastName[1]);

      contacts.add(contact);
    }
    return contacts;
  }
}
