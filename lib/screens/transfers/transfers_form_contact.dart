import 'package:bytebank/screens/transfers/components/transfers_form.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/transfers/transfers_form_document.dart';
import 'package:bytebank/utils/route.dart';
import 'package:flutter/material.dart';

class TransfersFormContactPage extends StatefulWidget with NamedRoute {
  @override
  _TransfersFormContactPageState createState() =>
      _TransfersFormContactPageState();

  @override
  String get routeName => '/contact-name';
}

class _TransfersFormContactPageState extends State<TransfersFormContactPage> {
  final TextEditingController _nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TransfersForm(
      controller: _nameController,
      label: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 21),
            children: [
              TextSpan(text: 'Enter the '),
              TextSpan(
                text: 'full name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' of your contact here'),
            ],
          ),
        ),
      ),
      hintText: 'Full name',
      keyboardType: TextInputType.name,
      onPressed: () {
        if (_nameController.text.isNotEmpty) {
          Contact contact = Contact(name: _nameController.text);
          pushWithSettings(
            context,
            TransfersFormDocumentPage(
              contact: contact,
            ),
          );
        }
      },
    );
  }
}
