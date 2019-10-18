import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:state_injection/bloc/app_state.dart';
import 'package:state_injection/screen/main_screen.dart';
import 'package:state_injection/screen/sub_screen.dart';

// single instance, injected through constructors & BlocProvider
final _appStateBloc = AppStateBloc();

void main() => runApp(MyApp(_appStateBloc));

class MyApp extends StatelessWidget {
  final AppStateBloc _appStateBloc;

  MyApp(this._appStateBloc);

  @override
  Widget build(BuildContext context) {
    // BlocProvider, so that App State can be accessed via any sub-Widget
    return BlocProvider(
      bloc: _appStateBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) {
              if (settings.name == '/') {
                // App State injected directly, not via BlocProvider
                return MainScreen(_appStateBloc);
              } else {
                return SubScreen(int.parse(settings.name.substring(1)));
              }
            }
          );
        },
      ),
    );
  }
}
