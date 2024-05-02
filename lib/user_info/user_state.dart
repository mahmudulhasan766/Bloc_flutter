part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {


}

class UserCubitLoading extends UserState{

}

class UserCubitDataLoaded extends UserState{

  UserModel? userModel;

  UserCubitDataLoaded({this.userModel});


}

class UserCubitError extends UserState{

  String? message;

  UserCubitError({this.message});

}