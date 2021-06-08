import 'dart:convert';
import 'package:http/http.dart' as http;
// ignore: camel_case_types

class movieAPI {
  String mytitle;
  String myoverview;
  String tanggalrelease;
  int runtime;
  List<String> genre;
  double popularity;

  movieAPI({
    this.mytitle, this.myoverview, this.tanggalrelease, this.runtime, this.genre, this.popularity
    });
  
  // contructor tpi return sesuatu
  factory movieAPI.createData(Map<String, dynamic> object){
    return movieAPI(mytitle: object['original_title'], myoverview: object['overview'], tanggalrelease: object['release_date'], runtime: object['runtime'], genre: object['genre'], popularity: object['popularity']);
  }

  static Future<movieAPI> connectToAPI() async {
    // String URLapi = 'https://reqres.in/api/users/2';

    // String URLapi = 'https://reqres.in/api/users?page=2';
    String URLapi = 'https://api.themoviedb.org/3/movie/550?api_key=5e4330e3cbe5f4fadddbccd443dd7e96';
    var apiResult = await http.get(Uri.parse(URLapi));

    var jsonObject = json.decode(apiResult.body);
    // print("jsonObject");
    // print(jsonObject.length);

    // var data = (jsonObject as Map<Object, dynamic>)['data'][1];

    // return movieAPI.createData(data);
    var data = (jsonObject as Map<Object, dynamic>);

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