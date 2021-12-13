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
      ),
      body: Column(
        children: [_CartList().p32().expand(), Divider(), _CartTotal()],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999".text.xl4.color(context.theme.hintColor).make(),
          Material(
              color: context.theme.splashColor,
              borderRadius: BorderRadius.circular(28),
              child: MaterialButton(
                      onPressed: () {}, child: "Buy".text.bold.size(20).make())
                  .w32(context))
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: Icon(Icons.remove_circle_outline),
              title: "Item".text.make(),
            ));
  }
}
