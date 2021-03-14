import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Addfile extends StatefulWidget {
  
  String string ;
  Addfile({this.string});
  @override
  _AddfileState createState() => _AddfileState();
}

class _AddfileState extends State<Addfile> {
  GlobalKey<ScaffoldState> _scaffolKey = GlobalKey<ScaffoldState>();

  List<File> _imageFile = [];
  final _picker = new ImagePicker();
  int id = 1;
  bool wichbool = false;
  var icon = Icons.check;
  // static int count = 0;
  TextEditingController _controllerNoteBook, _controllerName, _controllerPhone;
  List<List<String>> estates = [];

  @override
  void initState() {
    super.initState();
    _controllerNoteBook = TextEditingController();
    _controllerName = TextEditingController();
    _controllerPhone = TextEditingController();
    getid();
  }

  getid() async {
    SharedPreferences prfs = await SharedPreferences.getInstance();
    Set a = prfs.getKeys();

    a.forEach((element) async {
      if (element.toString().startsWith("e")) {
        print("element");
        print(element);
        List tmp = prfs.getStringList(element);
        print(tmp);
        estates.add(tmp);
        id++;
      }
    });
    print(estates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffolKey,
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              new FlatButton.icon(
                  icon: Icon(Icons.person, size: 56.0, color: Colors.black),
                  label: new Text(' افزودن مالک',
                      style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    return this._scaffolKey.currentState.showBottomSheet(
                          (BuildContext context) => new Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 4.0),
                              padding: EdgeInsets.symmetric(horizontal: 24.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0)),
                              height: 200.0,
                              child: new Directionality(
                                textDirection: TextDirection.rtl,
                                child: new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextField(
                                        controller: _controllerName,
                                        decoration: InputDecoration(
                                          helperText: 'نام',
                                        )),
                                    TextField(
                                        controller: _controllerPhone,
                                        decoration: InputDecoration(
                                            helperText: 'تلفن')),
                                    new FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: new Text('ذخیره'),
                                    ),
                                  ],
                                ),
                              )),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(14.0)),
                          ),
                        );
                  }),
              new FlatButton(
                  onPressed: () async {
                    SharedPreferences perfs =
                        await SharedPreferences.getInstance();
                    await perfs.setStringList("e $id", [
                      _controllerNoteBook.text,
                      _controllerName.text,
                      _controllerPhone.text,
                      ""
                    ]);
                    Navigator.of(context).pop();
                    print("POP Page");
                  },
                  splashColor: Colors.cyanAccent,
                  child: new Text(
                    'ذخیره',
                  )),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: new Text('0 / 6'),
          centerTitle: true,
        ),
        body: new Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: SingleChildScrollView(
                child: Column(children: [
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text('رهن یااجاره'),
                    new Switch(
                        value: wichbool,
                        onChanged: (bool news) {
                          setState(() {
                            this.wichbool = news;
                          });
                        }),
                    new Text('فروش یا معاوضه'),
                  ]),
              new Divider(
                thickness: 1.0,
                height: 30.0,
              ),
              // new Card(
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       suffix: new Text('تومان'),
              //       helperText: 'قیمت کل‌',

              //     ),
              //   ),

              //   ),

              new Card(
                shadowColor: Colors.black,
                elevation: 4.0,
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                child: SizedBox(
                    height: 40.0,
                    child: InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: new Text('مساحت'),
                                  content: new TextField(),
                                  actions: [
                                    FlatButton(
                                      child: const Text('تمام'),
                                      onPressed: () =>
                                          Navigator.pop(context, 'ok'),
                                    ),
                                    FlatButton(
                                        child: const Text('بیخیال'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'cancel')),
                                  ],
                                )),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text('  text'),
                              new Text('مساحت' + '   '),
                            ]))),
              ),
              new Card(
                  elevation: 4.0,
                  shadowColor: Colors.black,
                  margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
                  child: SizedBox(
                      height: 40.0,
                      child: InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: new Text('قیمت کل'),
                                  content: new TextField(),
                                  actions: [
                                    FlatButton(
                                      child: const Text('تمام'),
                                      onPressed: () =>
                                          Navigator.pop(context, 'ok'),
                                    ),
                                    FlatButton(
                                        child: const Text('بیخیال'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'cancel')),
                                  ],
                                )),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Text('  text'),
                              new Text('قیمت کل' + '  '),
                            ]),
                      ))),

