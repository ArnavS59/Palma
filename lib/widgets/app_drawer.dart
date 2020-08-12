import 'package:flutter/material.dart';
import '../screens/orders.screen.dart';
import '../screens/items_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  //const AppDrawer({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Arnav Name"),
            accountEmail: Text("arnav123456@testing.com"),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  const Color(0xfff79d00),
                  const Color(0xff56ab2f),
                ])),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          // AppBar(
          //   flexibleSpace: Container(
          //     decoration: new BoxDecoration(
          //       gradient: new LinearGradient(
          //         colors: [Colors.cyan, Colors.yellow],
          //         stops: [0.5, 1.0],
          //       ),
          //     ),
          //   ),
          //   title: Text("Hello1"),
          //   automaticallyImplyLeading: false,
          // ),
          Divider(),
          ListTile(
              leading: Icon(Icons.shop),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ItemsOveriewScreen.routeName);
              }),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text("Orders"),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.routeName);
              })
        ],
      ),
    );
  }
}
