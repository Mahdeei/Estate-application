import 'package:flutter_amlak/Http/get_teammate.dart';
import 'package:flutter_amlak/Model/Customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_amlak/Model/Person.dart';
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


  List<Persons> persons = [];
  Size phoneSize;
  bool isLoading = true;
  bool isTick;
  TextEditingController _controllerMessage;



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
      // recipents.add(element.mobilePhone.toString());
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
  void initState() {

    super.initState();

    _getTeammate();
  }

  _getTeammate() async {
    if(this.mounted){
      var x =  await HttpTeammate.getData();
      persons.addAll(x);
      setState(() {
      });
      persons.forEach((element) {
        print(element.name);
      });
    }



  }


  @override
  Widget build(BuildContext context) {
    phoneSize = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: persons.length==0
            ? new Container(
            width: 50.0,
            height: 50.0,
              child: new CircularProgressIndicator())
          : ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black12,
                ),
            itemCount:  persons.length ,
            // ignore: non_constant_identifier_names
            itemBuilder: (BuildContext context, int index) {
              // print("index");
              // print(index);
              return ListItem(
                  isTick: isTick, chBox: changeBox, inend: index, showD: showD,person: persons[index],);
            })

    );
  }
}

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  final chBox;
  bool isTick = true;
  int inend;
  String _phoneNumber;
  var showD;
  Persons person;
  ListItem({this.isTick, this.chBox, this.inend, this.showD,this.person});

  @override
  Widget build(BuildContext context) {
    // print("person.id");
    // print(person.id);
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
                      title: new Text(person.name),
                      content: new Text(person.note),
                    ));
          },
          title: inend == 0 ? new Text('پیامک همگانی') : new Text(person.name),
          leading: CircleAvatar(
            child: new Text('d'),
            backgroundColor: Colors.blueGrey,
          ),
          trailing: new Icon(Icons.keyboard_arrow_left_rounded),
        ));
  }
}
