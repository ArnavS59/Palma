import 'package:Palma/widgets/items_grid.dart';
import 'package:flutter/material.dart';

class ItemsOveriewScreen extends StatelessWidget {
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Palma"),
      ),
      body: ItemsGrid(),
    );
  }
}
