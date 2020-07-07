import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  //const FoodItem({Key key}) : super(key: key);

  final String id;
  final String title;
  final String imageUrl;
  final double price;

  FoodItem(this.id, this.title, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        //header: , make the header the title and put the price in the footer
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: null,
              color: Theme.of(context).accentColor),
          title: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: null,
            color: Theme.of(context).accentColor,
          ),
          // subtitle: Text(price),
        ),
      ),
    );
  }
}
