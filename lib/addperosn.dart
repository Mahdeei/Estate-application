import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class Addclas extends StatefulWidget {
  String sting;
  Addclas({this.sting});
  @override
  _AddclasState createState() => _AddclasState();
}

class _AddclasState extends State<Addclas> {
  int id = 1;
  bool canChange = false;
  bool change = true;
  final string1 = '''  سلام
  در افزودن فرد بهتر است نکات زیر را رعایت کنید
     
  .اگر فرد همکار شماست نام املاک ان کفایت می کند
  و هر از گاهی لیست را مطالعه کنید''';
  final string2 = '''  سلام
  در افزودن فرد بهتر است نکات زیر را رعایت کنید
    
  .اگر فرد مشتری شماست اطلاعات زیادی از ان را در
  بخش توضیحات یادداشت کنید
  و هر از گاهی لیست را مطالعه کنید''';
  final string3 = '''   سلام
  در افزودن فرد بهتر است نکات زیر را رعایت کنید
   
  .اگر ان فرد مشتری خاص شماست بهتر است
  از توانایی مالی و نیاز ها وی یادداشت برداری کنید 
  و هر از گاهی لیست را مطالعه کنید 
                ''';

  final List<Icon> _listIcon = [
    Icon(Icons.person, size: 26.0, color: Colors.black),
    Icon(Icons.phone_android, size: 26.0, color: Colors.black),
    Icon(Icons.text_snippet_sharp, size: 26.0, color: Colors.black),
  ];

  TextEditingController controllerName, controllerPhone, controllerDetails;
  List<List<String>> persons = [];
  List<String> textName = ['نام', 'موبایل', 'توضیحات'];

  @override
  void initState() {
    super.initState();
    getid();
    controllerName = new TextEditingController();
    controllerPhone = new TextEditingController();
    controllerDetails = new TextEditingController();
  }

  getid() async {
    SharedPreferences prfs = await SharedPreferences.getInstance();
    Set a = prfs.getKeys();

    a.forEach((element) async {
      if (element.toString().startsWith("p")) {
        print("element");
        print(element);
        List tmp = prfs.getStringList(element);
        print(tmp);
        persons.add(tmp);
        id++;
      }
    });
    print(persons);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          FlatButton(
              child: new Text(change ? 'بیخیال' : 'فهمیدم'),
              onPressed: () {
                change
                    ? Navigator.of(context).pop()
                    : setState(() {
                        change = !change;
                      });
              }),
          change
              ? FlatButton(
                  child: new Text('ذخیره'),
                  onPressed: () async {
                    Future.delayed(Duration(seconds: 1))
                        .then((value) => () async {
                              if (canChange) {
                                SharedPreferences perfs =
                                    await SharedPreferences.getInstance();
                                await perfs.setStringList("p $id", [
                                  controllerName.text,
                                  controllerPhone.text,
                                  controllerDetails.text
                                ]);
                                Navigator.of(context).pop();
                              }
                            });
                  },
                )
              : null,
        ],
        scrollable: true,
        title: new FlatButton.icon(
            onPressed: () {
              setState(() {
                print(widget.sting);
                change = !change;
              });
            },
            icon: Icon(Icons.info, color: Colors.deepOrangeAccent),
            label: new Text(
              widget.sting,
              style: TextStyle(color: Colors.black),
            )),
        content: change
            ? Column(children: [
                getText(controllerName, textName[0], _listIcon[0],
                    InputBorder.none, TextInputType.name),
                new SizedBox(
                  height: 10.0,
                ),
                getText(controllerPhone, textName[1], _listIcon[1],
                    InputBorder.none, TextInputType.name),
                new SizedBox(
                  height: 10.0,
                ),
                getText(
                  controllerDetails,
                  textName[2],
                  _listIcon[2],
                  OutlineInputBorder(borderSide: BorderSide().scale(1)),
                  TextInputType.multiline,
                )
              ])
            : new Text(
                widget.sting == 'مشتری'
                    ? string2
                    : widget.sting == 'همکاران'
                        ? string1
                        : string3,
                textDirection: TextDirection.rtl));
  }

  Widget getText(TextEditingController tEC, String name, Widget icon,
      InputBorder borders, TextInputType ketype) {
    return TextFormField(
      onSaved: (str) {
        print(str);
      },
      onChanged: (String str) {
        setState(() {});
      },
      textDirection: (name == 'موبایل') ? TextDirection.ltr : TextDirection.rtl,
      maxLength: (name == 'موبایل') ? 11 : null,
      controller: tEC,
      showCursor: true,
      decoration: InputDecoration(
          filled: true,
          border: borders,
          fillColor: Colors.white,
          focusColor: Colors.white,
          icon: icon,
          hintText: '$name'),
      keyboardType: ketype,
      // inputFormatters: <TextInputFormatter>[
      //  FilteringTextInputFormatter.singleLineFormatter,
      // ],
    );
  }
}
