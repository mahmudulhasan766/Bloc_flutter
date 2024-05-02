part of 'counter_cubit.dart';

abstract class CounterState  extends Equatable{
  const CounterState();
}

final class CounterInitial extends CounterState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CounterValueUpdate extends CounterState{
   int counter;

   CounterValueUpdate({required this.counter});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}


