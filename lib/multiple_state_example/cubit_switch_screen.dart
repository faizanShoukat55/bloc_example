import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/multiple_state_example/bloc/switch_event.dart';
import 'package:flutter_bloc_example/multiple_state_example/cubity_bloc/cubit_switch_cubit.dart';



class CubitSwitchScreen extends StatefulWidget {
  const CubitSwitchScreen({super.key});

  @override
  State<CubitSwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<CubitSwitchScreen> {
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
              BlocBuilder<SwitchCubit, SwitchState>(
                buildWhen: (previous,current)=> previous.isSwitch!=current.isSwitch,
                builder: (context, state) {
                  return Switch(value: state.isSwitch, onChanged: (newValue) {
                    context.read<SwitchCubit>().
                        enableOrDisableNotification();
                  });
                },
              )
            ],
          ),

          const SizedBox(height: 30,),

          BlocBuilder<SwitchCubit, SwitchState>(
            builder: (context, state) {
              return Container(
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },
          ),
          const SizedBox(height: 50,),
          BlocBuilder<SwitchCubit, SwitchState>(
            buildWhen: (previous,current)=> previous.slider!=current.slider,
            builder: (context, state) {
              return Slider(value: state.slider, onChanged: (value) {
                print("Slider $value   ${state.slider}");
                context.read<SwitchCubit>().slider(value);

              });
            },
          ),
        ],
      ),
    );
  }
}
