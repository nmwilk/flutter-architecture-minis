import 'dart:core';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class AppStateBloc extends Bloc {
  static int instanceCounter = 0;

  final _appStateStream = BehaviorSubject.seeded(AppState(false));
  get appState => _appStateStream.stream;

  AppStateBloc() {
    if (++instanceCounter > 1) {
      throw Exception("Should never be two instances of AppStateBloc");
    }
  }

  @override
  void dispose() {
    _appStateStream.close();
  }

  toggleEnabled() async {
    final appState = (await _appStateStream.first).toggle();
    _appStateStream.sink.add(appState);
  }
}

class AppState {
  bool enabled = false;

  AppState(this.enabled);

  AppState toggle() {
    enabled = !enabled;
    return this;
  }
}
