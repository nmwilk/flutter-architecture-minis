import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class UserStateBloc {
  final _userLoggedIn = BehaviorSubject<bool>();

  Stream<bool> get userLoggedIn => _userLoggedIn.stream;

  Function(bool) get setUserLoggedIn => _userLoggedIn.sink.add;

  // fake some time before we have any data
  void initialiseState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _userLoggedIn.add(false);
    });
  }

  void doLogIn() {
    _userLoggedIn.add(true);
  }

  void doLogOut() {
    _userLoggedIn.add(false);
  }
}

// boiler-plate for BLoC creation
class UserStateProvider extends InheritedWidget {
  final _bloc = UserStateBloc();

  UserStateProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UserStateBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UserStateProvider)
    as UserStateProvider)
        ._bloc;
  }
}


