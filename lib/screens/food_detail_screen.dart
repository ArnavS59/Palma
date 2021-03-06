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
    final globalKey = GlobalKey<ScaffoldState>();

    //This is how the food you selected passes the data to the overview screen using providers it checks the id which was passed earlier using modalroute. Return true if the id of the product u looking at is the id you get in through the route.findbyUD in provider function logic sperated to make clean.
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xfff79d00), const Color(0xff56ab2f)])),
      child: Scaffold(
        key: globalKey,
        //  backgroundColor: Colors.green,
        appBar: AppBar(
          elevation: 0,
          title: Text(loadedFood.title),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  const Color(0xfff79d00),
                  const Color(0xff56ab2f)
                ])),
          ),
        ),
        body: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color(0xfff79d00),
              const Color(0xff56ab2f)
            ])),
            //hero tag here
            height: size.height * 0.25,
            width: double.infinity,
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(300),
              child: Image.network(
                loadedFood.imageUrl,
                //  fit: BoxFit.fill,
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      color: Theme.of(context).accentColor,
                      // iconSize: 25,
                      //Change the location of favoruite buttin
                      icon: Icon(loadedFood.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        loadedFood.toggleFavoriteStatus();
                      },
                    ),
                    Text("Add to favourites"),
                    SizedBox(width: 10),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          loadedFood.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        //add ratings here if you want
                      ],
                    )),
                    ClipPath(
                      clipper: PricerCliper(),
                      child: Container(
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        height: 66,
                        width: 65,
                        color: Theme.of(context).accentColor,
                        child: Text(
                          "\$${loadedFood.price}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  loadedFood.description,
                  style: TextStyle(height: 3),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ), //Free space of 10% of total height
                Container(
                  height: size.width * 0.15,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    child: RaisedButton(
                      elevation: 10,
                      color: Colors.green,
                      onPressed: () {
                        cart.addItems(
                            loadedFood.id, loadedFood.price, loadedFood.title);
                        final snackbar = // Scaffold.of(context).showSnackBar(
                            SnackBar(
                          content: Text(
                            "Added item to cart",
                            textAlign: TextAlign.center,
                          ),
                          duration: Duration(seconds: 2),
                        );
                        globalKey.currentState.showSnackBar(snackbar);
                        //  );
                      },
                      child: Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            cart.addItems(
                              loadedFood.id,
                              loadedFood.price,
                              loadedFood.title,
                            );
                          },
                          color: Theme.of(context).accentColor,
                        ),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          )),
        ]),
      ),
    );
  }
}

class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
