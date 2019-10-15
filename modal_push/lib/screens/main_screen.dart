import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_push/screens/modal_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal and Push Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Open Modal",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => ModalScreen())),
            ),
            Container(height: 20),
            RaisedButton(
              child: Text(
                "Open Push",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () => Navigator.pushNamed(context, '/push'),
            ),
          ],
        ),
      ),
    );
  }
}
