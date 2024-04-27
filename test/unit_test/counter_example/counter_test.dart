import 'package:flutter_bloc_example/unit_test/counter_example/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group("Counter Example Test", () {

    test('Default Value test', (){
      expect(Counter().value, 0);
    });
    test('Counter value should be incremented', (){
      /// Setup
      final counter=Counter();
      /// do
      counter.increment();
      ///test
      expect(counter.value, 1);
    });

    test('Counter Value should be decremented', () {
      ///Setup
      final counter=Counter();
      ///do
      counter.decrement();
      ///test
      expect(counter.value, -1);
    });
  });

}