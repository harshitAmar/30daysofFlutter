import 'package:firstapp/models/catalog_model.dart';
import 'package:firstapp/pages/homedetails.dart';
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
        final catalog = CatalogModel.getByPosition(index);
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
                Material(
                  color: context.theme.cardColor,
                  borderRadius: BorderRadius.circular(25),
                  child: MaterialButton(
                          onPressed: () {},
                          child: "Add to cart".text.size(15).make())
                      .wOneForth(context)
                      .h(40),
                )
              ],
            )
          ],
        ))
      ],
    )).color(context.theme.shadowColor).roundedLg.square(120).make().py16();
  }
}
