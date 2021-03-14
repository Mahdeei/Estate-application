import 'package:flutter_amlak/Other/SizeConfig.dart';
import 'package:flutter_amlak/Model/Estate.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ListEstate extends StatefulWidget {
  @override
  _ListEstateState createState() => _ListEstateState();
}

class _ListEstateState extends State<ListEstate> {
  Size phoneSize;
  bool isLoading = true;
  SharedPreferences prfs;
  Set a=new Set();
  List<Estate> estate =[];
  @override
  void initState() {
    super.initState();
    getData();
  }


  getData()async{
    if(this.mounted){
      prfs = await SharedPreferences.getInstance();
      a = prfs.getKeys();
      a.forEach((key) {
        if(key.toString().startsWith("e")){
          estate.add(toClass(prfs.getStringList(key),key));
        }

      });
      setState(() {
        isLoading =false;
      });
    }
  }


  Estate toClass(List a,String key){
    Estate estate = new Estate();
    estate.id=key;
    estate.noteBook=a[0];
    estate.nameOwner=a[1];
    estate.phoneOwner=a[2];
    return estate;
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
              : estate.length==0
              ? new Center(child: new Text("هنوز موردی را ذخیره نکردید ."),)
              : ListView.builder(
            itemCount: estate.length,
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
                        child: new Text("  لیست مورد های ذخیره شده  "),
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
                        bool remove= await prfs.remove(estate[index].id);
                        estate.removeAt(index);
                        if(remove){

                          if(this.mounted){
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                        print(remove);
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
                                              child: new Text(estate[index].nameOwner,
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
                                                estate[index].phoneOwner,
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
                                                        estate[index].noteBook,
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
