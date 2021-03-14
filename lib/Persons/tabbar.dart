import 'package:amlak/ListCon/Listcon.dart';
import 'package:amlak/ListCon/listPs.dart';
import 'package:amlak/ListCon/ListPersons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Tabbare extends StatefulWidget {
  var getContact;
  Tabbare({this.getContact});
  @override
  _TabbareState createState() => _TabbareState();
}

class _TabbareState extends State<Tabbare> with SingleTickerProviderStateMixin {
  final List _list = <Widget>[
    ListPersons(),
    Listcontact(),
    Listcon(),
  ];

  final List<String> llstr = [
    'مشتری ویژه',
    'همکاران',
    'مشتری',
  ];
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50.0,
        bottom: TabBar(
          onTap: (int i) {
            print(i.toString() + llstr[i]);
            widget.getContact(llstr[i]);
          },
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            insets: EdgeInsets.symmetric(horizontal: 20, vertical: -1.0),
          ),
          controller: tabController,
          tabs: [
            Tab(
              // icon: Icon(Icons.person_pin, size: 25.0),
              child: Text(
                'خاص',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Tab(
              // icon: Icon(Icons.people_alt_rounded, size: 25.0),
              child: Text(
                'همکاران',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            Tab(
              // icon: Icon(Icons.perm_contact_cal, size: 25.0),
              child: Text(
                'مشتری',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: _list),
    );
  }
}
