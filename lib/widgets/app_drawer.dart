import 'package:flutter/material.dart';
import '../screens/orders.screen.dart';
import '../screens/items_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.shop),
              title: Text("shop"),
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
