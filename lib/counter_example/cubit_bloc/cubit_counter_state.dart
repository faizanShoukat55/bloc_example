part of 'cubit_counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({this.counter = 0});

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}