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
      ),
      backgroundColor: Colors.teal.shade50,
      bottomNavigationBar: MyButtonBar(catalog: catalog).p16(),
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
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
