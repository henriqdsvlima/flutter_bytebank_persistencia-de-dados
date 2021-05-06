import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f5),
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.green[900],
      ),
      body: Column(
        //CrossAxisAlignment = alinhamento transversal (horizontal)
        //MainAxisAlignment = alinhamento vertical
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              height: 100,
              width: 150,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.people,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    'Contacts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
