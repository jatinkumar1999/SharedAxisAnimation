import 'package:animation/firstPage.dart';
import 'package:animation/sharedAxisanimation/firstpage.dart';
import 'package:animation/sharedAxisanimation/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: secondPage(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  Animation secondanimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    animation = Tween(begin: -1.0, end: 0.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    secondanimation = Tween(begin: -0.7, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // body: Center(
      //     child: OpenContainer(
      //         transitionType: ContainerTransitionType.fade,
      //         transitionDuration: Duration(seconds: 1),
      //         closedBuilder: (context, openwidget) {
      //           return GestureDetector(
      //             onTap: openwidget,
      //             child: Container(
      //               color: Colors.lightBlue,
      //               alignment: Alignment.center,
      //               height: 300,
      //               width: 300,
      //               child: Text("Heloo dude"),
      //             ),
      //           );
      //         },
      //         openBuilder: (context, closeWidget) {
      //           return FirstPage();
      //         })),

      body: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Center(
            child: GestureDetector(
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FirstPage())),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Container(
                      width: 300,
                      height: 400,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text("Animation"),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        secondanimation.value * width, 0.0, 0.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()));
                        },
                        child: Text("Animation")),
                  )
                ],
              ),
            ),
          );
        },
      ),

      // body: Container(
      //   child: Center(
      //     child: ElevatedButton(
      //       onPressed: () => showCustomdialogue(context),
      //       child: Text("show Dialoge"),
      //     ),
      //   ),
      // ),
    );
  }

  // showCustomdialogue(BuildContext context) => showModal(
  //       configuration: FadeScaleTransitionConfiguration(
  //         transitionDuration: Duration(seconds: 3),
  //         reverseTransitionDuration: Duration(seconds: 3),
  //       ),
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         content: Text("Animated Dialoge"),
  //         actions: [
  //           OutlinedButton(
  //               style: OutlinedButton.styleFrom(
  //                   side: BorderSide(color: Colors.red)),
  //               onPressed: () => Navigator.pop(context),
  //               child: Text("Cancel"))
  //         ],
  //       ),
  //     );
}

// class SecondPage extends StatelessWidget {
//   const SecondPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             color: Colors.pink,
//             child: Text("Second Page",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 50,
//                 ))));
//   }
// }
