import 'package:flutter/material.dart';

class Food {
  // const FoodItem({Key key}) : super(key: key);

  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  // final String spicyness;

  Food(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.price,
      @required this.description
      // @required this.spicyness
      });
}
