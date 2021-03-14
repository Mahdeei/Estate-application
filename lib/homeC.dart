import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'gridelist.dart';

class HomeClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          height: 402.0,
          width: 316.0,
          margin: EdgeInsets.only(bottom: 12.0),
          padding: EdgeInsets.only(top: 0.0),
          decoration: BoxDecoration(
            gradient: FlutterGradients.cloudyKnoxville(),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 0.0,
                color: Colors.white10,
                spreadRadius: 2.0,
              ),
              BoxShadow(
                blurRadius: 6.0,
                color: Colors.white,
                spreadRadius: 2.0,
              ),
            ],
            // shape: BoxShape.circle,
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  new Divider(height: 6.0,thickness: 4,color:Colors.blue ,endIndent: 6,indent: 6,),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 131.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('رهن و اجاره'),
                          ])),
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 131.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('سایر'),
                          ])),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 131.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('اپارتمان'),
                          ])),
                  new Card(
                      color: Colors.blue,
                      child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(2.0)),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home,
                                    color: Color(0xffffffff),
                                  ),
                                  iconSize: 131.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Gridclass()));
                                  },
                                )),
                            new Text('زمین'),
                          ])),
                ],
              ),
            ],
          ),
        )));
  }
}
