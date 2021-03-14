import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

import 'filepage.dart';


class Gridclass extends StatefulWidget {
  @override
  _GridclassState createState() => _GridclassState();
}

class _GridclassState extends State<Gridclass> {
  var raiting = 50.0;
  var raiting2 = 10.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: new Container(height: 38,
            decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: new Stack(children: <Widget>[
              new FlatButton.icon(
                icon: Icon(Icons.filter_list),
                label: new Text('Fillter '),
                onPressed: () {
                  return showModalBottomSheet(
                      backgroundColor: Colors.white10,
                      context: context,
                      builder: (BuildContext context) => new Container(
                          margin: EdgeInsets.symmetric(horizontal: 6.0),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12.0)),
                          ),
                          alignment: Alignment.center,
                          height: 200.0,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new Text('Precent'),
                                Slider(
                                  value: raiting,
                                  onChanged: (newRange) {
                                    setState(() => raiting = newRange);
                                  },
                                  min: 0.0,
                                  max: 100.0,
                                  divisions: 10,
                                  label: '$raiting',
                                ),
                                new Text('Metrazh'),
                                Slider(
                                  value: raiting2,
                                  onChanged: (newRange) {
                                    setState(() => raiting2 = newRange);
                                  },
                                  min: 0.0,
                                  max: 100.0,
                                  divisions: 10,
                                  label: '$raiting2',
                                ),
                              ])));
                },
              )
            ])),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          actions: [
            new Row(
              children: [
                new Text('20 ', style: TextStyle(fontSize: 17.0)),
                new Text(' موارد موجود  '),
              ],
            )
          ],
        ),
        body: Container(
            height: 1000.0,
            decoration: BoxDecoration(gradient: FlutterGradients.magicRay()),
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.only(top: 0.0, bottom: 40.0),
              shrinkWrap: true,
              children: List.generate(20, (index) {
                return Padding(
                    padding: const EdgeInsets.only(
                        top: 14.0,
                        bottom: 0.0,
                        left: 4.0,
                        right:4.0), //inja mitonim fasele hay beyneshon ro ok konim
                    child: new Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(14.0),
                          ),
                        ),
                        padding: EdgeInsets.only(
                            top: 5.0, left: 2.0, right: 2.0, bottom: 1.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            new Container(
                                width: 172.0,
                                height: 106.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(14.0)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Filepage()));
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      new Text(
                                        'مالک: محمدی ',
                                        style: TextStyle(
                                            backgroundColor: Colors.black12,
                                            color: Colors.yellow),
                                      ),
                                    ],
                                  ),
                                )),
                            new Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(14))),
                                child: new Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          new Text('۱۳۲ متر'),
                                          new VerticalDivider(
                                            width: 1.0,
                                            color: Colors.black,
                                            thickness: 4.0,
                                          ),
                                          new Text('۱۲ میلیون'),
                                        ],
                                      ),
                                      Divider(
                                        height: 0.0,
                                      ),
                                      new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          new Text('۳خوابه'),
                                          new VerticalDivider(),
                                          new Text('سند دار'),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        )));
              }),
            )));
  }
}
