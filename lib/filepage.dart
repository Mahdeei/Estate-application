import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class Filepage extends StatefulWidget {
  const Filepage({Key key}) : super(key: key);
  @override
  _FilepageState createState() => _FilepageState();
}

class _FilepageState extends State<Filepage> {
   Widget _Buildrow(int id) {
    return CachedNetworkImage(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU',
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }

  ScrollController scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        new Text(''),
                        new Text(''),
                        new IconButton(
                            icon: Icon(Icons.check_circle), onPressed: () {}),
                      ],
                    )
                  ]),
            ],
            stretchTriggerOffset: 200.0,
            pinned: false,
            expandedHeight: 280.0,
            flexibleSpace: FlexibleSpaceBar(
              title: new Text('املاک مهدی'),
              background: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, index) {
                  return _Buildrow(index);
                },
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: new Stack(
              fit: StackFit.loose,
              overflow: Overflow.visible,
              children: [
                Divider(
                  thickness: 3,
                  
                  color: Colors.black12,
                  endIndent: 140.0,
                  indent: 140.0,
                ),
                SizedBox.expand(
                    child: Container(
                  margin: EdgeInsets.only(top: 22.0),
                  padding: EdgeInsets.only(top: 18.0),
                  child: blueCom(),
                  decoration: BoxDecoration(
                    gradient: FlutterGradients.aquaGuidance()
                  ),
                )),
                _buildDraggableScrollableSheet(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: this._getBottomAppBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.app_registration),
        onPressed: () {},
      ),
    );
  }

  Widget _getBottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      shape: CircularNotchedRectangle(),
      child: ButtonBar(
        buttonHeight: 2.0,
        alignment: MainAxisAlignment.start,
        children: [
          new FlatButton.icon(
              icon: Icon(Icons.person, size: 56.0, color: Colors.black),
              label: new Text(
                ' محمدی \n 093031638',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                return showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => new Container(
                          decoration:BoxDecoration(
                            gradient: FlutterGradients.seaLord()
                          ),
                          alignment: Alignment.center,
                          height: 120.0,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Row(children: [
                              new Icon(Icons.person, size: 56.0, color: Colors.black),
                              new Text(' محمدی \n 093031638'),]),
                              new FlatButton(child: Icon(Icons.call),onPressed: (){},)
                          ]
                          )
                        ));
              }),
        ],
      ),
    );
  }
}

DraggableScrollableSheet _buildDraggableScrollableSheet() {
  Widget _Buildwarp() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      direction: Axis.horizontal,
      children: [
        'اسانسور',
        'پارکینگ',
        'انباری',
        'بالکن',
        'کف سرامیک',
        'سرویس بهداشتی ایرانی',
        'سرمایش کولرابی',
        'گرمایش پکیج',
        'ابگرم کن',
      ]
          .map((String name) => Chip(
                avatar: CircleAvatar(
                  child: Text(name.substring(0, 1)),
                ),
                label: Text(name),
              ))
          .toList(),
    );
  }

  return DraggableScrollableSheet(
    initialChildSize: 0.16,
    minChildSize: 0.16,
    maxChildSize: 0.59,
    builder: (BuildContext context, ScrollController scrollController) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
        ),
        child: Scrollbar(
            controller: scrollController,
            child: ListView(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              children: [
                new Center(
                  child: new IconButton(
                    icon: Icon(Icons.arrow_drop_up),
                    iconSize: 48.0,
                    color: Colors.black54,
                    onPressed: () {
                      print('fds');
                    },
                  ),
                  heightFactor: 0.001,
                ),
                new Center(
                    heightFactor: 1.5,
                    child: new Text(
                      'امکانات   ',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Divider(
                  height: 2.0,
                ),
                new ExpansionTile(
                  title: new Text('سایر مشخصات'),
                  children: [
                    ListTile(
                      leading: new Text('2,000,000'),
                      trailing: new Text('قیمت کل' + ''),
                    ),
                    ListTile(
                      leading: new Text('چهار '),
                      trailing: new Text('تعداد واحد در طبقه' + ''),
                    ),
                    ListTile(
                      leading: new Text('خیر'),
                      trailing: new Text('سند دارد' + ''),
                    ),
                    ListTile(
                      leading: new Text('شمالی'),
                      trailing: new Text('جهت ساختمان' + ''),
                    ),
                    ListTile(
                      leading: new Text('نوساز'),
                      trailing: new Text('وضعیت ساخت' + ''),
                    ),
                    // inja ba inke haft tast ama faghat 6tao neshon mide
                  ],
                ),
                Divider(),
                Center(child: _Buildwarp()),
                Divider(),
                new Directionality(
                  textDirection: TextDirection.rtl,
                  child:  new Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black12,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.0, top: 30.0),
                    child: new Text(''' 
                      dksjfkdsjfkdjskjfklds
                      dksjfkldjkfjdlksf
                      jdfkjdkljsfkd
                      fjkdjfskldf
                      jdkjsfk;fj
                      djfkjnkkjdkifjd
                      s jfkdjkjf jfkjk jf;jk jkfjdjf
                      dj jkfjdk k kjkfjkejk k kjkf 

                    ''',textDirection: TextDirection.rtl,),
                  ),
                )),
              ],
            )),
      );
    },
  );
}

Widget blueCom() {
  return new Padding(
    padding: EdgeInsets.all(0.0),
    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          new Column(
            children: [
              new Text('قیمت هر متر',
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0)),
              SizedBox(
                height: 12.0,
              ),
              new Text('12 میلیون'),
            ],
          ),
          new Column(
            children: [
              new Text('سال تاسیس',
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0)),
              SizedBox(
                height: 12.0,
              ),
              new Text('1398'),
            ],
          ),
          new Column(
            children: [
              new Text('تعداد خواب',
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0)),
              SizedBox(
                height: 12.0,
              ),
              new Text('3 خوابه'),
            ],
          ),
        ],
      ),
      new Divider(),
      new SizedBox(
        height: 12.0,
      ),
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Column(
            children: [
              new Text('متراژ',
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0)),
              SizedBox(
                height: 12.0,
              ),
              new Text('130 متر'),
            ],
          ),
          new VerticalDivider(
            color: Colors.black,
          ),
          new Column(
            children: [
              new Text('تعداد طبقات',
                  style:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 18.0)),
              SizedBox(
                height: 12.0,
              ),
              new Text('4 طبقه'),
            ],
          ),
        ],
      ),
      SizedBox(
        height: 12.0,
      ),
      new Divider(),
    ]),
  );
}
