import 'package:Palma/providers/food_provider.dart';
import 'package:flutter/material.dart';
import './food_item.dart';
import 'package:provider/provider.dart';

class ItemsGrid extends StatelessWidget {
  // const ItemsGrid({
  //   Key key,
  //   @required this.loadedItems,
  // }) : super(key: key);

  // final List<Food> loadedItems;

  final bool showFavs;
  ItemsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final foodData = Provider.of<FoodProvider>(context);
    final foods = showFavs ? foodData.favoriteitems : foodData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: foods.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //automatically cleans data , so overflow of data is prevented and memory leaks
        // create: (c) => foods[i],
        value: foods[i],
        child: FoodItem(
            //foods[i].id,
            //foods[i].title,
            //foods[i].price,
            // foods[i].imageUrl
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          //maxCrossAxisExtent: 400,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
