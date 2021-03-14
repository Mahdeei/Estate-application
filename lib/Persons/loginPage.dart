import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'loginChildpage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: new Container(
        child: new Stack(
          children: [
            new Container(
              alignment: Alignment.topCenter,
              width: _sizeScreen.width,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(
                    'assets/image/animate.gif',
                  ),
                ),
              ),
            ),
            new LoginClass(),
          ],
        ),
      ),
    );
  }
}

class LoginClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 300.0, bottom:30.0),
        padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LoginChild(),
            new RaisedButton(
              color: Colors.blue, 
              onPressed: () {},
              child: new Text('ورود به حساب'),
            ),
            
          ]),
    );
  }
}
