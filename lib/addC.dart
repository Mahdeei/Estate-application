import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'addFile.dart';

class Addclass extends StatefulWidget {
  const Addclass({Key key}) : super(key: key);
  @override
  _AddclassState createState() => _AddclassState();
}

class _AddclassState extends State<Addclass> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      body: new Container(
        margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 15.0, bottom: 5),
        decoration: BoxDecoration(
            gradient: FlutterGradients.aquaSplash(),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22.0),
                bottomRight: Radius.circular(22.0),
                bottomLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0))),
        child: ListView(children: [
          new SimpleDialog(
            backgroundColor: Colors.white,
            // elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            title: Center(
                child: new Column(
              children: [
                new Text('ثبت اطلاعات',
                    style: new TextStyle(color: Color(0xff23213e))),
                Divider(
                  color: Colors.teal,
                  thickness: 2.0,
                  height: 0.0,
                ),
              ],
            )),
            children: [
              new Card(
                color: Colors.teal,
                child: SizedBox(
                  height: 150,
                  width: 120,
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Addfile()));
                    },
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.home, size: 102.0),
                        SizedBox(
                            height: 22.0,
                            child: Divider(
                              thickness: 2.0,
                              color: Colors.white60,
                              endIndent: 10.0,
                              indent: 10.0,
                            )),
                        Expanded(
                          flex: 1,
                          child: new Text('Add New Home'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              new Card(
                color: Colors.teal,
                child: SizedBox(
                  height: 150,
                  width: 120,
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addclas(context: context)));
                    },
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.person, size: 102.0),
                        SizedBox(
                            height: 22.0,
                            child: Divider(
                              thickness: 2.0,
                              color: Colors.white60,
                              endIndent: 10.0,
                              indent: 10.0,
                            )),
                        Expanded(
                          flex: 1,
                          child: new Text('Add New Person'),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.0,
          ),
          Divider(
            color: Colors.grey,
            height: 0.0,
            endIndent: 12.0,
            indent: 12.0,
            thickness: 2.0,
          ),
          new ExpansionTile(
              leading: new Icon(Icons.error_outline, color: Colors.teal),
              title: new Text('فایل های ناقص'),
              children: [
                new Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.teal, width: 3.0)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                    child: ListBody(
                      reverse: true,
                      mainAxis: Axis.vertical,
                      children: [
                        ListTile(
                            leading: new CircleAvatar(),
                            isThreeLine: true,
                            subtitle: new Text('ali'),
                            title: new Text('Subject'),
                            trailing: new Icon(Icons.create)),
                        Divider(
                          color: Colors.teal,
                          thickness: 2.0,
                          height: 0.0,
                          indent: 60.0,
                          endIndent: 10.0,
                        ),
                        ListTile(
                          leading: new CircleAvatar(),
                          isThreeLine: true,
                          subtitle: new Text('ali'),
                          title: new Text('Subject'),
                          trailing: new Icon(Icons.create),
                        ),
                        Divider(
                          color: Colors.teal,
                          thickness: 2.0,
                          height: 0.0,
                          indent: 60.0,
                          endIndent: 10.0,
                        ),
                        ListTile(
                            leading: new CircleAvatar(),
                            isThreeLine: true,
                            subtitle: new Text('ali'),
                            title: new Text('Subject'),
                            trailing: new Icon(Icons.create)),
                        Divider(
                          color: Colors.teal,
                          thickness: 2.0,
                          height: 0.0,
                          indent: 60.0,
                          endIndent: 10.0,
                        ),
                        ListTile(
                            leading: new CircleAvatar(),
                            isThreeLine: true,
                            subtitle: new Text('ali'),
                            title: new Text('Subject'),
                            trailing: new Icon(Icons.create)),
                      ],
                    ))
              ])
        ]),
      ),
    );
  }
}

class Addclas extends StatefulWidget {
  Addclas({Key key, BuildContext context}) : super(key: key);
  @override
  _AddclasState createState() => _AddclasState();
}

class _AddclasState extends State<Addclas> {
  var menuItem = <String>[
    "رهن",
    "اجاره",
    "زمین",
    "اپارتمان",
  ];
  int id=1;
  TextEditingController controllerName,controllerPhone,controllerDetails;
  List<List<String>> persons = [];


  @override
  void initState() {
    super.initState();
    getid();
    controllerName = new TextEditingController();
    controllerPhone = new TextEditingController();
    controllerDetails = new TextEditingController();
  }


  getid()async{
    SharedPreferences prfs = await SharedPreferences.getInstance();
    Set a= prfs.getKeys();

    a.forEach((element) async{
      if(element.toString().startsWith("p")){
        print("element");
        print(element);
        List tmp= prfs.getStringList(element);
        print(tmp);
        persons.add(tmp);
        id++;
      }
    });
    print(persons);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
          //takmil bakhsh jazab adamak
          height: 1000.0,
          color: Colors.indigo,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Icon(Icons.person, size: 120.0, color: Colors.teal),
              new Table()
            ],
          ),
        ),
        bottomSheet:
            new Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          new Container(
            margin: EdgeInsets.only(left: 6.0, right: 6.0, bottom: 0.0),
            height: 230.0,
            decoration: BoxDecoration(
                gradient: FlutterGradients.highFlight(),
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(22.0), bottom: Radius.circular(12.0))),
            padding: EdgeInsets.only(
              left: 5.0,
              right: 12,
              bottom: 5,
              top: 12.0,
            ),
            child: ListView(children: [
              TextFormField(
                controller: controllerName,
                showCursor: true,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.blue[200],
                  focusColor: Colors.white,
                  icon: Icon(Icons.person),

                  hintText: 'نام'
                ),
                keyboardType: TextInputType.name,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
              new SizedBox(height: 10.0,),
              TextFormField(
                controller: controllerPhone,
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(Icons.phone_android),
                  hintText: 'شماره موبایل'
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              new SizedBox(height: 10.0,),
              TextFormField(
                controller: controllerDetails,
                showCursor: true,
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Colors.blue[200],
                  focusColor: Colors.white,
                  icon: Icon(Icons.text_snippet_sharp),
                  hintText: 'توضیحات'
                ),
                keyboardType: TextInputType.name,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.singleLineFormatter
                ],
              ),
              new Divider(),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    new Text('نوع عرضه'),
                    new Row(children: [
                      DropdownButton(
                        items: menuItem
                            .map((String value) => DropdownMenuItem<String>(
                                value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String newstring) {},
                      ),
                      DropdownButton(
                        items: menuItem
                            .map((String value) => DropdownMenuItem<String>(
                                value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String newstring) {},
                      )
                    ]),
                  ]),
              new Divider(),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new FlatButton.icon(
                      icon: Icon(Icons.money_off_csred_outlined),
                      label: new Text('سقف خرید'),
                      onPressed: () {},
                    ),
                    VerticalDivider(
                      width: 10.0,
                    ),
                    Slider(
                      value: 12.0,
                      max: 20.0,
                      min: 2.0,
                      onChanged: (double a) {},
                    ),
                  ]),
            ]),
          ),
          new Container(
            padding: EdgeInsets.symmetric(horizontal: 132.0),
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 0.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: FlutterGradients.highFlight()),
            child: FlatButton(
              onPressed: () async {
                SharedPreferences perfs = await SharedPreferences.getInstance();
                await perfs.setStringList("p $id", [controllerName.text,controllerPhone.text,controllerDetails.text]);
                Navigator.of(context).pop();
              },

              padding: EdgeInsets.symmetric(vertical: 16),
              splashColor: Colors.indigo,
              child: new Text('Save'),
            ),
          )
        ]));
  }
}
