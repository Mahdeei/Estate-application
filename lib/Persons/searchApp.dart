import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchBar extends StatefulWidget {
  int index = 0;
  SearchBar({index, Key key}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'چیزی را سرچ کنید',
          ),
          onChanged: (str) {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {});
            },
          )
        ],
      ),
      body: new Container(),
    );
  }
}
