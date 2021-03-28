import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _documentController = new TextEditingController();
  final TextEditingController _agencyController = new TextEditingController();
  final TextEditingController _accountController = new TextEditingController();

  final ContactDao _dao = ContactDao();

  void handleSaveContact() {
    final String name = _nameController.text;
    final String document = _documentController.text;
    final int agency = int.tryParse(_agencyController.text);
    final int account = int.tryParse(_accountController.text);

    // final Contact newContact = Contact(name, document, agency, account);

    // _dao.save(newContact).then((id) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New contact',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.asset('images/logo-min.png', height: 30)
          ],
        ),
        backgroundColor: Colors.cyan[800],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24),
        child: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.cyan[50],
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 32, left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full name',
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  TextField(
                    controller: _documentController,
                    decoration: InputDecoration(
                      labelText: 'Document (CPF/CNPJ)',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _agencyController,
                    decoration: InputDecoration(
                      labelText: 'Agency',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _accountController,
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () => handleSaveContact(),
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