//               new Card(
//                   elevation: 1.0,
//                   margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                   child: SizedBox(
//                     height: 40.0,
//                     child: InkWell(
//                         onTap: () => showDialog(
//                             context: context,
//                             builder: (BuildContext context) => AlertDialog(
//                                   backgroundColor: Colors.white,
//                                   title: new Text('Precent'),
//                                   content: new TextField(),
//                                   actions: [
//                                     FlatButton(
//                                       child: const Text('ok'),
//                                       onPressed: () =>
//                                           Navigator.pop(context, 'ok'),
//                                     ),
//                                     FlatButton(
//                                         child: const Text('cancel'),
//                                         onPressed: () =>
//                                             Navigator.pop(context, 'cancel')),
//                                   ],
//                                 )),
//                         child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               new Text('  text'),
//                               Divider(),
//                               new Text('Precent  '),
//                             ])),
//                   )),
//               new Divider(
//                 height: 10.0,
//                 color: Colors.blue,
//                 endIndent: 150,
//                 indent: 150,
//               ),
//               new ExpansionTile(title: new Text('اطلاعات'), children: [
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => showDialog(
//                               context: context,
//                               builder: (BuildContext context) => AlertDialog(
//                                     backgroundColor: Colors.white,
//                                     title: new Text('Precent'),
//                                     content: new TextField(),
//                                     actions: [
//                                       FlatButton(
//                                         child: const Text('ok'),
//                                         onPressed: () =>
//                                             Navigator.pop(context, 'ok'),
//                                       ),
//                                       FlatButton(
//                                           child: const Text('cancel'),
//                                           onPressed: () =>
//                                               Navigator.pop(context, 'cancel')),
//                                     ],
//                                   )),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => showDialog(
//                               context: context,
//                               builder: (BuildContext context) => AlertDialog(
//                                     backgroundColor: Colors.white,
//                                     title: new Text('Precent'),
//                                     content: new TextField(),
//                                     actions: [
//                                       FlatButton(
//                                         child: const Text('ok'),
//                                         onPressed: () =>
//                                             Navigator.pop(context, 'ok'),
//                                       ),
//                                       FlatButton(
//                                           child: const Text('cancel'),
//                                           onPressed: () =>
//                                               Navigator.pop(context, 'cancel')),
//                                     ],
//                                   )),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => this
//                               ._scaffolKey
//                               .currentState
//                               .showBottomSheet((context) =>CarouselSlider(
//   options: CarouselOptions(height: 200.0,scrollDirection: Axis.vertical),
//   items: [1,2,3,4,5].map((i) {
//     return Builder(
//       builder: (BuildContext context) {
//         return ListTile(
//           // width: MediaQuery.of(context).size.width,
//          title: Text('text $i', style: TextStyle(fontSize: 16.0),)
//         );
//       },
//     );
//   }).toList(),
// ),
//                                   ),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => this
//                               ._scaffolKey
//                               .currentState
//                               .showBottomSheet((context) => Container(
//                                     height: 200,
//                                     color:
//                                         Colors.lightGreen, //fdsfffffffffffffff
//                                     //   child: SingleChildScrollView(
//                                     //       child: ListView.builder(
//                                     //           itemBuilder: (context, index) =>
//                                     //               new Text(_items[index]),
//                                     //           itemCount: 10)),
//                                     // )
//                                   )),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => this
//                               ._scaffolKey
//                               .currentState
//                               .showBottomSheet((context) => Container(
//                                     height: 200,
//                                     color:
//                                         Colors.lightGreen, //fdsfffffffffffffff
//                                     //   child: SingleChildScrollView(
//                                     //       child: ListView.builder(
//                                     //           itemBuilder: (context, index) =>
//                                     //               new Text(_items[index]),
//                                     //           itemCount: 10)),
//                                     // )
//                                   )),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => this
//                               ._scaffolKey
//                               .currentState
//                               .showBottomSheet((context) => Container(
//                                     height: 200,
//                                     color:
//                                         Colors.lightGreen, //fdsfffffffffffffff
//                                     //   child: SingleChildScrollView(
//                                     //       child: ListView.builder(
//                                     //           itemBuilder: (context, index) =>
//                                     //               new Text(_items[index]),
//                                     //           itemCount: 10)),
//                                     // )
//                                   )),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => this
//                               ._scaffolKey
//                               .currentState
//                               .showBottomSheet((context) => Container(
//                                     height: 200,
//                                     color:
//                                         Colors.lightGreen, //fdsfffffffffffffff
//                                     //   child: SingleChildScrollView(
//                                     //       child: ListView.builder(
//                                     //           itemBuilder: (context, index) =>
//                                     //               new Text(_items[index]),
//                                     //           itemCount: 10)),
//                                     // )
//                                   )),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//                 new Card(
//                     elevation: 1.0,
//                     margin:
//                         EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//                     child: SizedBox(
//                       height: 40.0,
//                       child: InkWell(
//                           onTap: () => this
//                               ._scaffolKey
//                               .currentState
//                               .showBottomSheet((context) => Container(
//                                     height: 200,
//                                     color:
//                                         Colors.lightGreen, //fdsfffffffffffffff
//                                     //   child: SingleChildScrollView(
//                                     //       child: ListView.builder(
//                                     //           itemBuilder: (context, index) =>
//                                     //               new Text(_items[index]),
//                                     //           itemCount: 10)),
//                                     // )
//                                   )),
//                           child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 new Text('  text'),
//                                 Divider(),
//                                 new Text('Precent  '),
//                               ])),
//                     )),
//               ]),
//               new ExpansionTile(
//                 title: new Text('امکانات'),
//                 children: [
//                   new Wrap(
//                       spacing: 4.0,
//                       runSpacing: 4.0,
//                       children: [
//                         "اسانسور",
//                         "اسانسور",
//                         "اسانسور",
//                         "کف سرامیک",
//                         "اسانسور",
//                         "اسانسور",
//                       ]
//                           .map((String name) => InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   count++;
//                                   icon = (count % 2 == 0)
//                                       ? Icons.check
//                                       : Icons.home_work;
//                                 });
//                               },
//                               child: Chip(
//                                 avatar: Icon(icon),
//                                 label: new Text(name),
//                               )))
//                           .toList()),
//                 ],
//               ),
              new Divider(
                thickness: 1.0,
                height: 32.0,
              ),
              new Container(
                height: 270.0,
                width: 400.0,
                padding: EdgeInsets.all(10.0),
                color: Colors.black12,
                child: ListView.builder(
                    itemCount: _imageFile.length + 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (_imageFile.length == index) {
                        return Center(
                          widthFactor: _imageFile.length==0 ? 8 : 1.5 ,
                            child: IconButton(
                              color:Colors.blue ,
                              highlightColor: Colors.black,
                          icon: Icon(Icons.add, size: 50.0),
                          onPressed: () async => _pickImageFromGallery(),
                        ));
                      } else
                        return new InkWell(
                          splashColor: Colors.redAccent,
                          onLongPress: () {
                              Future.delayed(Duration(milliseconds:2000),(){
                                setState(() {
                              this._imageFile.remove(this._imageFile[index]);
                            });
                              });
                          },
                          child: new Container(
                              
                              padding: EdgeInsets.all(5.0),
                              child: Image.file(
                                this._imageFile[index],
                                width: 310,
                                fit: BoxFit.fill,
                              )),
                        );
                    }),
              ),
              new Divider(
                  thickness: 0.0, height: 22.0, endIndent: 20.0, indent: 20.0),

              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: new Directionality(
                    textDirection: TextDirection.rtl,
                    child: new TextField(
                      cursorColor: Colors.black12,
                      controller: _controllerNoteBook,
                      maxLines: 22,
                      minLines: 3,
                      onChanged: (text) => setState(() {}),
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          prefix: new Icon(Icons.home, color: Colors.black12),
                          counterText:
                              '${_controllerNoteBook.text.split('').length} words ',
                          labelText: 'یادداشت ها'),
                    ),
                  ))
            ]))));
  }

  Future<void> _pickImageFromGallery() async {
    final PickedFile _picFil =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      this._imageFile.add(File(_picFil.path));
    });
  }
}
