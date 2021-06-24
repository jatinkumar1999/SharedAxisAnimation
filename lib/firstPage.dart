import 'package:animation/main.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      reverseDuration: Duration(seconds: 2),
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform(
            transform:
                Matrix4.translationValues(animation.value * width, 0.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: Text("FirstPage")),
              ],
            ),
          );
        },
      ),
    );
  }
}
