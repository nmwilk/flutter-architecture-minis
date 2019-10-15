import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:login_swap/app_root.dart';
import 'package:login_swap/user_state_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserStateBloc userStateBloc;

  @override
  void initState() {
    userStateBloc = UserStateBloc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: userStateBloc,
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
