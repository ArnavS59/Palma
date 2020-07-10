import 'package:Palma/providers/food_provider.dart';
import 'package:flutter/material.dart';
import '../providers/food_provider.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

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
    final cart = Provider.of<Cart>(context, listen: false);
    //This is how the food you selected passes the data to the overview screen using providers it checks the id which was passed earlier using modalroute. Return true if the id of the product u looking at is the id you get in through the route.findbyUD in provider function logic sperated to make clean.
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedFood.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            //hero tag here
            height: 282,
            width: double.infinity,
            child: Image.network(loadedFood.imageUrl),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "\$${loadedFood.price}",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              loadedFood.description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          IconButton(
              //Change the location of favoruite buttin
              icon: Icon(loadedFood.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                loadedFood.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              // color: Colors.red, add elevation
              width: 300,
              height: 60,
              child: Card(
                elevation: 10,
                child: RaisedButton(
                  elevation: 10,
                  color: Colors.green,
                  onPressed: () {
                    cart.addItems(
                        loadedFood.id, loadedFood.price, loadedFood.title);
                  },
                  child: Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Text(
                        "Add to Cart",
                        //textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        cart.addItems(
                            loadedFood.id, loadedFood.price, loadedFood.title);
                      },
                      color: Theme.of(context).accentColor,
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
