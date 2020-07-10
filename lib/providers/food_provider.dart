import 'package:flutter/material.dart';
import 'food.dart';

class FoodProvider with ChangeNotifier {
  List<Food> _items = [
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
    Food(
      id: "p5",
      title: "CHickenShwarma",
      price: 10.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a chicken swahrma description",
    ),
    Food(
      id: "p6",
      title: "CHickenShwarma",
      price: 10.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a chicken swahrma description",
    ),
    Food(
      id: "p7",
      title: "CHickenShwarma",
      price: 10.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a chicken swahrma description",
    ),
    Food(
      id: "p8",
      title: "CHickenShwarma",
      price: 10.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a chicken swahrma description",
    ),
    Food(
      id: "p9",
      title: "CHickenShwarma",
      price: 10.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a chicken swahrma description",
    ),
    Food(
      id: "p10",
      title: "CHickenShwarma",
      price: 10.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      description: "THis is a chicken swahrma description",
    ),
  ];

  //var _showFavouritesOnly = false;

  //will return a pointer at memory if this chnages then u get direct access to it, u might edit this and u will need this later

  List<Food> get items {
    // if (_showFavouritesOnly) {
    //   return _items.where((element) => element.isFavorite).toList();
    //}
    return [..._items]; //returns a copy
  }

  List<Food> get favoriteitems {
    return _items.where((element) => element.isFavorite).toList();
  }

  // void showFavoritesOnly() {
  //   _showFavouritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavouritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }

  Food findById(String id) {
    return _items.firstWhere((food) => food.id == id);
  } //Core logic hidden here in the provider ckass so the logic stays pretty clewean
}
