import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/multiple_state_example/bloc/switch_event.dart';
import 'package:flutter_bloc_example/multiple_state_example/bloc/switch_state.dart';




class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {

  SwitchBloc():super(SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }


  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchState> emit){
    emit(state.copyWith(slider: events.slider));
  }
}
