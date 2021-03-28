import 'package:bytebank/models/models.dart';
import 'package:bytebank/utils/string.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem({@required this.transaction});

  @override
  Widget build(BuildContext context) {
    final Contact contact = transaction.contact;

    return ListTile(
      leading: CircleAvatar(
        child: Text(StringUtils.getLetters(contact.name)),
      ),
      title: Text(contact.name, style: TextStyle(fontSize: 18)),
      subtitle: Text('ag: ${contact.agency} | cc: ${contact.account}'),
      trailing: Text(
        'R\$ ${transaction.value}',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
