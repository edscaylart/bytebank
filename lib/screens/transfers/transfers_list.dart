import 'package:bytebank/components/circle_progress.dart';
import 'package:bytebank/components/contact_item.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/transfers/transfers_form_contact.dart';
import 'package:bytebank/screens/transfers/transfers_form_value.dart';
import 'package:bytebank/services/repository/contact_repository.dart';
import 'package:bytebank/utils/route.dart';
import 'package:flutter/material.dart';

class TransfersListPage extends StatefulWidget with NamedRoute {
  @override
  _TransfersListPageState createState() => _TransfersListPageState();

  @override
  String get routeName => '/transfer-list';
}

class _TransfersListPageState extends State<TransfersListPage> {
  final ContactRepository _repository = ContactRepository();

  void pushToContactDao(BuildContext context) {
    pushWithSettings(context, TransfersFormContactPage()).then(
      (value) => setState(() {}),
    );
  }

  void pushToTransferValue(BuildContext context, Contact contact) {
    pushWithSettings(
        context,
        TransfersFormValuePage(
          contact: contact,
        )).then(
      (value) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Image.asset('images/logo-min.png', height: 30)],
        ),
        backgroundColor: Colors.cyan[800],
        elevation: 0,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.cyan[50],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Who do you want to transfer to?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 21),
                    children: [
                      TextSpan(
                        text: 'Find a contact',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' on your list or start a '),
                      TextSpan(
                        text: 'new transfer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                initialData: [],
                future: _repository.fetchContacts(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return CircleProgress(message: 'loading contacts');
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      List<Contact> contacts = snapshot.data;
                      if (contacts.length == 0) {
                        return Center(
                          child: Text('No contacts found'),
                        );
                      }
                      return Expanded(
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final Contact contact = contacts[index];
                            return ContactItem(
                              contact,
                              (selected) {
                                pushToTransferValue(context, selected);
                              },
                            );
                          },
                        ),
                      );
                  }
                  return Center(
                    child: Text('Error to list all contacts'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushToContactDao(context),
        child: Icon(Icons.person_add_alt_1),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
