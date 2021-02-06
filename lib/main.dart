import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // widget
  @override
  /*
    A widgets main job is to build a tree
  */
  Widget build(BuildContext context) {
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
          child: Text('Hello World'),
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
