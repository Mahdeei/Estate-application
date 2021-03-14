import 'package:flutter/material.dart';

class LoginChild extends StatefulWidget {
  @override
  _LoginChildState createState() => _LoginChildState();
}

class _LoginChildState extends State<LoginChild> {
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new Column(
      children: [
        TextFormField(
          showCursor: false,
          decoration: InputDecoration(
              hintText: 'املاک مهدی',
              prefixText: 'نام کاربر ',
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.3, color: Colors.blueGrey),
              )),
        ),
        TextFormField(
          showCursor: false,
          decoration: InputDecoration(
              hintText: 'شماره همراهی وارد کنید',
              icon: Icon(Icons.phone),
              prefixText: '+98 ',
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.5),
              )),
        ),
        new SizedBox(height: 10.0),
        new MaterialButton(
          onPressed: () {},
          child: new Row(
            children: [
              new Text(
                'هنوز ثبت نام نکرده اید ؟',
                style: TextStyle(color: Colors.grey),
              ),
              new SizedBox(width: 5.0),
              new Text('ثبت نام'),
            ],
          ),
        ),
      ],
    ));
  }
}
