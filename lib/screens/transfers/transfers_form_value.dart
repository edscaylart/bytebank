import 'package:bytebank/components/transfers_form.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/models.dart';
import 'package:bytebank/repository/transaction_repository.dart';
import 'package:bytebank/screens/transfers/transfers_list.dart';
import 'package:bytebank/utils/route.dart';
import 'package:flutter/material.dart';

class TransfersFormValuePage extends StatefulWidget with NamedRoute {
  final Contact contact;

  TransfersFormValuePage({Key key, @required this.contact}) : super(key: key);

  @override
  _TransfersFormValuePageState createState() => _TransfersFormValuePageState();

  @override
  String get routeName => '/contact-value';
}

class _TransfersFormValuePageState extends State<TransfersFormValuePage> {
  final TransactionRepository _repository = new TransactionRepository();

  final TextEditingController _valueController = new TextEditingController();

  Future handleTransfer(BuildContext context) async {
    if (_valueController.text.isEmpty) return;

    final transaction = Transaction(
        value: double.tryParse(_valueController.text), contact: widget.contact);

    final result = await _repository.save(transaction);

    if (result != null) {
      Navigator.of(context).popUntil(
        ModalRoute.withName(
          TransfersListPage().routeName,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TransfersForm(
      controller: _valueController,
      title: 'What is the value of the transfer?',
      label: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 21),
            children: [
              TextSpan(text: 'Inform how much you want to transfer to '),
              TextSpan(
                text: widget.contact.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      prefixText: 'R\$ ',
      hintText: '0,00',
      onPressed: () => handleTransfer(context),
    );
  }
}
