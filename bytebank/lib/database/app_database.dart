import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:bytebank/models/contact.dart';

//que codigo extenso, eu preciso disso pra projetos futuros
Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      //o return aqui serve pra devolver o future pra podermos usar o .then pra pegar o valor do bd
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'account INTEGER)');
    }, version: 1);
  });
}

//todas as operações do sqflite vão operar por cima de um future, sempre vai ser uma requisição assincrona

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account'] = contact.account;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      // ignore: deprecated_member_use
      final List<Contact> contacts = List();
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}
