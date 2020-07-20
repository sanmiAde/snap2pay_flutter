import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:snap2pay_flutter/repo/UserRepository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc(this._userRepository) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedToState();
    } else if (event is AuthenticationLoggedOut) {
      yield* _mapAuthenticationLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStartedToState() async* {
    final isSignedIn = await _userRepository.isSignedIn();
    //TODO : instead of adding a delay here. Overiding the transformer would be a better approach.
    await Future.delayed(Duration(seconds: 3));
    if (isSignedIn) {
      yield AuthenticationSuccess();
    } else {
      yield AuthenticationFailed();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedToState() async* {
    yield AuthenticationSuccess();
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedOutToState() async* {
    await _userRepository.signOut();
    yield AuthenticationFailed();
  }
}
