import 'dart:convert';

import 'package:bytebank/interceptors/http_interceptor.dart';
import 'package:bytebank/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class ContactRepository {
  http.Client client = HttpClientWithInterceptor.build(interceptors: [
    HttpInterceptor(),
  ]);

  Future<List<Contact>> fetchContacts() async {
    try {
      final response =
          await http.get('http://192.168.100.20:3333/contacts'.toUri());
      if (response.statusCode == 200) {
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
      } else {
        throw Exception("Error while fetching. \n ${response.body}");
      }
    } catch (e) {
      print(e);
    }
    return [];
  }
}
