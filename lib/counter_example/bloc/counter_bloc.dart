import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_example/counter_example/model/counter_model.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterStarted>(_onStarted);
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _onStarted(CounterStarted event, Emitter<CounterState> emit) {
    if (state.status == CounterStatus.success) return;
    CounterModel counter = const CounterModel();
    emit(CounterState(counter: counter, status: CounterStatus.success));
  }


  void _increment(IncrementCounter event, Emitter<CounterState> emit) {
    int value = state.counter.value+1;
    CounterModel counter=state.counter.copyWith(value: value);
    emit(state.copyWith(counter: counter));
  }

  void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
    int value = state.counter.value-1;
    CounterModel counter=state.counter.copyWith(value: value);
    emit(state.copyWith(counter: counter));
    // emit(state.copyWith(counter: state.counter - 1));
  }

// void _increment(IncrementCounter event, Emitter<CounterState> emit) {
//   emit(state.copyWith(counter: state.counter + 1));
// }
//
// void _decrement(DecrementCounter event, Emitter<CounterState> emit) {
//   emit(state.copyWith(counter: state.counter - 1));
// }
}
