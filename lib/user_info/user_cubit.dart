import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/model/user_model.dart';
import 'package:meta/meta.dart';

import '../api_service/api_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {

  UserModel? userModel;
  ApiService apiService;

  UserCubit({required this.apiService}) : super(UserInitial());

  void getUserData() async {
    try{

      emit(UserCubitLoading());
      userModel = await apiService.getData();
      emit(UserCubitDataLoaded(userModel: userModel));

    }catch (e){
      emit(UserCubitError(message: e.toString()));
    }
  }
}
