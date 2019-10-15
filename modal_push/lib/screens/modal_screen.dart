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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Pop'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
