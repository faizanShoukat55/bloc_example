import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
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
                context.read<CounterBloc>().add(IncrementCounter());
              },
              child: const Text("Increment")),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(child: Text("${state.counter}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
            },
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<CounterBloc>().add(DecrementCounter());
              },
              child: const Text("Decrement")),
        ],
      ),
    );
  }
}
