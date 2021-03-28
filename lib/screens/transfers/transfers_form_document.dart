import 'package:bytebank/components/transfers_form.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/transfers/transfers_form_agency.dart';
import 'package:bytebank/utils/route.dart';
import 'package:flutter/material.dart';

class TransfersFormDocumentPage extends StatefulWidget with NamedRoute {
  final Contact contact;

  TransfersFormDocumentPage({Key key, @required this.contact})
      : super(key: key);

  @override
  _TransfersFormDocumentPageState createState() =>
      _TransfersFormDocumentPageState();

  @override
  String get routeName => '/contact-document';
}

class _TransfersFormDocumentPageState extends State<TransfersFormDocumentPage> {
  final TextEditingController _documentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TransfersForm(
      controller: _documentController,
      label: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 21),
            children: [
              TextSpan(text: 'Enter the '),
              TextSpan(
                text: 'CPF / CNPJ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' of your contact here'),
            ],
          ),
        ),
      ),
      hintText: '000.000.000-00',
      onPressed: () {
        if (_documentController.text.isNotEmpty) {
          widget.contact.document = _documentController.text;
          pushWithSettings(
            context,
            TransfersFormAgencyPage(
              contact: widget.contact,
            ),
          );
        }
      },
    );
  }
}
