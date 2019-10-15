import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:state_injection/bloc/app_state.dart';

class SubScreen extends StatelessWidget {
  final int _counterValue;

  SubScreen(this._counterValue) : super();

  @override
  Widget build(BuildContext context) {
    final appStateBloc = BlocProvider.of<AppStateBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Injection"),
      ),
      body: StreamBuilder<AppState>(
          stream: appStateBloc.appState,
          builder: (context, appStateSnapshot) {
            return Container(
              color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Counter at $_counterValue",
                      style: TextStyle(fontSize: 22),
                    ),
                    Container(height: 40),
                    Text(
                      "Button Enabled? ${appStateSnapshot.hasData && appStateSnapshot.data.enabled}",
                      style: TextStyle(fontSize: 22),
                    ),
                    RaisedButton(
                      onPressed: appStateBloc.toggleEnabled,
                      child: Text(
                        "Toggle Counter Button State",
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
