import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'HI Arnav Login Page ',
          //style: new TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text("Hello Arnav"),
      ),
    );
  }
}
