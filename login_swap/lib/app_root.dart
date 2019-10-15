import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:login_swap/user_state_bloc.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userStateBloc = BlocProvider.of<UserStateBloc>(context);
    return StreamBuilder<bool>(
        stream: userStateBloc.userLoggedIn,
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: snapshot.hasData
                  ? screen(userStateBloc, snapshot.data)
                  : Center(
                      // not actually required, but here for clarity
                      key: Key("c"),
                      child: CircularProgressIndicator(),
                    ));
        });
  }

  Widget screen(UserStateBloc userStateBloc, bool loggedIn) {
    return Container(
      // so it's treated as a different widget, removing this means it won't be
      // animated because we're using the same types (as explained in official
      // AnimatedSwitcher docs).
      key: Key(loggedIn ? "a" : "b"),
      color: loggedIn ? Colors.blue : Colors.white,
      child: Center(
        child: loggedIn
            ? FlatButton(
                onPressed: userStateBloc.doLogOut,
                child: Text("Log Out"),
                color: Colors.white,
              )
            : FlatButton(
                onPressed: userStateBloc.doLogIn,
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
      ),
    );
  }
}
