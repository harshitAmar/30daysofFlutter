import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: "Cart".text.make(),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
        ),
        onPressed: () => Navigator.of(context).pop(),
        iconSize: 30,
      ),
      backgroundColor: Colors.transparent,
    ));
  }
}
