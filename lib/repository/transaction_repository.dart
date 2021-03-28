import 'dart:convert';

import 'package:bytebank/interceptors/http_interceptor.dart';
import 'package:bytebank/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

const baseUrl = 'http://192.168.100.20:3333';

class TransactionRepository {
  http.Client client = HttpClientWithInterceptor.build(interceptors: [
    HttpInterceptor(),
  ]);

  Future<List<Transaction>> fetchTransactions() async {
    try {
      final response = await http.get('$baseUrl/transactions'.toUri());
      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body);
        return decodedJson
            .map((dynamic json) => Transaction.fromJson(json))
            .toList();
      } else {
        throw Exception("Error while fetching. \n ${response.body}");
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<Transaction> save(Transaction transaction) async {
    try {
      final response = await http.post('$baseUrl/transactions'.toUri(),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(transaction.toJson()));

      if (response.statusCode == 200) {
        final transaction = Transaction.fromJson(jsonDecode(response.body));
        return transaction;
      } else {
        throw Exception("Error while saving. \n ${response.body}");
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
