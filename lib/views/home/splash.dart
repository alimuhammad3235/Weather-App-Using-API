import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weatherapp/utils/images.dart';
import 'package:weatherapp/views/home/home_view.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Horizon',
);

class _MySplashState extends State<MySplash> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHome()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Column(
            children: [
              Image.asset(
                ImageConst.bgimg1,
                width: 300,
              ),
              SizedBox(
                width: 300.0,
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText('Weather App',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                        textDirection: TextDirection.ltr),
                  ],
                  isRepeatingAnimation: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
