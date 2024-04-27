import 'package:flutter_bloc_example/counter_example/bloc/counter_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterEvent', () {
    group('CounterStarted', () {
      test('Support Value Equality', () {
        expect(CounterStarted(), CounterStarted());
      });

      test('Pops are correct', () {
        expect(CounterStarted().props, equals(<Object>[]));
      });
    });

    group('CounterIncremented', () {
      test('Support Value Equality', () {
        expect(IncrementCounter(), IncrementCounter());
      });
    });

    group('CounterDecremented', () {
      test('Support Value Equality', () {
        expect(DecrementCounter(), DecrementCounter());
      });
    });
  });
}
