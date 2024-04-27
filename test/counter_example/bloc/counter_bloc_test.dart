import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_example/counter_example/bloc/counter_bloc.dart';
import 'package:flutter_bloc_example/counter_example/bloc/counter_event.dart';
import 'package:flutter_bloc_example/counter_example/bloc/counter_state.dart';
import 'package:flutter_bloc_example/counter_example/model/counter_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    const mockCounter = CounterModel();

    CounterBloc buildBloc() {
      return CounterBloc();
    }

    ///setup all dependencies before the test case
    setUp(() {});

    group('Constructor', () {
      ///test1
      test('Works Properly', () {
        expect(buildBloc, returnsNormally);
      });

      ///test2
      // test('has correct initial State', (){
      //   expect(buildBloc().state, equals(const CounterState()));
      // });
    });

    ///writing first bloc test
    /// 1-build  2-act 3-expect
    group('CounterStarted', () {
      ///1-bloc test
      blocTest('emit [success] when is load successfully for the first time',
          build: () => CounterBloc(),
          act: (bloc) => bloc.add(CounterStarted()),
          expect: () => [
                const CounterState(
                    counter: mockCounter, status: CounterStatus.success)
              ]);

      /// 2-bloc test
      blocTest('emit [] when counter is loaded again',
          build: () => CounterBloc(),
          seed: () => const CounterState(
              counter: mockCounter, status: CounterStatus.success),
          act: (bloc) => bloc.add(CounterStarted()),
          expect: () => []);
    });
  });
}
