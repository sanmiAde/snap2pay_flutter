import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(RegistrationState initialState) : super(initialState);

  @override
  RegistrationState get initialState => InitialRegistrationState();

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    // TODO: Add your event logic
  }
}
