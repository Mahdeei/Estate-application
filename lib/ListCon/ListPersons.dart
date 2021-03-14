import 'package:flutter/material.dart';
import 'package:flutter_amlak/Model/Person.dart';
import 'package:flutter_amlak/Other/SizeConfig.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPersons extends StatefulWidget {
  @override
  _ListPersonsState createState() => _ListPersonsState();
}

class _ListPersonsState extends State<ListPersons> {
  Size phoneSize;
  bool isLoading = true;
  List<int> isTick = [];
  TextEditingController _controllerMessage;

  showD() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
                content: TextField(
                  maxLength: null,
                  controller: _controllerMessage,
                  keyboardType: TextInputType.multiline,
                ),
                title: new Text('Send for ${isTick.length} person ...'),
                actions: [
                  MaterialButton(
                      child: new Text('Send'),
                      onPressed: () {
                        var message = _controllerMessage.text;
                        _sendSMS(_controllerMessage.text);
                      }),
                  MaterialButton(
                      child: new Text('Cancle'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ]));
  }

  void _sendSMS(String _message) async {
    List<String> recipents = [];
    isTick.forEach((element) {
      recipents.add(persons[element].mobilePhone.toString());
    });

    try {
      String _result = await sendSMS(message: _message, recipients: recipents);
      setState(() => _message = _result);
    } catch (error) {
      setState(() => _message = error.toString());
    }
    Fluttertoast.showToast(msg: _message);
  }

  void changeBox(bool t, int ind) {
    if (ind == 0) {
      setState(() {
        isTick.clear();
        if (t) {
          for (int i = 0; i < 5; ++i) {
            isTick.add(i);
          }
        }
      });
    } else {
      setState(() {
        if (t) {
          isTick.add(ind);
          if (isTick.length == 4) isTick.add(0);
        } else {
          if (isTick.length == 5) isTick.remove(0);
          isTick.remove(ind);
        }
      });
    }
  }

  SharedPreferences prfs;
  Set a = new Set();

  List<Person> persons = [];
  @override
  void initState() {
    super.initState();
    getData();
    _controllerMessage = new TextEditingController();
    print("phoneSize.heightMultiplier");
    print(SizeConfig.heightMultiplier);
  }

  getData() async {
    if (this.mounted) {
      prfs = await SharedPreferences.getInstance();
      a = prfs.getKeys();
      a.forEach((key) {
        if (key.toString().startsWith("p")) {
          persons.add(toClass(prfs.getStringList(key), key));
        }
      });
      setState(() {
        isLoading = false;
      });
    }
  }

  Person toClass(List a, String key) {
    Person person = new Person();
    person.id = key;
    person.name = a[0];
    person.mobilePhone = a[1];
    person.tozihat = a[2];
    return person;
  }

  @override
  Widget build(BuildContext context) {
    phoneSize = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black12,
                ),
            itemCount: 15,
            // ignore: non_constant_identifier_names
            itemBuilder: (BuildContext context, int Index) {
              return List_item(
                isTick: isTick.contains(Index),
                chBox: changeBox,
                inend: Index,
                isExist: isTick.isNotEmpty,
                showD: Index == 0 ? showD : null,
              );
            }));
  }
}

// ignore: must_be_immutable
class List_item extends StatelessWidget {
  final showD;
  final chBox;
  var isTick = true;
  int inend;
  bool isExist = true;
  String _phoneCall = '';
  List_item({this.isTick, this.chBox, this.inend, this.isExist, this.showD});

  @override
  Widget build(BuildContext context) {
    return
        // Slidable(
        // actionPane: SlidableDrawerActionPane(),
        // actions: isExist
        //     ? <Widget>[
        //         if (inend != 0)
        //           IconSlideAction(
        //               icon: Icons.phone,
        //               caption: 'CALL',
        //               color: Colors.blue,
        //               //not defined closeOnTap so list will get closed when clicked
        //               onTap: () {
        //                 print("");
        //               }),
        //         IconSlideAction(
        //             icon: Icons.chat_rounded,
        //             caption: 'SMS',
        //             color: Colors.blue,
        //             //not defined closeOnTap so list will get closed when clicked
        //             onTap: () {
        //               print("");
        //             })
        //       ]
        //     : null,
        // secondaryActions: isExist
        // ?<Widget>[
        //   IconSlideAction(
        //       icon: Icons.delete,
        //       color: Colors.red,
        //       caption: 'Delete',
        //       closeOnTap: false, //list will not close on tap
        //       onTap: () {
        //         print("");
        //       })
        // ]
        // :null,
        ListTile(
      onLongPress: () {
        launch('tel:$_phoneCall');
      },
      onTap: () {
        return showDialog<String>(
            context: context,
            builder: (BuildContext ctx) => new AlertDialog(
                  title: new Text('fhdlksjskd'),
                  content: new Text('fhdlksdddddjskd'),
                ));
      },
      title: inend == 0 ? new Text('انتخاب همه') : new Text('dslkfjds'),
      leading: CircleAvatar(
        child: inend == 0
            ? InkWell(
                child: Icon(
                  Icons.delete_outlined,
                  color: Colors.grey,
                  size: 28.0,
                ),
              )
            : new Text('d'),
        backgroundColor: inend == 0 && isExist ? Colors.red : Colors.blueGrey,
      ),
      trailing: isExist && inend == 0
          ? new Container(
              margin: EdgeInsets.only(left: 10, top: 10.0),
              child: InkWell(
                onTap: () {
                  showD();
                },
                onDoubleTap: () {
                  chBox(false, inend);
                },
                child: Icon(
                  Icons.sms,
                  color: Colors.green,
                  size: 32.0,
                ),
              ),
            )
          : new Checkbox(
              value: isTick,
              onChanged: (bool check) {
                chBox(check, inend);
              }),
    );
  }
}
