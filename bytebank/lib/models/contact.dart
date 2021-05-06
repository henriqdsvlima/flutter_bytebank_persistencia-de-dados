class Contact {
  final int id;
  final String name;
  final int account;

  Contact(
    this.id,
    this.name,
    this.account,
  );
  @override
  String toString() => 'Contact(id: $id, name: $name, account: $account)';
}
