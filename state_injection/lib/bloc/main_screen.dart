import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:state_injection/bloc/app_state.dart';

class MainScreenBloc {
  static int instanceCounter = 0;

  final _counter = BehaviorSubject.seeded(0);

  final AppStateBloc appStateBloc;

  Stream<int> get counter => _counter.stream;

  MainScreenBloc(this.appStateBloc) {
    if (++instanceCounter > 1) {
      throw Exception("Should never be two instances of MainScreenBloc");
    }
  }

  get appState => this.appStateBloc.appState;

  get toggleEnabled => this.appStateBloc.toggleEnabled;

  incrementCounter() async {
    final counterValue = await _counter.first;
    _counter.add(counterValue + 1);
  }

  void dispose() {
    _counter.close();
  }
}
