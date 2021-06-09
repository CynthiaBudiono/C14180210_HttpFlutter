import 'package:flutter/material.dart';
import 'global.dart' as global;

class DetailMovie extends StatefulWidget {

  @override
  _DetailMovieState createState() => _DetailMovieState();

  final String indexfilm;
  const DetailMovie(this.indexfilm);

}

class _DetailMovieState extends State<DetailMovie> {
  // int indexku= int.parse(widget.indexfilm);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(global.film[int.parse(widget.indexfilm)].mytitle),
        ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              IconButton(
                  alignment: Alignment.topRight,
                      icon: Icon(Icons.favorite),
                      tooltip: "Favourite",
                      onPressed: () {
                        print("press icon button");
                      },
                    ),
              Card(
                child: Column(children: <Widget>[
                  Text(global.film[int.parse(widget.indexfilm)].myoverview),
                  // Text(global.film[int.parse(widget.indexfilm)].genre[1]),
                ],)
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}