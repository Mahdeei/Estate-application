import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'Estates/ListEstates.dart';
import 'Persons/ListPersons.dart';

class PersonC extends StatelessWidget {
  PersonC({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),
        child: Container(
            decoration: BoxDecoration(
                gradient: FlutterGradients.viciousStance(),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: new Expanded(
              flex: 1,
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new CircleAvatar(
                      radius: 50,
                    ),
                    new FlatButton(
                      child: new Text('Edit Profile',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ListEstate()));
                      },
                    )
                  ],
                ),
                VerticalDivider(
                  color: Colors.white,
                  thickness: 4.0,
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new Icon(Icons.person,
                        size: 110.0, color: Colors.orangeAccent),
                    FlatButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ListPersons()));
                      },
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      label: new Text('Contact',
                          style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ],
            ))),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: [
            Divider(
              height: 10.0,
              color: Colors.black12,
              thickness: 10,
            ),
            ListTile(
              leading: new Icon(Icons.account_box, size: 30.0),
              onTap: () {},
              title: new Text('Account'),
            ),
            Divider(
              height: 0.0,
              indent: 50.0,
              endIndent: 10,
            ),
            ListTile(
              leading: new Icon(Icons.settings, size: 30.0),
              onTap: () {},
              title: new Text('Setting'),
            ),
            Divider(height: 0.0, indent: 50.0, endIndent: 10),
            ListTile(
              leading: new Icon(Icons.add_to_home_screen, size: 30.0),
              onTap: () {},
              title: new Text('About us'),
            ),
            Divider(height: 0.0, indent: 50.0, endIndent: 10),
            ListTile(
              leading: new Icon(Icons.wifi_calling, size: 30.0),
              onTap: () {},
              title: new Text('Talk to me'),
            ),
            Divider(height: 0.0, indent: 50.0, endIndent: 10),
            new SizedBox(height: 25.0),
            new FlatButton(
                onPressed: () {}, child: new Text('Powerd by Easeup'))
          ],
        ),
      ),
    );
  }
}
