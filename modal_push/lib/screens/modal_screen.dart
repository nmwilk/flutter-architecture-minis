import 'package:flutter/material.dart';

class ModalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modal"),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Text("Some text"),
        ),
      ),
    );
  }
}
