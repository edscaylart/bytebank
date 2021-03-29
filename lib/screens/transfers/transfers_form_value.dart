import 'dart:async';

import 'package:bytebank/components/autentication_dialog.dart';
import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/components/transfers_form.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/models.dart';
import 'package:bytebank/screens/transfers/transfers_list.dart';
import 'package:bytebank/services/http_cliente.dart';
import 'package:bytebank/services/repository/transaction_repository.dart';
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

  bool _loading = false;

  Future _showSuccessfulMessage(
      Transaction transaction, BuildContext context) async {
    if (transaction != null) {
      await showDialog(
          context: context,
          builder: (contextDialog) {
            return SuccessDialog('successful transaction');
          });
      Navigator.pop(context);
    }
  }

  void _showFailureMessage(
    BuildContext context, {
    String message = 'Unknown error',
  }) {
    showDialog(
        context: context,
        builder: (contextDialog) {
          return FailureDialog(message);
        });
  }

  void _handleSaveTransfer(
    BuildContext context,
    Transaction newTransaction,
    String password,
  ) async {
    Transaction transaction = await _send(
      context,
      newTransaction,
      password,
    );
    _showSuccessfulMessage(transaction, context);

    if (transaction != null) {
      await showDialog(
        context: context,
        builder: (contextDialog) {
          return SuccessDialog('successful transaction');
        },
      );
      Navigator.of(context).popUntil(
        ModalRoute.withName(TransfersListPage().routeName),
      );
    }
  }

  Future<Transaction> _send(
    BuildContext context,
    Transaction transaction,
    String password,
  ) async {
    setState(() {
      _loading = true;
    });
    final transactionResponse =
        await _repository.save(transaction, password).catchError((e) {
      _showFailureMessage(context, message: e.message);
    }, test: (e) => e is HttpException).catchError((e) {
      _showFailureMessage(context,
          message: 'timeout submitting the transaction');
    }, test: (e) => e is TimeoutException).catchError((e) {
      _showFailureMessage(context);
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
    });
    return transactionResponse;
  }

  Future _handleSubmit(BuildContext context) async {
    if (_valueController.text.isEmpty) return;

    final transaction = Transaction(
        value: double.tryParse(_valueController.text), contact: widget.contact);

    showDialog(
      context: context,
      builder: (contextDialog) {
        return AuthenticationDialog(
          onConfirm: (password) {
            _handleSaveTransfer(context, transaction, password);
          },
        );
      },
    );
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
      onPressed: () => _handleSubmit(context),
    );
  }
}
