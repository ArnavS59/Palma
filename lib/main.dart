import 'package:Palma/providers/cart.dart';
import 'package:Palma/providers/orders.dart';
import 'package:Palma/screens/cart_screen.dart';
import 'package:Palma/screens/orders.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'package:Palma/screens/items_overview_screen.dart';
import './screens/food_detail_screen.dart';
import './screens/items_overview_screen.dart';
import './providers/food_provider.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //When you create a new instance of an object we need to use the create method to provide data, but when we reuse an existing object use the .value provider
          create: (ctx) => FoodProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
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
          ItemsOveriewScreen.routeName: (ctx) => ItemsOveriewScreen(),
          //  '/home': (context) => ItemsOveriewScreen()
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
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
