import 'package:Palma/providers/food_provider.dart';
import 'package:flutter/material.dart';
import '../providers/food_provider.dart';
import 'package:provider/provider.dart';

class FoodDetailScreen extends StatelessWidget {
  //const FoodDetailScreen({Key key}) : super(key: key);
  //final String title;
  static const routeName = "/food-detail";
  //FoodDetailScreen(this.title);
  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context).settings.arguments as String;
    final loadedFood =
        Provider.of<FoodProvider>(context, listen: false).findById(foodId);
    //This is how the food you selected passes the data to the overview screen using providers it checks the id which was passed earlier using modalroute. Return true if the id of the product u looking at is the id you get in through the route.findbyUD in provider function logic sperated to make clean.
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedFood.title),
      ),
    );
  }
}
