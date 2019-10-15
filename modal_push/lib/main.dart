import 'package:flutter/material.dart';
import 'package:modal_push/screens/main_screen.dart';
import 'package:modal_push/screens/push_replacement_screen.dart';
import 'package:modal_push/screens/push_screen.dart';

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
        home: MainScreen(),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            if (settings.name == '/push') {
              return PushScreen();
            } else if (settings.name == '/replace') {
              return PushReplacementScreen();
            } else {
              return MainScreen();
            }
          });
        });
  }
}
