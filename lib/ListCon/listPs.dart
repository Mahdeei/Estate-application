import 'package:flutter_amlak/Model/Person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Listcontact extends StatefulWidget {
  Listcontact({Key key}) : super(key: key);
  @override
  _ListcontactState createState() => _ListcontactState();
}

class _ListcontactState extends State<Listcontact> {
  Size phoneSize;
  bool isLoading = true;
  bool isTick;
  TextEditingController _controllerMessage;

  List<Person> persons = [];

  showD(int i, {int index}) {
    if (i == 0)
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  content: TextField(
                    maxLength: null,
                    controller: _controllerMessage,
                    keyboardType: TextInputType.multiline,
                  ),
                  title: new Text('Send for  person ...'),
                  actions: [
                    MaterialButton(
                        child: new Text('Send'),
                        onPressed: () {
                          print(_controllerMessage.text);
                          _sendSMS(_controllerMessage.text);
                        }),
                    MaterialButton(
                        child: new Text('Cancle'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ]));
    else if (i == 1) persons.removeAt(index);
  }

  void _sendSMS(String _message) async {
    List<String> recipents = [];
    persons.forEach((element) {
      recipents.add(element.mobilePhone.toString());
    });

    try {
      String _result = await sendSMS(message: _message, recipients: recipents);
      setState(() => _message = _result);
    } catch (error) {
      setState(() => _message = error.toString());
    }
    Fluttertoast.showToast(msg: _message);
  }

  changeBox(bool correct) {
    setState(() {
      isTick = correct;
    });
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
            itemCount: 5,
            // ignore: non_constant_identifier_names
            itemBuilder: (BuildContext context, int Index) {
              return ListItem(
                  isTick: isTick, chBox: changeBox, inend: Index, showD: showD);
            }));
  }
}

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  final chBox;
  bool isTick = true;
  int inend;
  String _phoneNumber;
  var showD;
  ListItem({this.isTick, this.chBox, this.inend, this.showD});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: <Widget>[
          if (inend != 0)
            IconSlideAction(
                icon: Icons.phone,
                caption: 'CALL',
                color: Colors.blue,
                //not defined closeOnTap so list will get closed when clicked
                onTap: () {
                  launch('tel:$_phoneNumber');
                  print("");
                }),
          IconSlideAction(
              icon: Icons.chat_rounded,
              caption: 'SMS',
              color: Colors.blue,
              //not defined closeOnTap so list will get closed when clicked
              onTap: () {
                if (inend == 0)
                  showD(inend);
                else
                  launch('sms:$_phoneNumber');
              }),
        ],
        secondaryActions: <Widget>[
          if (inend != 0)
            IconSlideAction(
                icon: Icons.delete,
                color: Colors.red,
                caption: 'Delete',
                closeOnTap: false, //list will not close on tap
                onTap: () {
                  showD(1, index: inend);
                  print("");
                })
        ],
        child: ListTile(
          onLongPress: () {
            return showDialog<String>(
                context: context,
                builder: (BuildContext ctx) => new AlertDialog(
                      title: new Text('fhdlksjskd'),
                      content: new Text('fhdlksdddddjskd'),
                    ));
          },
          title: inend == 0 ? new Text('پیامک همگانی') : new Text('dslkfjds'),
          leading: CircleAvatar(
            child: new Text('d'),
            backgroundColor: Colors.blueGrey,
          ),
          trailing: new Icon(Icons.keyboard_arrow_left_rounded),
        ));
  }
}
