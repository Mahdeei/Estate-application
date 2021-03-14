import 'package:flutter/material.dart';

import 'gride.dart';

class HomeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white12,
        body: Center(
            child: Container(
          height: 422.0,
          width: 400.0,
          margin: EdgeInsets.only(bottom: 0.0),
          padding: EdgeInsets.only(top: 0.0),
          decoration: BoxDecoration(
            // gradient: FlutterGradients.cloudyKnoxville(),
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //  new Divider(height: 6.0,thickness: 4,color:Colors.blue ,endIndent: 6,indent: 6,),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                  //     fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 151.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('تجاری',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ])),
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                  //     fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 151.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('سایر',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ])),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                  //     fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 151.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('اپارتمان',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ])),
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                  //     fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 151.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('زمین',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold)),
                          ])),
                ],
              ),
            ],
          ),
        )));
  }
}
