//import 'dart:async';

import 'package:flutter/material.dart';
//import './home.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'package:Palma/screens/items_overview_screen.dart';
import './screens/food_detail_screen.dart';
import './screens/items_overview_screen.dart';
import './providers/food_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => FoodProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.orange,
          fontFamily: 'Lato',
        ),
        home: SplashScreen(),
        routes: {
          FoodDetailScreen.routeName: (ctx) => FoodDetailScreen(),
          // '/splash': (context)=> SplashScreen(),
          ItemsOveriewScreen.routeName: (ctx) => ItemsOveriewScreen()
          //  '/home': (context) => ItemsOveriewScreen()
        },
      ),
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
