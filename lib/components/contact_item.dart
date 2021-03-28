import 'package:bytebank/models/contact.dart';
import 'package:bytebank/utils/string.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onPressed;

  ContactItem(this.contact, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => this.onPressed(this.contact),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(StringUtils.getLetters(contact.name)),
        ),
        title: Text(contact.name, style: TextStyle(fontSize: 18)),
        subtitle: Text('ag: ${contact.agency} | cc: ${contact.account}'),
      ),
    );
  }
}
