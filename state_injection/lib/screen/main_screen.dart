import 'package:flutter/material.dart';
import 'package:state_injection/bloc/app_state.dart';
import 'package:state_injection/bloc/main_screen.dart';

class MainScreen extends StatefulWidget {
  final AppStateBloc _appStateBloc;

  MainScreen(this._appStateBloc) : super();

  @override
  _MainScreenState createState() => _MainScreenState(_appStateBloc);
}

class _MainScreenState extends State<MainScreen> {
  final AppStateBloc _appStateBloc;
  MainScreenBloc _mainScreenBloc;

  _MainScreenState(this._appStateBloc);

  @override
  void initState() {
    _mainScreenBloc = MainScreenBloc(_appStateBloc);
    super.initState();
  }

  @override
  void dispose() {
    _mainScreenBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Direct Injection"),
      ),
      body: StreamBuilder<AppState>(
          stream: _mainScreenBloc.appState,
          builder: (context, appStateSnapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _mainScreenBloc.toggleEnabled,
                    child: Text(
                      "Toggle Counter Button State",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                  RaisedButton(
                    onPressed: appStateSnapshot.hasData && appStateSnapshot.data.enabled ? _mainScreenBloc.incrementCounter : null,
                    child: Text(
                      "Increment Screen's Counter",
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  StreamBuilder<int>(
                    stream: _mainScreenBloc.counter,
                    builder: (context, snapshot) {
                      return Column(
                        children: <Widget>[
                          Text(
                            "Counter: ${snapshot.data}",
                            style: TextStyle(fontSize: 22),
                          ),
                          Container(
                            height: 40,
                          ),
                          RaisedButton(
                            onPressed: () => Navigator.pushNamed(context, "/${snapshot.data}"),
                            child: Text(
                              "Open Sub Screen",
                              style: TextStyle(fontSize: 26),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ],
              ),
            );
          }),
    );
  }
}
