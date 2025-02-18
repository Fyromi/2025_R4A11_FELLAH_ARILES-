import 'package:flutter/material.dart';

class Page2View extends StatelessWidget{
  const Page2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Page 2",
            style: TextStyle(color: Colors.white)),
        leading: GestureDetector(
            onTap: (){
                Navigator.pushReplacementNamed(context, '/mainPage');
            },
            child: Image.asset('assets/mugiCrew.png', height: 40),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Text("Je suis la")
      ),
    );
  }
}