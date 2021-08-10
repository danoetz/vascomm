import 'package:danoetz_vascomm/core/blocs/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:danoetz_vascomm/shared/styles/styles.dart';
import 'package:danoetz_vascomm/core/blocs/authentication/authentication_bloc.dart';
import 'package:danoetz_vascomm/ui/login/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: MyColors.primary,
      theme: kDefaultTheme,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationSuccess) {
            return BlocProvider<LoginBloc>(
              create: (_) => LoginBloc()..add(LoginInit()),
              child: LoginScreen(),
            );
          } else if (state is AuthenticationFailure) {
            return Container();
          } else if (state is AuthenticationInProgress) {
            return Container();
          }
          return Container();
        },
      ),
    );
  }
}
