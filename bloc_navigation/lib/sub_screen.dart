import 'package:flutter/material.dart';

class SubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sub screen",
        ),
      ),
      body: Center(
          child: Text(
        "This is the next screen",
        style: Theme.of(context).textTheme.title,
      )),
    );
  }
}
