import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqlite_api.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _name = 'name';
  static const String _id = 'id';
  static const String _account = 'account';
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account] = contact.account;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_account],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}

//  return openDatabase(
//       path,
//       onCreate: (db, version) {
//         //o return aqui serve pra devolver o future pra podermos usar o .then pra pegar o valor do bd
//         db.execute('CREATE TABLE contacts('
//             'id INTEGER PRIMARY KEY,'
//             'name TEXT,'
//             'account INTEGER)');
//       },
//       version: 1,
//       //onDowngrade: onDatabaseDowngradeDelete,
//     );
//   return getDatabasesPath().then((dbPath) {
//     final String path = join(dbPath, 'bytebank.db');
//
//   });
// }

//todas as operações do sqflite vão operar por cima de um future, sempre vai ser uma requisição assincrona

//Data Access Object = DAO

// return getDatabase().then((db) {
//   return db.query('contacts').then((maps) {
//     // ignore: deprecated_member_use
//     final List<Contact> contacts = List();
//     for (Map<String, dynamic> map in maps) {
//       final Contact contact = Contact(
//         map['id'],
//         map['name'],
//         map['account'],
//       );
//       contacts.add(contact);
//     }
//     return contacts;
//   });
// });
