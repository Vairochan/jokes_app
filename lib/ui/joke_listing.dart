import 'package:flutter/material.dart';
import 'package:jokes_app_orientation/model/joke.dart';

class JokeListing extends StatelessWidget {
  JokeListing({@required Key key, this.jokeSelectedCallback, this.jokeSelected});
  final ValueChanged<Joke> jokeSelectedCallback;
  final Joke jokeSelected;


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((joke) => Container(
        child: Card(
          elevation: 20,
          child: ListTile(
            title: Text(joke.setup),
            onTap: () => jokeSelectedCallback(joke),
            selected: jokeSelected == joke,
          ),
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4.5),

        ),
      ),
      ).toList(),
    );
  }
}
