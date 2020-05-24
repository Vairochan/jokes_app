import 'package:flutter/material.dart';
import 'package:jokes_app_orientation/model/joke.dart';
import 'package:jokes_app_orientation/ui/joke_details.dart';
import 'package:jokes_app_orientation/ui/joke_listing.dart';


class MasterDetailScreen extends StatefulWidget {
  @override
  _MasterDetailScreenState createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  static const int tableBreakpoint = 600;
  Joke _selectedjoke;

  Widget _buildMobileLayout() {
    return  JokeListing(
      jokeSelectedCallback: (jokeSelected){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return JokeDetails(
            isInTableLayout: false,
            joke: jokeSelected,
          );
        }));
      } ,
    );
  }
  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            elevation: 13,
            child: JokeListing(
              jokeSelectedCallback: (joke){
                setState(() {
                  _selectedjoke = joke;
                });
              },
              jokeSelected: _selectedjoke,
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: JokeDetails(
            isInTableLayout: true,
            joke: _selectedjoke,
          ),
        )
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.portrait && shortestSide< tableBreakpoint){
      content = _buildMobileLayout();
    }else{
      content = _buildTabletLayout();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Jokes"
        ),
      ),
      body: Card(
        color: Colors.white70,
          elevation: 20,
          child: content),
    );
  }
}
