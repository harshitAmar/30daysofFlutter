import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firstapp/models/cart.dart';
import 'package:firstapp/store/store.dart';
import 'package:firstapp/utils/routes.dart';
import 'package:firstapp/widgets/cataloglist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:firstapp/models/catalog_model.dart';

import '../widgets/catalogheader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, __) {
            return FloatingActionButton(
              child: Icon(CupertinoIcons.cart),
              backgroundColor: context.theme.splashColor,
              onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            ).badge(
              color: Colors.black,
              size: 26,
              count: _cart.items.length,
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            );
          }),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader().pOnly(bottom: 16),
                  if (CatalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    Center(
                      child: CircularProgressIndicator().centered().expand(),
                    )
                ],
              ))),
    );
  }
}
