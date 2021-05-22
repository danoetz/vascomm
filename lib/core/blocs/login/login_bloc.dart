import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();
      try {
        var user = await Future.delayed(Duration(seconds: 3)).then((value) => true);
        if (user) {
          yield LoginSuccess(message: "Login berhasil");
        } else {
          yield LoginFailure(error: "Login gagal");
        }
      } catch (error) {
        yield LoginFailure(error: "Network error");
      }
    }
  }
}
