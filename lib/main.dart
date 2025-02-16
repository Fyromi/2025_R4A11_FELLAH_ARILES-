import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  int compteur = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HomePage"), elevation: 12),
        body: Center(child: Text("Bonjour $compteur")),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                compteur += 1;
              });
            },
            child: Icon(Icons.add)));
  }
}