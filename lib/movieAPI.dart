import 'dart:convert';
import 'package:http/http.dart' as http;
// ignore: camel_case_types

class movieAPI {
  int myid;
  String myemail;

  movieAPI({
    this.myid, this.myemail
    });
  
  // contructor tpi return sesuatu
  factory movieAPI.createData(Map<String, dynamic> object){
    return movieAPI(myid: object['id'], myemail: object['email']);
  }

  static Future<movieAPI> connectToAPI() async {
    // String URLapi = 'https://reqres.in/api/users/2';

    String URLapi = 'https://reqres.in/api/users?page=2';
    var apiResult = await http.get(Uri.parse(URLapi));

    var jsonObject = json.decode(apiResult.body);
    // print("jsonObject");
    // print(jsonObject.length);

    // var data = (jsonObject as Map<Object, dynamic>)['data'][1];

    // return movieAPI.createData(data);
    var data = (jsonObject as Map<Object, dynamic>)['data'][1];

    return movieAPI.createData(data);

    
  }

  // static Future<List> connectToAPI() async {
  //   // String URLapi = 'https://reqres.in/api/users/2';

  //   String URLapi = 'https://reqres.in/api/users?page=2';
  //   var apiResult = await http.get(Uri.parse(URLapi));

  //   var jsonObject = json.decode(apiResult.body);
  //   // print("jsonObject");
  //   // print(jsonObject.length);

  //   var data = (jsonObject as Map<Object, dynamic>)['data'][1];

  //   // return movieAPI.createData(data);
  // //   var data = new List(jsonObject.length);
  // //   for(int i =0; i<jsonObject.length; i++){
  // //     data[i] = (jsonObject as Map<Object, dynamic>)['data'][i];
  // //   }
  //   return data;
  // }
}