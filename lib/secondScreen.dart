import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You came here for no reason'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        color: Colors.green,
      )
    );
  }
}
