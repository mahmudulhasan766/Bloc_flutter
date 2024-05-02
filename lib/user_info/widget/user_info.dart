import 'package:bloc_flutter/user_info/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<UserCubit>().getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UserCubit,UserState>(
          builder: (context,state){
        if(state is UserCubitLoading) {
         return Center(
           child: Text("data"),
         );
        }else if(state is UserCubitLoading){
          return Center(
            child:  Text("Loading"),
          );
        }else if(state is UserCubitDataLoaded){
          return Center(
            child: Text(state.userModel!.title.toString()),
          );
        }else{
          return SizedBox();
        }

      }),
    );
  }
}
