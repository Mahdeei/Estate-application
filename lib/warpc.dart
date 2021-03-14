import 'package:flutter/material.dart';

class WarpExample extends StatelessWidget {
  WarpExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (BuildContext context, index) => Divider(
                  height: 6.0,
                  color: Colors.black,
                  thickness: 4.0,
                ),
            padding: EdgeInsets.all(1.0),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: new Text('fdsfd'),
                trailing: new Text('dskjfd' + '$index'),
              );
            }));
  }
}

class Slide extends StatefulWidget {
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
