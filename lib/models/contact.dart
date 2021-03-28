class Contact {
  int id;
  String name;
  String document;
  int agency;
  int account;
  DateTime createdAt;

  Contact({
    this.id,
    this.name,
    this.document,
    this.agency,
    this.account,
    this.createdAt,
  });

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        document = json['document'],
        agency = json['agency'],
        account = json['account_number'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'document': document,
        'agency': agency,
        'account_number': account,
      };

  @override
  String toString() {
    return '${this.name} -> ag: ${this.agency} | cc: ${this.account}';
  }
}
