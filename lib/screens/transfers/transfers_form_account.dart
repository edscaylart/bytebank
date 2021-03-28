import 'package:bytebank/components/transfers_form.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/transfers/transfers_form_value.dart';
import 'package:bytebank/utils/route.dart';
import 'package:flutter/material.dart';

class TransfersFormAccountPage extends StatefulWidget with NamedRoute {
  final Contact contact;

  TransfersFormAccountPage({Key key, @required this.contact}) : super(key: key);

  @override
  _TransfersFormAccountPageState createState() =>
      _TransfersFormAccountPageState();

  @override
  String get routeName => '/contact-account';
}

class _TransfersFormAccountPageState extends State<TransfersFormAccountPage> {
  final TextEditingController _accountController = new TextEditingController();

  void handleSaveContact(BuildContext context) {
    if (_accountController.text.isNotEmpty) {
      Contact newContact = widget.contact;
      debugPrint(newContact.toString());
      newContact.account = int.tryParse(_accountController.text);
      pushWithSettings(
        context,
        TransfersFormValuePage(contact: newContact),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TransfersForm(
        controller: _accountController,
        label: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 21),
              children: [
                TextSpan(text: 'Enter the '),
                TextSpan(
                  text: 'account number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' of '),
                TextSpan(
                  text: 'Iany Fernandes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        prefixText: 'cc: ',
        hintText: '00.000-0',
        onPressed: () => handleSaveContact(context));
  }
}
