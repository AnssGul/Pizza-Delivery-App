import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'app_view.dart';
import 'blocs/authentication_bloc.dart';
class MyApp extends StatelessWidget {
  UserRepository userRepository;
  MyApp(this.userRepository,{super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
        create:(context)=> AuthenticationBloc(
          userRepository: userRepository,
        ),
      child: MyAppView(),
    );

  }
}