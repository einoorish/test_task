import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(_Home());

class _Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  Color currentColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    const String text = "Hey there";
    const double fontSize = 40;

    final Paint textBorderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.black45;

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
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Colors.white,
                              foreground: textBorderPaint,
                          ),
                        ),
                        const Text(
                          text,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ),
        ),
    );
  }

  Color getRandomColor() {
    const opacity = 1.0;
    const maxChannelValue = 255;
    final Random random = Random();

    return Color.fromRGBO(
        random.nextInt(maxChannelValue),
        random.nextInt(maxChannelValue),
        random.nextInt(maxChannelValue),
        opacity,
    );
  }

}
