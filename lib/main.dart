import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latihan_04/detailmovie.dart';
import 'movieAPI.dart';
import 'global.dart' as global;

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyApp(),
        '/DetailMovie': (context) =>
            DetailMovie(ModalRoute.of(context).settings.arguments as String),
      },
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _txtsearch = new TextEditingController();
  // List<movieAPI> film = new List();
  // Movie baru = Movie("aa", 200);
  // film.add(baru);
  // film.add(new Movie("aaa", 0));
  // film.push("aa", 2000);

  _MyAppState() {
    for (int i = 549; i < 555; i++) {
      getMovie(i);
    }
  }

  // List<movieAPI> datafilm = null;
  movieAPI user = null;
  var coba;
  int ind = 0;
  getMovie(idfilm) {
    movieAPI.connectToAPI(idfilm).then((hasil) {
      // Map paramData = {

      // };
      // var parameter = json.encode(paramData);
      // var tess = hasil['data'];
      // datafilm = hasil;
      // coba = hasil;
      // print("HASILLL");
      // for(int i =0; i< hasil.length;i++){}
      // print(hasil.);
      user = hasil;
      global.film.add(user);
      print("LENGTHH" + global.film.length.toString());
      print("TITLEE : " + global.film[ind].mytitle);
      ind += 1;
      // print("FILM :"+ film.map((e) => null));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                    children: List.generate(global.film.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          print("INDEXX");
                          print(index);
                          Navigator.pushNamed(context, '/DetailMovie',
                              arguments: index.toString());
                        },
                        child: Card(
                          color: Colors.lightBlue,
                          child: Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                // film[index].mytitle == null ?
                                // Text(film[index].mytitle),
                                Text(
                                  global.film[index].mytitle,
                                  // film[index].mytitle,
                                  style: new TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                // : Text("LALA"),
                                Text(
                                  global.film[index].myoverview,
                                  // film[index].myoverview.split(".").toString(),
                                  // user.myoverview,
                                  style: new TextStyle(
                                      color: Colors.black, fontSize: 10),
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "Release Date : " +
                                            global.film[index].tanggalrelease,
                                        // "Release Date : " + user.tanggalrelease,
                                        style:
                                            new TextStyle(color: Colors.black),
                                      ),
                                      Text(
                                        "Run Time : " +
                                            global.film[index].runtime.toString() +
                                            " Menit",
                                        // "Run Time : " +
                                        //     user.runtime.toString() +
                                        //     " Menit",
                                        style:
                                            new TextStyle(color: Colors.black),
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
                                        "Popularity : " +
                                            global.film[index].popularity.toString(),
                                        // "Popularity : " + user.popularity.toString(),
                                        style:
                                            new TextStyle(color: Colors.black),
                                      ),
                                    ]),
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
