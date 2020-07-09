import 'package:flutter/material.dart';
import 'package:Palma/screens/food_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/food.dart';
import '../providers/cart.dart';

class FoodItem extends StatelessWidget {
  //const FoodItem({Key key}) : super(key: key);

  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  // FoodItem(this.id, this.title, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Food>(context,
        listen: false); // State management no need to pass contructpr arguments
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(FoodDetailScreen.routeName, arguments: item.id);
        },
        child: GridTile(
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
          //header: , make the header the title and put the price in the footer
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
                icon: Icon(
                    item.isFavorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  item.toggleFavoriteStatus();
                },
                color: Theme.of(context).accentColor),
            title: Text(
              item.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItems(item.id, item.price, item.title);
              },
              color: Theme.of(context).accentColor,
            ),
            // subtitle: Text(price),
          ),
        ),
      ),
    );
  }
}
