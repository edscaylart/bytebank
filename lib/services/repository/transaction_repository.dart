import 'dart:convert';

import 'package:bytebank/models/models.dart';
import 'package:bytebank/services/http_cliente.dart';
import 'package:http_interceptor/http_interceptor.dart';

class TransactionRepository {
  Future<List<Transaction>> fetchTransactions() async {
    final response = await client
        .get('$baseUrl/transactions'.toUri())
        .timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  // ignore: missing_return
  Future<Transaction> save(Transaction transaction, String password) async {
    final response = await client.post('$baseUrl/transactions'.toUri(),
        headers: {
          'Content-Type': 'application/json',
          'password': password,
        },
        body: jsonEncode(transaction.toJson()));

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(getResponseMessage(response.statusCode));
  }
}
