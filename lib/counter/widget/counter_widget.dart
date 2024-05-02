import 'package:bloc_flutter/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CounterCubit,CounterState>(builder: (context,state){
      return Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: ()=>BlocProvider.of<CounterCubit>(context).counterIncrement(), icon: Icon(Icons.add)),
              //(state is CounterValueUpdate)? Text(state.counter.toString()) : Text("0"),
              Text(context.read<CounterCubit>().counter.toString()),
              IconButton(onPressed: ()=>context.read<CounterCubit>().counterDecrement(), icon: Icon(Icons.remove)),
            ],
          ),
        ),
      );
    }));
  }
}
