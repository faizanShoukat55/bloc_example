import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/multiple_state_example/bloc/switch_event.dart';

import 'bloc/switch_bloc.dart';
import 'bloc/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Example"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("Notifications"),
              BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous,current)=> previous.isSwitch!=current.isSwitch,
                builder: (context, state) {
                  return Switch(value: state.isSwitch, onChanged: (newValue) {
                    context.read<SwitchBloc>().add(
                        EnableOrDisableNotification());
                  });
                },
              )
            ],
          ),

          const SizedBox(height: 30,),

          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          const SizedBox(height: 50,),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous,current)=> previous.slider!=current.slider,
            builder: (context, state) {
              return Slider(value: state.slider, onChanged: (value) {
                print("Slider $value   ${state.slider}");
                context.read<SwitchBloc>().add(SliderEvent(slider: value));

              });
            },
          ),
        ],
      ),
    );
  }
}
