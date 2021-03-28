import 'package:bytebank/components/contact_item.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form_page.dart';
import 'package:flutter/material.dart';

class ContactListPage extends StatefulWidget {
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Contacts',
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
            child: FutureBuilder(
              initialData: [],
              future: _dao.findAll(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          'loading contacts',
                          style: TextStyle(color: Colors.grey[500]),
                        )
                      ],
                    );
                  case ConnectionState.active:
                    break;
                  case ConnectionState.done:
                    List<Contact> contacts = snapshot.data;
                    if (contacts.length == 0) {
                      return Center(
                        child: Text('No contacts found'),
                      );
                    }
                    return ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        final Contact contact = contacts[index];
                        return ContactItem(contact, () {});
                      },
                    );
                }
                return Center(
                  child: Text('Error to list all contacts'),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactFormPage(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
