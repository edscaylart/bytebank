class Contact {
  final int id;
  final String name;
  final String document;
  final int agency;
  final int account;

  Contact(
    this.name,
    this.document,
    this.agency,
    this.account, {
    this.id,
  });

  @override
  String toString() {
    return '${this.name} -> ag: ${this.agency} | cc: ${this.account}';
  }
}
