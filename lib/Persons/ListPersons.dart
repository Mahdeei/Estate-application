import 'package:flutter_amlak/Model/Person.dart';
import 'package:flutter_amlak/Other/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ListPersons extends StatefulWidget {
  @override
  _ListPersonsState createState() => _ListPersonsState();
}

class _ListPersonsState extends State<ListPersons> {
  Size phoneSize;
  bool isLoading = true;
  SharedPreferences prfs;
  Set a=new Set();
  List<Person> persons =[];
  @override
  void initState() {
    super.initState();
    getData();
    print("phoneSize.heightMultiplier");
    print(SizeConfig.heightMultiplier);
  }


  getData()async{
    if(this.mounted){
      prfs = await SharedPreferences.getInstance();
      a = prfs.getKeys();
      a.forEach((key) {
        if(key.toString().startsWith("p")){
          persons.add(toClass(prfs.getStringList(key),key));
        }
      });
      setState(() {
        isLoading =false;
      });
    }
  }


  Person toClass(List a,String key){
    Person person = new Person();
    person.id=key;
    person.name=a[0];
    person.mobilePhone=a[1];
    person.tozihat=a[2];
    return person;
  }

  @override
  Widget build(BuildContext context) {
    phoneSize = MediaQuery.of(context).size;
    return SafeArea(
      top: true,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: isLoading
              ? new Center(child: new CircularProgressIndicator(),)
              : persons.length==0
                ? new Center(child: new Text("هنوز مخاطبی را ذخیره نکردید ."),)
                : ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        index==0 ?
                          new Column(
                            children: [
                              new SizedBox(height: 28.0,),
                              new RawMaterialButton(
                                onPressed: (){
                                },
                                child: new Text("  لیست افراد ذخیره شده  "),
                                fillColor: Colors.white60,
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                              ),
                              new SizedBox(height: 10.0,),
                            ],
                          )
                          : new SizedBox(),
                        new Container(
                        height: SizeConfig.heightMultiplier * 14,
                          child: GestureDetector(
                            onTap: (){

                            },
                            onLongPress: ()async{
                              if(this.mounted){
                                setState(() {
                                  isLoading=true;
                                });
                              }
                              bool remove= await prfs.remove(persons[index].id);
                              persons.removeAt(index);
                              if(remove){
                                if(this.mounted){
                                  setState(() {
                                      isLoading=false;
                                  });
                                }
                              }
                              print(remove);
                              setState(() {

                              });
                            },
                            child: Card(
                              elevation: .1,
                              color: Colors.grey[100],
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: new Padding(
                                      padding: const EdgeInsets.only(top: 5.0, left: 7.0),
                                      child: Center(
                                        child: new CircleAvatar(radius: SizeConfig.heightMultiplier*4.5,
                                          backgroundColor: Colors.white,
                                          child: new Icon(Icons.person,size: SizeConfig.heightMultiplier *6,color: Colors.grey,),
                                          // minRadius: 30.0
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: new Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.heightMultiplier*2.3, right:SizeConfig.heightMultiplier* 3),
                                      child: new Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: new Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment: Alignment.centerRight,
                                                    child: new Text(persons[index].name,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize:SizeConfig.heightMultiplier *1.6,fontFamily: "Vazir")),
                                                  ),
                                                ),
                                                new SizedBox(
                                                  width: SizeConfig.heightMultiplier *1.7,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(/*margin: const EdgeInsets.only(left: 5)*/
                                                    alignment: Alignment.centerLeft,
                                                    width: SizeConfig.heightMultiplier * .35,
                                                    child: new Text(
                                                      persons[index].mobilePhone,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: SizeConfig.heightMultiplier * 1.5),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: new Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: new Align(
                                                      alignment: Alignment.centerRight,
                                                      child: new Padding(
                                                        padding: EdgeInsets.only(right: 8.0),
                                                        child: Container(
                                                            width: phoneSize.width*.6,
                                                            child: new Text(
                                                              persons[index].tozihat,
                                                              maxLines: 1,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(fontSize: SizeConfig.heightMultiplier * 1.9,),
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // new Row(
                        //   children: [
                        //     new Icon(Icons.person),
                        //     new Column(
                        //       children: [
                        //         new Text(persons[index].name),
                        //         new SizedBox(height: 5.0,),
                        //         new Text(persons[index].mobilePhone),
                        //       ],
                        //     )
                        //   ],
                        // ),
                        // Divider(),
                        // new ListTile(
                        //   title: new Text(persons[index].name),
                        //   subtitle: new Text(persons[index].mobilePhone),
                        //   leading: new Icon(Icons.person),
                        //
                        //   trailing: new Text(persons[index].tozihat+persons[index].tozihat),
                        //   onTap: (){
                        //     print(persons[index].name);
                        //   },
                        //
                        // ),
                      ],
                    );
                  },

                  ),
        ),
      ),
    );
  }
}
