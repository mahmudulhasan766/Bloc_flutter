import 'dart:convert';

import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<UserModel> getData()async{
    
    UserModel userModel = UserModel();
    
    try{
      var request =await http.get( Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

      if(request.statusCode == 200){
        print("Success");
      }
      var response = UserModel.fromMap(jsonDecode(request.body));

      return response;
      
    }catch(e){
      throw e;
    }
  }
}