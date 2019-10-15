import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class UserStateBloc extends Bloc {
  final _userLoggedIn = BehaviorSubject<bool>();

  Stream<bool> get userLoggedIn => _userLoggedIn.stream;

  Function(bool) get setUserLoggedIn => _userLoggedIn.sink.add;

  UserStateBloc() {
    // fake some time before we have any data, i.e. neither true nor false
    Future.delayed(Duration(milliseconds: 2000), () {
      _userLoggedIn.add(false);
    });
  }

  @override
  void dispose() {
    _userLoggedIn.close();
  }

  void doLogIn() {
    _userLoggedIn.add(true);
  }

  void doLogOut() {
    _userLoggedIn.add(false);
  }
}
