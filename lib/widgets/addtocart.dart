import 'package:firstapp/models/catalog_model.dart';
import 'package:firstapp/widgets/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;

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
                isInCart = isInCart.toggle();

                final _catalog = CatalogModel();
                _cart.catalog = _catalog;
                _cart.add(widget.catalog);
                setState(() {});
              }
            },
            child: isInCart
                ? Icon(Icons.done)
                : Icon(CupertinoIcons.cart_badge_plus))
        .h(40);
  }
}