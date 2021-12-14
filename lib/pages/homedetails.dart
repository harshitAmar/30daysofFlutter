import 'package:firstapp/models/catalog_model.dart';
import 'package:firstapp/widgets/cataloglist.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;
  const HomeDetails({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColorDark,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 30,
        ),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}"
              .text
              .xl2
              .bold
              .color(context.theme.hintColor)
              .make(),
          Material(
            color: context.theme.splashColor,
            borderRadius: BorderRadius.circular(28),
            child: MaterialButton(
                    onPressed: () {},
                    child: "Add to cart".text.bold.size(20).make())
                .wOneForth(context),
          ).w32(context)
        ],
      ).pOnly(left: 24, right: 24).backgroundColor(context.theme.shadowColor),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image).h32(context)),
            Expanded(
                child: VxArc(
                    height: 30,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      width: context.screenWidth,
                      color: context.theme.cardColor,
                      child: Column(
                        children: [
                          catalog.name.text.bold.xl4
                              .color(context.theme.hintColor)
                              .make(),
                          catalog.desc.text.xl.caption(context).make(),
                          20.heightBox,
                          Expanded(
                              child:
                                  "Sit sea eos kasd et erat. Duo stet accusam stet ut clita amet. Elitr dolores ipsum sea est est sit duo invidunt ea, erat ea amet sit elitr lorem vero magna ipsum kasd, eirmod aliquyam sanctus invidunt diam, justo aliquyam et ipsum diam et diam kasd et, aliquyam sit gubergren."
                                      .text
                                      .size(17)
                                      .fontFamily("lato")
                                      .normal
                                      .align(TextAlign.justify)
                                      .make()
                                      .px32())
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
