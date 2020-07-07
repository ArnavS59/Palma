import 'package:flutter/material.dart';

class FoodDetailScreen extends StatelessWidget {
  //const FoodDetailScreen({Key key}) : super(key: key);
  //final String title;
  static const routeName = "/food-detail";
  //FoodDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context).settings.arguments as String;
    //..
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
    );
  }
}
