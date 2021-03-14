import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class PersonC extends StatelessWidget {
  var x;
  PersonC({Key key, this.x}) : super(key: key);

  List<Widget> listAcc = [
    new Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            caption: 'حذف',
            closeOnTap: false, //list will not close on tap
            onTap: () {
              print("");
            })
      ],
      child: ListTile(
        title: new Text('تمدید حساب', style: TextStyle(color: Colors.black)),
        trailing: new Text(' 99/10/13 ', style: TextStyle(color: Colors.black)),
        onTap: () {},
      ),
    ),
    Slidable(
        actionPane: SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              caption: 'حذف',
              closeOnTap: false, //list will not close on tap
              onTap: () {
                print("");
              })
        ],
        actions: [
          new Container(
            child: new Text('d'),
          ),
          new Container(
            child: new Text('d'),
          ),
          new Container(
            child: new Text('d'),
          ),
          new Container(
            child: new Text('d'),
          ),
        ],
        child: ListTile(
          trailing: new Icon(Icons.double_arrow_sharp),
          title: new Text('امیرحسین', style: TextStyle(color: Colors.black)),
        ))
  ];
  final List<Widget> listSet = [
    new Container(
        color: Colors.white,
        child: new Center(
          child: new Text('site:easeup.ir tel:easeup.admin '),
        ))
  ];
  List<List> listLW = [];

  @override
  Widget build(BuildContext context) {
    listLW.clear();
    listLW.add(listAcc);
    listLW.add(listSet);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => ListG(index, listLW[index], x)),
    );
  }
}

// ignore: must_be_immutable
class ListG extends StatelessWidget {
  List<Widget> list = [];
  int index;
  // ignore: non_constant_identifier_names
  var get_x;
  ListG(this.index, this.list, this.get_x);
  List<String> liststring = [
    'حساب',
    'ارتباط  با ما',
  ];
  List<Widget> setIcon = [
    Icon(Icons.account_circle, size: 32.0, color: Colors.black),
    Icon(Icons.bubble_chart_rounded, size: 30.0, color: Colors.black),
  ];
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (boolian) {
        if (index == 0) {
          boolian ? get_x(list.length) : get_x(-list.length);
        } else {
          boolian ? get_x(2) : get_x(-2);
        }
      },
      title: new Text(
        liststring[index],
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
      leading: setIcon[index],
      children: list,
    );
  }
}
