import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const Home());

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Color currentColor = Colors.white;


  @override
  Widget build(BuildContext context) {
    const String text = "Hey there";

    final Paint textBorderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black45;

    const textStyle = TextStyle(
        fontSize: 40,
        color: Colors.white
    );

    return MaterialApp(
        home: Scaffold(
            body: GestureDetector(
              onTap: () {
                setState((){
                  currentColor = getRandomColor();
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                decoration:BoxDecoration(color: currentColor),
                child: Center(
                    child: Stack(
                      children: <Widget>[
                        Text(
                          text,
                          style: textStyle.copyWith(foreground: textBorderPaint),
                        ),
                        Text(
                          text,
                          style: textStyle
                        ),
                      ],
                    )
                ),
              ),
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

