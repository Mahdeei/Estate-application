import 'dart:async';
import 'package:flutter/material.dart';
import '../home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as Loading;

// ignore: camel_case_types
class Splash_s extends StatefulWidget {
  @override
  _Splash_sState createState() => _Splash_sState();
}

// ignore: camel_case_types
class _Splash_sState extends State<Splash_s>
    with SingleTickerProviderStateMixin {
  AnimationController animate_con;
  Animation<int> animate;

  // ignore: non_constant_identifier_names
  splash_s() {
    var duration = new Duration(seconds: 10);
    return new Timer(duration, change_page);
  }

  // ignore: non_constant_identifier_names
  change_page() {
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  void initState() {
    super.initState();
    splash_s();

    animate_con = new AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    animate = new Tween(begin: 0, end: 220).animate(
        new CurvedAnimation(parent: animate_con, curve: Curves.easeOutCirc));
  }

  // ignore: non_constant_identifier_names
  Widget animate_builder(BuildContext context, Widget child) {
    return /*Container(
      height: (double)animate.value,
      width: (double)animate.value - 20,
      decoration: ,
    );*/new Container(
      height: animate.value.toDouble(),
      width: (animate.value - 20).toDouble(),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/image/logo-blue.png')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    animate_con.forward();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new AnimatedBuilder(
                  animation: animate_con, builder: animate_builder),
              new Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Loading.SpinKitThreeBounce(
                  size: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                        color: index.isEven ? Colors.cyan : Colors.blue,
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ]));
  }
}
