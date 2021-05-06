import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _accountController = TextEditingController();

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
            ),
            TextField(
              controller: _accountController,
              decoration: InputDecoration(
                labelText: 'Numero do Telefone',
              ),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: Text(
                    'Criar',
                  ),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int account = int.tryParse(_accountController.text);
                    final Contact newContact = Contact(0, name, account);

                    Navigator.pop(context, newContact);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
