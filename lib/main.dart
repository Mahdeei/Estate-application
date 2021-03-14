import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(First_page());

// ignore: camel_case_types
class First_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print("Date time");
    print("OOOOOOOOOOk");
    print(new DateTime.now().toString());
    return MaterialApp(
        title: 'Corner',
        theme: ThemeData(
          fontFamily: 'Vazir',
        ),
        debugShowCheckedModeBanner: false,
        home: new Directionality(
            textDirection: TextDirection.rtl, child: new MyApp()));
  }
}
