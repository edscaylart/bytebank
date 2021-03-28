import 'package:bytebank/components/transfers_form.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/transfers/transfers_form_account.dart';
import 'package:bytebank/utils/route.dart';
import 'package:flutter/material.dart';

class TransfersFormAgencyPage extends StatefulWidget with NamedRoute {
  final Contact contact;

  TransfersFormAgencyPage({Key key, @required this.contact}) : super(key: key);

  @override
  _TransfersFormAgencyPageState createState() =>
      _TransfersFormAgencyPageState();

  @override
  String get routeName => '/contact-agency';
}

class _TransfersFormAgencyPageState extends State<TransfersFormAgencyPage> {
  final TextEditingController _agencyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TransfersForm(
      controller: _agencyController,
      label: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 21),
            children: [
              TextSpan(text: 'Enter the '),
              TextSpan(
                text: 'account agency',
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
      prefixText: 'ag: ',
      hintText: '0000-0',
      onPressed: () {
        if (_agencyController.text.isNotEmpty) {
          widget.contact.agency = int.tryParse(_agencyController.text);
          pushWithSettings(
            context,
            TransfersFormAccountPage(
              contact: widget.contact,
            ),
          );
        }
      },
    );
  }
}
