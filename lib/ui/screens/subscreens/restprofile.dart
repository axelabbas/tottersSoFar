import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fulltoters/ui/screens/subscreens/itemInfo.dart';
import 'package:http/http.dart';

class restprof extends StatefulWidget {
    final int restId;
    restprof({
      required this.restId,
    });
  @override
  State<restprof> createState() => _restprofState();
}

class _restprofState extends State<restprof> {
  Map restInfo = {};
  List itemList = [];
  Future getData() async{
    var url=Uri.parse("http://localhost:4000/restList/${widget.restId}");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    return list1;
  }
  Future getMenuData() async{
    var url=Uri.parse("http://localhost:4000/menu/${widget.restId}");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    return list1;
  }
  int fullStars = 5;


  @override
  void initState(){
    super.initState();
    getData().then((value) {
      setState((){
        restInfo = value[0];
      });
    });
    getMenuData().then((value) {
      setState((){
        itemList = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.arrow_back,color: Colors.black,),
      ),

      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${restInfo['imageUrl']}'),
                )),
              ),
              Positioned(
                bottom: -20,
                right: 10,
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          spreadRadius: 7,
                          color: Colors.black.withOpacity(.3),
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${restInfo['estTime']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('mins')
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${restInfo['restName']} - ${restInfo['location']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${restInfo['dscrp']}',
                  style: TextStyle(
                      fontSize: 15, color: Colors.black.withOpacity(.7)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent.withOpacity(.4),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.recycling,
                            size: 25,
                            color: Colors.orange,
                          ),
                          Text(
                            '${restInfo['discount']}% off',
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (restInfo['earnPoints']=='true')

                      Container(
                      decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(.3),
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Earn points',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, index){
                      return Padding(padding: EdgeInsets.all(8),
                      child:  cardfun(itemList[index]['itemName'], itemList[index]['itemImage'],itemList[index]['id']));
                    },
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${restInfo['rate']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                ),
                              ],
                            ),
                            Text('based on 1200 rating')
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '${restInfo['commentName']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.greenAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.greenAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.greenAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.greenAccent,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.greenAccent,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('"${restInfo['commentText']}"')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardfun(name, img,itemid) {
    return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => iteminfo(restId: widget.restId,itemId:itemid ,)),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                img,
                height: 100,
                width: 100,
              ),
              Text(name),
            ],
          ),
        ),
    );
  }
}
