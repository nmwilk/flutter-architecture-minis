import 'package:flutter/material.dart';

class ModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal"),
      ),
      body: Container(
        color: Colors.green,
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
