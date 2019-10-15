import 'package:flutter/material.dart';

class PushReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('This screen is now the root of the app'),
              Container(height: 20),
              RaisedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                child: Text(
                  "Restart",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
