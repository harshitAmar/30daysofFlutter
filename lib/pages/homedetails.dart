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
      backgroundColor: Colors.teal.shade50,
      bottomNavigationBar: ButtonBar(
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
      ).pOnly(right: 8),
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
                      color: Colors.white,
                      child: Column(
                        children: [
                          catalog.name.text.bold.xl4.color(Colors.black).make(),
                          catalog.desc.text.xl.caption(context).make(),
                          20.heightBox,
                          Expanded(
                              child:
                                  "Sit sea eos kasd et erat. Duo stet accusam stet ut clita amet. Elitr dolores ipsum sea est est sit duo invidunt ea, erat ea amet sit elitr lorem vero magna ipsum kasd, eirmod aliquyam sanctus invidunt diam, justo aliquyam et ipsum diam et diam kasd et, aliquyam sit gubergren."
                                      .text
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
