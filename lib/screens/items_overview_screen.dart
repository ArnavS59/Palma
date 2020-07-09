import 'package:Palma/screens/cart_screen.dart';
import 'package:Palma/widgets/app_drawer.dart';
import 'package:Palma/widgets/items_grid.dart';
import 'package:flutter/material.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ItemsOveriewScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  _ItemsOveriewScreenState createState() => _ItemsOveriewScreenState();
}

class _ItemsOveriewScreenState extends State<ItemsOveriewScreen> {
  var _showFavsOnly = false;

  @override
  Widget build(BuildContext context) {
    // final foodContainer = Provider.of<FoodProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Palma",
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                //rebuilds UI
                if (selectedValue == FilterOptions.Favorites) {
                  _showFavsOnly = true;
                }
                //   foodContainer.showFavoritesOnly();
                else {
                  // foodContainer.showAll();
                  _showFavsOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("only favourites"),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text("Show all"),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
              builder: (_, cartData, ch) => Badge(
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                    ),
                    value: cartData.itemCount.toString(),
                  ))
        ],
      ),
      drawer: AppDrawer(),
      body: ItemsGrid(_showFavsOnly),
    );
  }
}
