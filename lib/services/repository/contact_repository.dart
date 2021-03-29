import 'dart:convert';

import 'package:bytebank/models/models.dart';
import 'package:bytebank/services/http_cliente.dart';
import 'package:http_interceptor/http_interceptor.dart';

class ContactRepository {
  Future<List<Contact>> fetchContacts() async {
    final response = await client.get('$baseUrl/contacts'.toUri());
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Contact> contacts = [];
    for (Map<String, dynamic> contactJson in decodedJson) {
      final Contact transaction = Contact(
        name: contactJson['name'],
        document: contactJson['document'],
        agency: contactJson['agency'],
        account: contactJson['account_number'],
      );
      contacts.add(transaction);
    }
    return contacts;
  }
}
