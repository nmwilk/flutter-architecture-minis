import 'package:flutter/material.dart';

class PushScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push"),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text("Some text"),
        ),
      ),
    );
  }
}
