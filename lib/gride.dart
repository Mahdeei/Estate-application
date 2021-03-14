import 'package:flutter/material.dart';

import 'Persons/searchApp.dart';
import 'filegride.dart';

class Gridclass extends StatefulWidget {
  @override
  _GridclassState createState() => _GridclassState();
}

class _GridclassState extends State<Gridclass> {
  var raiting = new RangeValues(80, 120);
  var raiting2 = new RangeValues(20, 160);

  List<Widget> listWid = [
    SubclasGride(),
    SubclsGride(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: new Container(
            height: 42,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: new InkWell(
                child: new Center(
                    child: new Text('فیلتر کردن',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold))),
                onTap: () {
                  return showModalBottomSheet(
                      backgroundColor: Colors.black12,
                      context: context,
                      builder: (context) =>
                          StatefulBuilder(builder: (BuildContext context,
                              StateSetter setState /*You can rename this!*/) {
                            return new Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12.0)),
                                ),
                                height: 160.0,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      new Text('قیمت در متر'),
                                      RangeSlider(
                                          onChanged: (newRange) {
                                            setState(() => raiting = newRange);
                                          },
                                          values: raiting,
                                          min: 10,
                                          max: 300,
                                          divisions: 6,
                                          labels: RangeLabels(
                                              raiting.start.round().toString(),
                                              raiting.end.round().toString())),
                                      new Text('متراژ'),
                                      RangeSlider(
                                          onChanged: (newRenge) {
                                            setState(() => raiting2 = newRenge);
                                          },
                                          values: raiting2,
                                          min: 1,
                                          divisions: 5,
                                          max: 200,
                                          labels: RangeLabels(
                                              raiting2.start.round().toString(),
                                              raiting2.end.round().toString())),
                                    ]));
                          }));
                })),
        appBar: AppBar(
            backgroundColor: Colors.blue,
            brightness: Brightness.light,
            actions: [
              new InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SearchBar(index: 0)));
                },
                child: new Padding(
                  padding: EdgeInsets.only(right: 20.0, top: 6.0),
                  child: new Icon(Icons.search, size: 30.0),
                ),
              )
            ]),
        body: Container(
            height: 560.0,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (contex, index) => Card(
                  color: Colors.blue,
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 6.0),
                  child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 2.0,
                          top: 2.0,
                          left: 0.0,
                          right:
                              0.0), //inja mitonim fasele hay beyneshon ro ok konim
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Filepage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              listWid[index % 2],
                              listWid[index % 2 == 0 ? 1 : 0],
                            ],
                          )))),
            )));
  }
}

// ignore: camel_case_types
class SubclasGride extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 212.0,
      height: 160.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
    );
  }
}

// ignore: must_be_immutable
class SubclsGride extends StatelessWidget {
  SubclsGride({Key key}) : super(key: key);
  List<String> liststr = ['مالک', 'متراژ', 'قیمت', 'خواب', 'وضعیت'];

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
                liststr.length,
                (index) => Card(
                      elevation: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
                      child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Text(' 132 '),
                            new Text(
                              liststr[index] + '  ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ]),
                    ))));
  }
}
