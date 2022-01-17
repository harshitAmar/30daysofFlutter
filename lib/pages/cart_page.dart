import 'package:firstapp/models/cart.dart';
import 'package:firstapp/store/store.dart';
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
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, _, __) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.theme.shadowColor)
                  .make();
            },
            mutations: const {RemoveMutation},
            notifications: {},
          ),
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

class _CartList extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                    ),
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
