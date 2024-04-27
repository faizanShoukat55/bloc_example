


import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterStarted extends CounterEvent{}
class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}