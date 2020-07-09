import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  //const CartItem({Key key}) : super(key: key);
  final String id;
  final String foodid;
  final double price;
  final int quantity;
  final String title;
  CartItem(
    this.id,
    this.foodid,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(foodid);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      child: Card(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 4,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(child: Text('\$$price'))),
              ),
              title: Text(title),
              subtitle: Text("Total: \$${price * quantity}"),
              //   trailing: Text("$quantity x"),
              trailing: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: (quantity > 1)
                          ? () => {
                                Provider.of<Cart>(context, listen: false)
                                    .addOrRemoveQuantity(foodid, false)
                              }
                          : () => {
                                Provider.of<Cart>(context, listen: false)
                                    .removeItem(foodid)
                              },
                      icon: Icon(Icons.remove, color: Colors.black),
                    ),
                    Text('${quantity}x'),
                    IconButton(
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .addOrRemoveQuantity(foodid, true);
                      },
                      icon: Icon(Icons.add, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
