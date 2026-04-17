import 'package:flutter_bloc/flutter_bloc.dart';

//event
abstract class PasswordEvent {}

class TogglePasswordVisibility extends PasswordEvent {}

//state
class PasswordState {
  final bool isHidden;

  PasswordState({required this.isHidden});
}

//bloc
class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordState(isHidden: true)) {
    on<TogglePasswordVisibility>((event, emit) {
      //emit new state with toggle value
      emit(
        PasswordState(isHidden: !state.isHidden),
      ); //!state.isHidden flips the value, where true=> shows password and false=> hides password
    });
  }
}
