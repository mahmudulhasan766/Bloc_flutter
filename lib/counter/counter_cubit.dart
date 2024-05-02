import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  int counter = 0;

  CounterCubit() : super(CounterInitial());

  void counterIncrement(){
    if(counter>10){
      counter ++;
      emit(CounterValueUpdate(counter: counter));
    }

  }

  void counterDecrement(){

    if(counter>0){
      counter --;
      emit(CounterValueUpdate(counter: counter));
    }

  }

}
