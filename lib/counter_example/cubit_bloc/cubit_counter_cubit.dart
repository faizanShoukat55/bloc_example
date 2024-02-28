import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cubit_counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
