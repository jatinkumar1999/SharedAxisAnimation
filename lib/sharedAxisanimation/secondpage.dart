import 'package:animation/sharedAxisanimation/firstpage.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  @override
  _secondPageState createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  bool isplay = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          Expanded(child: showCards()),
          button(context),
        ],
      ),
    );
  }

  Widget showCards() => PageTransitionSwitcher(
        duration: Duration(seconds: 1),
        reverse: true,
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
          child: child,
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
        ),
        child: isplay ? firstScreen() : secondscreen(),
      );

  Widget firstScreen() {
    return Container(
      alignment: Alignment.center,
      child: Image(
        image: AssetImage("assets/bricks.jpg"),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget secondscreen() {
    return Center(
      child: Container(
        child: Image(
          image: AssetImage("assets/soil.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget button(context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: () {
            setState(() {
              isplay = true;
            });
          },
          child: Text("Back")),
      OutlinedButton(
          onPressed: () {
            setState(() {
              isplay = !isplay;
            });
          },
          child: Text("Next"))
    ]);
  }
}
