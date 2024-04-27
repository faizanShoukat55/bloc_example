import 'package:equatable/equatable.dart';

import '../model/counter_model.dart';

enum CounterStatus { initial, loading, success, error }

class CounterState extends Equatable {
  final CounterModel counter;
  final CounterStatus status;

  const CounterState(
      {this.counter = const CounterModel(),
      this.status = CounterStatus.initial});

  CounterState copyWith({CounterModel? counter, CounterStatus? status}) {
    return CounterState(
        counter: counter ?? this.counter, status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter, status];
}

// class CounterState extends Equatable {
//   final int counter;
//
//   const CounterState({this.counter = 0});
//
//   CounterState copyWith({int? counter}) {
//     return CounterState(counter: counter ?? this.counter);
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [counter];
// }
