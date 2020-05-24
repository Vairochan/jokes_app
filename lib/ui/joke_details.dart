import 'package:flutter/material.dart';
import 'package:jokes_app_orientation/model/joke.dart';

class JokeDetails extends StatelessWidget {

  JokeDetails({ @required this.isInTableLayout, @required this.joke});
  final bool isInTableLayout;
  final Joke joke;



  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(joke?.setup ?? 'No joke selected',
            style: textTheme.headline,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(joke?.punchline ?? 'Please select a joke on left',
          style: textTheme.subhead,),
        )
      ],
    );
    if (isInTableLayout){
      return Center(
        child: content,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          joke?.type ?? "No jokes"
        ),
        backgroundColor: Colors.orange  ,
      ),
      body: Center(
        child: content,
      ),
    );
  }
}
