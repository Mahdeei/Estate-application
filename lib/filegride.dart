import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Filepage extends StatefulWidget {
  const Filepage({Key key}) : super(key: key);
  @override
  _FilepageState createState() => _FilepageState();
}

class _FilepageState extends State<Filepage> {
  Widget _buildRow(int id) {
    return CachedNetworkImage(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVU_qwFG2tzmgkEkAoJ90uea6aNYeVUffdAQ&usqp=CAU',
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(),
      ),
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => CircularProgressIndicator(),
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
                        new Text('hjhjhj'),
                        new IconButton(
                            icon: Icon(Icons.check_circle), onPressed: () {}),
                      ],
                    )
                  ]),
            ],
            stretchTriggerOffset: 200.0,
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: new InkWell(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => Scaffold(
                              backgroundColor: Colors.white10,
                              body: Center(
                                child: Hero(
                                    tag: 'name',
                                    child: SizedBox(
                                        height: 350,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 4,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return _buildRow(index);
                                          },
                                        ))),
                              ),
                            )));
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, index) {
                      return _buildRow(index);
                    },
                  )),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: new Stack(
              fit: StackFit.loose,
              overflow: Overflow.visible,
              children: [
                _buildDraggableScrollableSheet(),
                new Container(
                  color: Colors.white,
                  height: 20.0,
                ),
                Divider(
                  thickness: 3,
                  color: Colors.lightBlue,
                  endIndent: 140.0,
                  indent: 140.0,
                ),
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
                ' محمدی ',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                return showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => new Container(
                        alignment: Alignment.center,
                        height: 120.0,
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              new Row(children: [
                                new Icon(Icons.person,
                                    size: 56.0, color: Colors.black),
                                new Text(' محمدی \n 093031638'),
                              ]),
                              new FlatButton(
                                child: Icon(Icons.call),
                                onPressed: () {},
                              )
                            ])));
              }),
        ],
      ),
    );
  }
}

Widget _buildDraggableScrollableSheet() {
  // ignore: non_constant_identifier_names
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

  Widget greenCom() {
    return new Padding(
        padding: EdgeInsets.all(0.0),
        child: ExpansionTile(
          title: new Text('سایر مشخصات'),
          children: ['قیمت کل', 'واحد/طبقه', 'جهت ملک', 'وضعیت']
              .map((String str) => ListTile(
                    trailing: new Text(str),
                    title: new Text('x'),
                  ))
              .toList(),
        ));
  }

  Widget blueCom() {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: new Padding(
            padding: EdgeInsets.all(0.0),
            child: ExpansionTile(
              title: new Text('اطلاعات اولیه'),
              children: ['قیمت/متر', 'سال ساخت', 'متراژ', 'طبقه']
                  .map((String str) => ListTile(
                        title: new Text(str),
                        trailing: new Text('x'),
                      ))
                  .toList(),
            )));
  }

  return ListView(
    padding: EdgeInsets.all(0.0),
    children: [
      SizedBox(
        height: 10.0,
      ),
      blueCom(),
      greenCom(),
      Directionality(
          textDirection: TextDirection.rtl,
          child: ExpansionTile(
              title: new Text('امکانات'), children: [_Buildwarp()])),
      new Directionality(
          textDirection: TextDirection.rtl,
          child: new Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black12,
            ),
            child: new Text(''' 
                      dksjfkdsjfkdjskjfklds
                      dksjfkldjkfjdlksf
                      jdfkjdkljsfkd
                      fjkdjfskldf
                      jdkjsfk;fj
                      djfkjnkkjdkifjd
                      s jfkdjkjf jfkjk jf;jk jkfjdjf
                      dj jkfjdk k kjkfjkejk k kjkf 
                    '''),
          )),
    ],
  );
}
