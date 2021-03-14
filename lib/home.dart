import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'Persons/searchApp.dart';
import 'Persons/tabbar.dart';
import 'addFile.dart';
import 'addperosn.dart';
import 'file.dart';
import 'final.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentindex = 0;
  int _size = 0;
  String _contact = 'همکاران';

  String get_contact(String i) {
    setState(() {
      _contact = i;
    });
  }

  // ignore: non_constant_identifier_names
  void get_size(int i) {
    setState(() {
      _size += i;
    });
  }

  void tapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  final List<String> lstr = [
    'اپارتمان',
    'زمین',
    'ویلایی',
    'سایر',
  ];

  @override
  Widget build(BuildContext context) {
      return BackdropScaffold(
        headerHeight: 370.0 - (_size * 50),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _currentindex,
            onTap: tapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_work_sharp,
                    size: _currentindex == 0
                        ? 36.0
                        : 26.0), //Icon(Icons.file_present),
                label: 'فایل',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_sharp,
                    size: _currentindex == 1 ? 36.0 : 26.0),
                label: 'مشتری',
              )
            ]),
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  elevation: 1.0,
                  splashColor: Colors.black,
                  child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: Icon(Icons.add, size: 35.0, color: Colors.blue)),
                  backgroundColor: Colors.white,
                  onPressed: () {
                    _currentindex == 0
                        ? showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15.0)),
                            ),
                            context: context,
                            builder: (context) => Container(
                                height: 150.0,
                                padding: EdgeInsets.all(20.0),
                                child: new ListView(
                                    itemExtent: 42.0,
                                    children: lstr
                                        .map((String str) => InkWell(
                                              autofocus: true,
                                              child: new Center(
                                                  child: new Text(str,
                                                      style: TextStyle(
                                                          fontSize: 20.0))),
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            Addfile(
                                                                string: str)));
                                              },
                                            ))
                                        .toList())))
                        : showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                Addclas(sting: _contact));
                  },
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: PreferredSize(
            preferredSize: Size(0.0, 60.0),
            child: BackdropAppBar(
              backgroundColor: Colors.blue,
              brightness: Brightness.light,
              centerTitle: true,
              actions: [
                _currentindex == 1
                    ? new InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext cot) =>
                                      SearchBar(index: 1)));
                        },
                        child: new Padding(
                          padding: EdgeInsets.only(right: 20.0, top: 6.0),
                          child: new Icon(Icons.person_search, size: 30.0),
                        ),
                      )
                    : new Container(),
              ],
              title: Text("املاک مهدی", textDirection: TextDirection.rtl),
            )),
        backLayer: PersonC(x: get_size),
        animationCurve: Curves.decelerate,
        backLayerBackgroundColor: Colors.blue,
        frontLayer:
            _currentindex == 0 ? HomeClass() : Tabbare(getContact: get_contact),
      
    );
  }
}
