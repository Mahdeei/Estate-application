//in bayad splash screens bashe na screen // mahdi nemdonam barai man ham moskel push ro peyda kared ramz mikhad


import 'dart:async';
import 'package:flutter/material.dart';
import '../home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as Loading;

import 'loginPage.dart';

// ignore: camel_case_types
class Splash_s extends StatefulWidget {
  @override
  _Splash_sState createState() => _Splash_sState();
}

// ignore: camel_case_types
class _Splash_sState extends State<Splash_s>
    with SingleTickerProviderStateMixin {
  AnimationController animateControl;
  Animation<double> animate;

  // ignore: non_constant_identifier_names
  splash_s() {
    var duration = new Duration(milliseconds: 8000);
    return new Timer(duration, change_page);
  }

  // ignore: non_constant_identifier_names
  change_page() {
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  void initState() {
    super.initState();

    animateControl = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 6000));
    animate = new Tween(begin: 0.0, end: 250.0).animate(
        new CurvedAnimation(parent: animateControl, curve: Curves.easeOutCirc));
    splash_s();
  }

  @override
  dispose() {
    animateControl.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Widget animate_builder(BuildContext context, Widget child) {
    return Container(
      height: animate.value + 20,
      width: animate.value,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/image/logo-blue.png')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    animateControl.forward();
    return Scaffold(
        
        backgroundColor: Colors.blue[50],
        body: Stack(alignment: Alignment.center, children: <Widget>[
          new AnimatedBuilder(
              animation: animateControl, builder: animate_builder),
          new Padding(
              padding: EdgeInsets.only(
                top: 200.0,
              ),
              child: Align(
                // alignment: Alignment.bottomCenter,
                child: Loading.SpinKitWave(
                  size: 30,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration( 
                        borderRadius:
                            BorderRadius.all(Radius.circular(3.0 * index)),
                        color: index.isEven
                            ? Colors.cyan[100 * index]
                            : Colors.blue[100 * index],
                      ),
                    );
                  },
                ),
              ))
        ]));
  }
}
