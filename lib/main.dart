import 'package:bloc_flutter/api_service/api_service.dart';
import 'package:bloc_flutter/counter/counter_cubit.dart';
import 'package:bloc_flutter/counter/widget/counter_widget.dart';
import 'package:bloc_flutter/home_cubit.dart';
import 'package:bloc_flutter/user_info/user_cubit.dart';
import 'package:bloc_flutter/user_info/widget/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => UserCubit(apiService: ApiService())),
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserInfo()
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<HomeCubit, HomeInitial>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.homeData.length,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Expanded(child: Text(state.homeData[index])),

                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(context).addData("data");
                        },
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(width: 15),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<HomeCubit>(context).removeData(index);
                        },
                        tooltip: 'Increment',
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
