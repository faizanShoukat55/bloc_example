import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cubit_switch_state.dart';

// class SwitchCubit extends Cubit<SwitchState> {
//   SwitchCubit() : super(SwitchInitial());
// }




class SwitchCubit extends Cubit<SwitchState> {

  SwitchCubit():super(SwitchState()){
    // on<EnableOrDisableNotification>(_enableOrDisableNotification);
    // on<SliderEvent>(_slider);
  }


  void enableOrDisableNotification(){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void slider(double slider){
    // events.slider
    emit(state.copyWith(slider:slider));
  }
}