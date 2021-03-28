import 'package:bytebank/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;
  DateTime createdAt;

  Transaction({
    this.value,
    this.contact,
    this.createdAt,
  });

  Transaction.fromJson(Map<String, dynamic> json)
      : value = double.tryParse(json['value'].toString()),
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transaction{value: R\$ $value | contact: $contact}';
  }
}
