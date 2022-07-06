import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const Home());

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: GestureDetector(
              onTap: () {
                setState((){
                  bgColor = getRandomColor();
                });
              },
              child: Container(
                color: bgColor,
                child: const Center(child: Text("Hey there")),
              )
            )
        )
    );
  }

  Color getRandomColor() {
    const opacity = 1.0;
    Random random = Random();

    return Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        opacity
    );
  }

}

