import 'package:flutter_amlak/Model/Person.dart';
import 'package:flutter_amlak/Other/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Listcon extends StatefulWidget {
  @override
  _ListconState createState() => _ListconState();
}

class _ListconState extends State<Listcon> {
  Size phoneSize;
  bool isLoading = true;
  SharedPreferences prfs;
  Set a = new Set();

  List<Person> persons = [];
  @override
  void initState() {
    super.initState();
    getData();
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
            itemCount: 5,
            // ignore: non_constant_identifier_names
            itemBuilder: (BuildContext context, int Index) {
              return ListItem();
            }));
  }
}

// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  String _phoneNumber;
  ListItem();

  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: <Widget>[
          IconSlideAction(
              icon: Icons.phone,
              caption: 'تماس',
              color: Colors.blue[700],
              //not defined closeOnTap so list will get closed when clicked
              onTap: () {
                launch('tel:$_phoneNumber');
                print("");
              }),
          IconSlideAction(
              icon: Icons.chat_rounded,
              caption: 'پیامک',
              color: Colors.green[700],
              //not defined closeOnTap so list will get closed when clicked
              onTap: () {
                launch('sms:$_phoneNumber');
                print("");
              }),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              caption: 'حذف',
              closeOnTap: false, //list will not close on tap
              onTap: () {
                print("");
              })
        ],
        child: ListTile(
          title: new Text('اقای حسینی'),
          leading: IconButton(
            color: Colors.blueGrey,
            icon: Icon(Icons.info_outline_rounded),
            onPressed: () {
              return showDialog<String>(
                  context: context,
                  builder: (BuildContext ctx) => new Directionality(
                      textDirection: TextDirection.rtl,
                      child: AlertDialog(
                        title: new Text('اجاره'),
                        content: new Text(
                            'دو خواب - بزرگ - هانواده پنج نفره - 150 میلیون رهن کامل'),
                      )));
            },
          ),
          trailing:
              new Icon(Icons.keyboard_arrow_left_rounded, color: Colors.teal),
        ));
  }
}
