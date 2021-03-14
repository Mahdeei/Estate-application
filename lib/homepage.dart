import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'addC.dart';
import 'final.dart';
import 'homeC.dart';

class Bottomtabbar extends StatefulWidget {
  const Bottomtabbar({Key key}) : super(key: key);
  @override
  _BottomtabbarState createState() => _BottomtabbarState();
}

class _BottomtabbarState extends State<Bottomtabbar>
    with SingleTickerProviderStateMixin {
  TabController tabc;
  static List kTabs = <Widget>[
    PersonC(),
    HomeClass(),
    Addclass(),
  ];
  static const tTabs = <Tab>[
    Tab(
      icon: Icon(
        Icons.person,
        color: Colors.black,
        size: 45.0,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.home,
        color: Colors.black,
        size: 45.0,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.add,
        color: Colors.black,
        size: 45.0,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabc = TabController(
      length: kTabs.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: kTabs,
        controller: tabc,
      ),
      bottomNavigationBar: new Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22.0)),
        ),
        height: 53.0,
        child: TabBar(
          tabs: tTabs,
          indicatorWeight: 4.0,
          indicator: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
          controller: tabc,
          labelColor: Color(0xffffffff),
          indicatorPadding:
              EdgeInsets.only(bottom: 7.0, left: 2.0, right: 20.0),
        ),
      ),
    );
  }
}
