import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../cubit_bloc/cubit_counter_cubit.dart';

class CounterScreenCubit extends StatefulWidget {
  const CounterScreenCubit({super.key});

  @override
  State<CounterScreenCubit> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreenCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Example"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                // context.read<CounterCubit>().add(IncrementCounter());
                context.read<CounterCubit>().increment();
              },
              child: const Text("Increment")),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Center(child: Text("${state.counter}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
            },
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                // context.read<CounterCubit>().add(DecrementCounter());
                context.read<CounterCubit>().decrement();
              },
              child: const Text("Decrement")),
        ],
      ),
    );
  }
}
