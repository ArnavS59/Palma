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
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                const Color(0xfff79d00),
                const Color(0xff56ab2f),
              ])),
        ),
        // backgroundColor: Colors.green,
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
