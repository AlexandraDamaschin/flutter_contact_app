import 'package:flutter/material.dart';
import 'package:avatars/avatars.dart';

import '../contact_details/contact_details_screen.dart';
import '../models/contact.dart';

class ContactRow extends StatelessWidget {
  final Contact contact;

  const ContactRow({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key('ListTile_Item_${contact.firstName}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContactDetailsScreen(
              contact: contact,
            ),
          ),
        );
      },
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Avatar(
            name: '${contact.firstName} ${contact.lastName}',
            shape: AvatarShape.circle(20)),
      ),
      contentPadding: const EdgeInsets.only(top: 6, left: 16, bottom: 6),
      title: Text(
        "${contact.firstName} ${contact.lastName}",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        contact.email,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          color: Colors.black,
        ),
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(right: 24),
        child: Icon(
          Icons.phone_outlined,
          size: 28,
          color: Colors.black,
        ),
      ),
    );
  }
}
