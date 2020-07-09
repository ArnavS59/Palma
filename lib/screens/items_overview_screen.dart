import 'package:Palma/widgets/items_grid.dart';
import 'package:flutter/material.dart';

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
        title: Text("Palma"),
        actions: <Widget>[
          PopupMenuButton(
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
          )
        ],
      ),
      body: ItemsGrid(_showFavsOnly),
    );
  }
}
