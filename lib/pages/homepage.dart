import 'package:firstapp/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final days = 30;
  final name = "Codepur";

  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
      ),
      body: Center(
        child: Text("Welcome to $days days of flutter from $name"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
