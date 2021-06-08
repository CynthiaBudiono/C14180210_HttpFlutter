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
  // List<Movie> film = new List();
  // Movie baru = Movie("aa", 200);
  // film.add(baru);
  // film.add(new Movie("aaa", 0));
  // film.push("aa", 2000);

  _MyAppState() {
    this.getMovie();
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
                        child: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                              Text(
                                user.myemail,
                                // datafilm[index].myemail,
                                style: new TextStyle(color: Colors.black),
                              ),
                              // Text(
                              //   film.release.toString(),
                              //   style: new TextStyle(color: Colors.black),
                              // ),
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
