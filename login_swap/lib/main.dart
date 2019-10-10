import 'package:flutter/material.dart';
import 'package:login_swap/app_root.dart';
import 'package:login_swap/user_state_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserStateProvider(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Animated Transition Demo"),
          ),
          body: AppRoot(),
        ),
      ),
    );
  }
}
