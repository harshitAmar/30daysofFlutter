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
            catalog.name.text.bold.lg.color(Colors.black).make(),
            catalog.desc.text.caption(context).make(),
            MyButtonBar(catalog: catalog)
          ],
        ))
      ],
    )).white.roundedLg.square(120).make().py16();
  }
}

class MyButtonBar extends StatelessWidget {
  final Item catalog;

  const MyButtonBar({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$${catalog.price}".text.xl2.bold.red800.make(),
        ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: "Buy".text.xl.bold.make())
            .w20(context)
      ],
    ).pOnly(right: 8);
  }
}
