import 'dart:convert';
import '../model/model.dart';
import 'package:http/http.dart' as http;


// 1st get data from internet
Future<List<UserModel>> getData() async {

  try{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if(response.statusCode == 200){
      String responseString = response.body;
      Map<String,dynamic> responseData = jsonDecode(responseString);
      return [UserModel.fromJson(responseData)];
    }else{
      return [];
    }

  }catch(e){
    throw Exception("Data is not loading.");
  }

}




// 2nd Put/updtae data
Future<List<UserModel>> putData(String title) async {

  try{
    final response = await http.put(
       // 1st url part
        Uri.parse(
        'https://jsonplaceholder.typicode.com/albums/1'
        ),

        // 2nd headers part
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

        // 3rd body part
      body: jsonEncode(<String,String>{ // i will show the only title filed
        "title" : title
      })

    );

    if(response.statusCode == 200){
      String responseString = response.body;
      Map<String,dynamic> responseData = jsonDecode(responseString);
      return [UserModel.fromJson(responseData)];
    }else{
      return [];
    }

  }catch(e){
    throw Exception("Data is not loading.");
  }

}