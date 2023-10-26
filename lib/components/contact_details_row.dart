import 'package:flutter/material.dart';

class ContactDetailsRow extends StatelessWidget {
  const ContactDetailsRow(
      {Key? key, required this.singleInfo, required this.singleIcon})
      : super(key: key);

  final String singleInfo;
  final IconData singleIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 6, left: 24, bottom: 6),
      leading: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Icon(
          singleIcon,
          size: 28,
        ),
      ),
      title: Text(singleInfo),
    );
  }
}
