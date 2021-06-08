import 'dart:convert';

import 'package:flutter/material.dart';
import 'movieAPI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _txtsearch = new TextEditingController();
  List film = new List();
  // Movie baru = Movie("aa", 200);
  // film.add(baru);
  // film.add(new Movie("aaa", 0));
  // film.push("aa", 2000);
  
  _MyAppState() {
    // for(int i = 550;i< 560; i++){
      getMovie();
    // }
  }

  // List<movieAPI> datafilm = null;
  movieAPI user = null;
  var coba;
  getMovie(){
    movieAPI.connectToAPI().then((hasil) {
      // Map paramData = {

      // };
      // var parameter = json.encode(paramData);
      // var tess = hasil['data'];
      // datafilm = hasil;
      // coba = hasil;
      // print("HASILLL");
      // for(int i =0; i< hasil.length;i++){}
      // print(hasil.);
      user= hasil;
      film.add(user);
      setState(() {
              
            });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Movie")),
          body: Column(
            children: <Widget>[
              TextField(
                controller: _txtsearch,
                decoration: InputDecoration(
                    labelText: "Search by Title",
                    prefixIcon: Icon(Icons.search)),
              ),
              // Text(user.myemail),
              // Text(datafilm[1].myemail),
              Expanded(
               child: GridView.count(

                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                  children: List.generate(4, (index) {
                    return Center(
                      child: Card(
                        color: Colors.lightBlue,
                        child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                              Text(
                                user.mytitle,
                                // datafilm[index].myemail,
                                style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                user.myoverview,
                                style: new TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Release Date : " + user.tanggalrelease,
                                style: new TextStyle(color: Colors.black),
                              ),
                              Text(
                                "Run Time : " + user.runtime.toString() + " Menit",
                                style: new TextStyle(color: Colors.black),
                              ),
                              // List.generate(user.genre.length, (index){
                              //   Text(
                              //   user.myoverview,
                              //   style: new TextStyle(color: Colors.black),
                              // );
                              // }),
                              // Text(
                              //   user.genre[1],
                              //   style: new TextStyle(color: Colors.black),
                              // ),
                              Text(
                                "Popularity : " + user.popularity.toString(),
                                style: new TextStyle(color: Colors.black),
                              ),
                            ])),
                      ),
                    );
                  })),
                  ),
            ],
          )),
    );
  }
}
