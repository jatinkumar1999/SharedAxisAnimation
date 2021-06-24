import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  Firstpage({Key key}) : super(key: key);

  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 300,
              height: 400,
              color: Colors.red,
              alignment: Alignment.center,
              child: Image(
                image: AssetImage("assets"),
              )),
          SizedBox(
            height: 30.0,
          ),
          OutlinedButton(onPressed: () {}, child: Text("Second Page Page"))
        ],
      ),
    );
  }
}
