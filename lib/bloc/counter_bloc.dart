import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterState {
  final int counter;

  CounterState({required this.counter});
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementEvent>((event, emit) {
      final newValue = state.counter + 1;
      print('Incremented value,  new value :$newValue ');
      emit(CounterState(counter: newValue));
    });
    on<DecrementEvent>((event, emit) {
      if (state.counter > 0) {
        final afterValue = state.counter - 1;
        print('Decremented value , new value: $afterValue');
        emit(CounterState(counter: afterValue));
      } else {
        print('Counter is already 0 cannot decrement');
      }
    });
  }
}
