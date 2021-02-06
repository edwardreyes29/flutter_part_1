import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // widget
  @override
  /*
    A widgets main job is to build a tree
  */
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
      // title: 'Welcome to Flutter',
      // /*
      //   Scaffold widget (Material Library)
      //   - Provides default app bar
      //   - body property -> holds widget tree for home screen
      // */
      // home: Scaffold( 
      //   appBar: AppBar(
      //     title: Text('Welcome to Flutter'),
      //   ),
      //   body: Center(
      //     // child: Text(wordPair.asPascalCase),
      //     child: RandomWords(),
      //   ),
      //   bottomNavigationBar : BottomAppBar(
      //     child: Row(
      //       children: [
      //         IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      //         Spacer(),
      //         IconButton(icon: Icon(Icons.search), onPressed: () {}),
      //         IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      //       ],
      //     ),
      //   ),
      //   floatingActionButton: 
      //     FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // ),
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
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  /*
    Add a _buildSuggestions() function that builds the ListView that
    displays the suggested word pairing.

    The property itemBuilder passes two params to function BuildContext
    and row iterator i. It increments twice for every suggest word pairing.
    Once for ListTile, and once for Divider.
    This model allows the suggested list to continue growing
    as the user scrolls
  */
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      /*
        1.
        itemBuilder callback is called once per suggested word paring and places
        each suggestion into a ListTile row. Even rows adds a ListTile row, for 
        odd rows the function adds a Divider widget to visually separate entries
      */
      itemBuilder: (context, i) { /*1*/
        /*
          2.
          Add a one-pixel-high divider widget before each row in ListView
        */
        if (i.isOdd) return Divider(); /*2*/

        /*
          3.
          i ~/ 2 expression divides i by 2 and returns an integer result.
          e.g. 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2. Calculates actual number
          of word pairings in ListView minus divider widgets.
        */
        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          /*
            4.
            If you reached the end of available word pairings, generate 10 more
            and add them to suggestions list.
          */
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}