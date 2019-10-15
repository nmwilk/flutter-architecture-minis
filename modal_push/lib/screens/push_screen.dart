import 'package:flutter/material.dart';

class PushScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text("Some text",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
