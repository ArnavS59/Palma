import 'package:flutter/material.dart';
import 'package:Palma/models/food.dart';
import 'widgets/food_item.dart';

class ItemsOveriewScreen extends StatelessWidget {
  final List<Food> loadedItems = [
    Food(
      id: "p1",
      title: "CHickenShwarma",
      price: 10.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a chicken swahrma description",
    ),
    Food(
      id: "p2",
      title: "vegan ROll",
      price: 15.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a vegan roll description",
    ),
    Food(
      id: "p3",
      title: "Arabisch Dish",
      price: 20.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a arabisch dish description",
    ),
    Food(
      id: "p4",
      title: "Spring Roll",
      price: 70.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a Spring ROll description",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Palma"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedItems.length,
        itemBuilder: (ctx, i) => FoodItem(
            loadedItems[i].id,
            loadedItems[i].title,
            loadedItems[i].price,
            loadedItems[i].imageUrl),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }
}
