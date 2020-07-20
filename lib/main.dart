import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap2pay_flutter/blocs/authentication/Authentication.dart';
import 'package:snap2pay_flutter/pages/LogInScreen.dart';
import 'package:snap2pay_flutter/pages/SplashScreen.dart';
import 'package:snap2pay_flutter/repo/UserRepository.dart';
import 'package:snap2pay_flutter/utils/SimpleObserver.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider(
      create: (_) =>
          AuthenticationBloc(userRepository)..add(AuthenticationStarted()),
      child: MyApp(userRepository)));
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  MyApp(UserRepository this._userRepository);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snap 2 Pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is AuthenticationInitial) {
          return SplashScreen();
        } else if (state is AuthenticationFailed) {
          return LogInScreen();
        }

        return Container();
      }),
    );
  }
}
