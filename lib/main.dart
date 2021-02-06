import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // widget
  @override
  /*
    A widgets main job is to build a tree
  */
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      /*
        Scaffold widget (Material Library)
        - Provides default app bar
        - body property -> holds widget tree for home screen
      */
      home: Scaffold( 
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
        bottomNavigationBar : BottomAppBar(
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              Spacer(),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
        ),
        floatingActionButton: 
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

/*
  Boiler plate command: stful
  RandomWords => a widget creates a State class called _RanmdomWordsState

  State class is prefiexed by an underbar. 
    - (_) enforces privacy in Dart.
    - Recommended best practice for State objects.

 */
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

/*
  State<RandomWords> : indicates that you are using generic State class
  specialized for use with RandomWords.

  It retains the state for the RandomWords widget.
  This class will save the list of generated word pairs
 */
class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}