//import 'dart:async';

import 'package:flutter/material.dart';
import './home.dart';
import './spash_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SpashScreen(),
      routes: {
        // '/splash': (context)=> SplashScreen(),
        '/home': (context) => Home()
      },
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text("Hello Arnav"),
//       ),
//     );
//   }
// }
