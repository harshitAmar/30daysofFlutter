import 'package:firstapp/models/catalog_model.dart';
import 'package:firstapp/models/cart.dart';
import 'package:firstapp/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                context.theme.cardColor,
              ),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
            ),
            onPressed: () {
              if (!isInCart) {
                AddMutation(catalog);
              }
            },
            child: isInCart
                ? Icon(Icons.done)
                : Icon(CupertinoIcons.cart_badge_plus))
        .h(40);
  }
}
