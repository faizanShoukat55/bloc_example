import 'package:flutter_bloc_example/counter_example/bloc/counter_state.dart';
import 'package:flutter_bloc_example/counter_example/model/counter_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter State', () {
    const counterMock = CounterModel();

    group('CounterState initial', () {
      const statusMock = CounterStatus.initial;
      CounterState createSubject() {
        return const CounterState(status: statusMock, counter: counterMock);
      }

      test('Supports Equality', () {
        expect(createSubject(), equals(createSubject()));
      });

      test('props are correct', () {
        expect(
            createSubject().props, equals(<Object?>[counterMock, statusMock]));
      });

      ///status changed test
      test('return object with updated status', () {
        expect(createSubject().copyWith(status: CounterStatus.initial),
            const CounterState(counter: counterMock, status: statusMock));
      });
    });
  });
}
