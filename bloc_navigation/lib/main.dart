import 'dart:async';

import 'package:bloc_navigation/sub_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          if (settings.name == '/subscreen') {
            return SubScreen();
          } else {
            return MyHomePage();
          }
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = Bloc();

  @override
  void initState() {
    _bloc._action.stream.listen((action) {
      print('Action $action');
      if (action == Action.GoToNextScreen) {
        Navigator.pushNamed(context, '/subscreen');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigate on events"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Press this to do something asynchronously that, when completed, will go to another screen',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
            ),
            StreamBuilder<bool>(
              stream: _bloc.buttonEnabledStream,
              builder: (context, snapshot) {
                return RaisedButton(
                  onPressed: !snapshot.hasData || snapshot.data ? _bloc.startAsync : null,
                  child: Text(
                    'Do Something',
                    style: Theme.of(context).textTheme.display1,
                  ),
                );
              }
            ),
            Container(
              height: 20,
            ),
            StreamBuilder<bool>(
                stream: _bloc.buttonEnabledStream,
                builder: (context, snapshot) {
                  return Visibility(
                    child: CircularProgressIndicator(),
                    visible: snapshot.hasData && !snapshot.data,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Bloc {
  final _action = StreamController<Action>();
  final _buttonEnabled = StreamController<bool>.broadcast();

  Stream<Action> get actionStream => _action.stream;
  Stream<bool> get buttonEnabledStream => _buttonEnabled.stream;

  startAsync() {
    _buttonEnabled.add(false);
    _action.add(Action.InFlight);
    Future.delayed(Duration(milliseconds: 2000), () {
      _action.add(Action.GoToNextScreen);
      _buttonEnabled.add(true);
    });
  }

  dispose() {
    _action.close();
    _buttonEnabled.close();
  }
}

enum Action { InFlight, GoToNextScreen }
