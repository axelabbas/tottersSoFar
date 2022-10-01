import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:fulltoters/ui/screens/subscreens/restprofile.dart';
import 'package:http/http.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<dynamic> restList = [];

  Future getData() async{
    var url=Uri.parse("http://localhost:4000/restList");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);

    return list1;
  }


  final List<String> listImages = [
    'images/bg.jpg',
    'images/bg.jpg',
    'images/bg.jpg',
    'images/bg.jpg',
  ];
  String restId = '';

  @override
  void initState(){
    super.initState();
    getData().then((value) {
      setState((){
        restList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('login using toters app'),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ],
          ),
          CarouselImages(
            scaleFactor: 0.6,
            listImages: listImages,
            height: 300.0,
            borderRadius: 30.0,
            verticalAlignment: Alignment.topCenter,
            onTap: (index) {
              print('Tapped on page $index');
            },
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  itemcard(
                      'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
                      'البقاله',
                      100,
                      100),
                  itemcard(
                      'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
                      'توترز فريش',
                      100,
                      100),
                  itemcard(
                      'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
                      'مطاعم',
                      100,
                      100),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  itemcard(
                      'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
                      'اضف رصيد',
                      100,
                      100),
                  itemcard(
                      'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
                      'المندوب',
                      100,
                      100),
                  itemcard(
                      'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
                      'متاجر',
                      100,
                      100),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          Container(
            height: 350,
            width: 400,
            child: ListView.builder(
              itemBuilder: (BuildContext context,int i){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: infocard(restList[i]['id'],restList[i]['imageUrl'], restList[i]['restName'], restList[i]['estTime'],restList[i]['discount'],restList[i]['category'],restList[i]['earnPoints'],restList[i]["location"]),
                );
              },
              itemCount: restList.length,
              scrollDirection: Axis.horizontal,

            ),
          ),
          SizedBox(height: 10,),
          Divider(),
          Text("Weekly Discounts",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
          SizedBox(height: 5,),
          Text("Weekly Discounts you could enjoy for this week\nrefreshes everyweek!",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 15),),
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemBuilder: (BuildContext context,int i){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  (restList[i]['weeklyDisc']=='true')? infocard(restList[i]['id'],restList[i]['imageUrl'], restList[i]['restName'], restList[i]['estTime'],restList[i]['discount'],restList[i]['category'],restList[i]['earnPoints'],restList[i]["location"])
                      : Container()


                );
              },
              itemCount: restList.length,
              scrollDirection: Axis.horizontal,

            ),
          ),
        ],
      ),
    );
  }

  Widget infocard(restId,url, name, delrange,discount,category,earnpoints,restLocation) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey),
        boxShadow: [BoxShadow(
          color: Colors.grey,
          spreadRadius: 2,
          blurRadius: 10
        )],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTap: () async {
            print('tabbed');
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => restprof(
                      restId: restId,
                    )));
            setState(() {

            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(clipBehavior: Clip.none, children: [
                Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(url))),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: -10,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 5,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            delrange,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'min',
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )
                        ],
                      )),
                ),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${name} - ${restLocation}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        fontSize: 20),
                  ),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(category),
                  SizedBox(
                    width: 10,
                  ),
                  Text('-'),
                  SizedBox(
                    width: 10,
                  ),
                  Text('\$\$'),
                ],
              ),
              SizedBox(
                height: 10,
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
                          '${discount}% off',
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
                  if (earnpoints=='true')
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
            ],
          ),
        ),
      ),
    );
  }

  Widget itemcard(url, name, double h, double w) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: 5,
          spreadRadius: 5,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Image.network(
            url,
            width: 70,
            height: 70,
          ),
          Text(name),
        ],
      ),
    );
  }
}
