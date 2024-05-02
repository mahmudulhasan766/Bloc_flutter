
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class Data{
  static List<String> list = ["A","B","C","D","E"];
}


class HomeCubit extends Cubit<HomeInitial> {

  static List<String> list = ["A","B","C","D","E"];

  HomeCubit() : super(HomeInitial(homeData: list));

  addData(String data){
    final newList = state.homeData;
    newList.add(data);
    emit(HomeInitial(homeData: newList));
  }
  removeData(int index){
    final newList = state.homeData;
    newList.removeAt(index);
    emit(HomeInitial(homeData: newList));
  }


}
