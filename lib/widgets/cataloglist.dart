import 'package:firstapp/models/catalog_model.dart';
import 'package:firstapp/pages/homedetails.dart';
import 'package:firstapp/widgets/cart.dart';
import 'package:firstapp/widgets/catalogimage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetails(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text
                .size(20)
                .color(context.theme.primaryColorDark)
                .make(),
            catalog.desc.text.sm.normal
                .color(context.theme.splashColor)
                .caption(context)
                .make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price}"
                    .text
                    .color(context.theme.hintColor)
                    .size(18)
                    .bold
                    .make(),
                _AddToCart(
                  catalog: catalog,
                )
              ],
            )
          ],
        ))
      ],
    )).color(context.theme.shadowColor).roundedLg.square(120).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
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
              isAdded = isAdded.toggle();
              final _catalog = CatalogModel();
              final _cart = CartModel();
              _cart.catalog = _catalog;
              _cart.add(widget.catalog);
              setState(() {});
            },
            child:
                isAdded ? Icon(Icons.done) : "Add to cart".text.size(15).make())
        .h(40);
  }
}
