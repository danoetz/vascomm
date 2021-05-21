import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:danoetz_vascomm/app.dart';
import 'package:danoetz_vascomm/bloc_observer.dart';
import 'package:danoetz_vascomm/core/blocs/authentication/authentication_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc()..add(AuthenticationStarted());
      },
      child: App(),
    ),
  );
}
