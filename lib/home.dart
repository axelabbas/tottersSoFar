import 'package:flutter/material.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:fulltoters/restprofile.dart';



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<String> listImages = [
    'images/bg.jpg',
    'images/bg.jpg',
    'images/bg.jpg',
    'images/bg.jpg',
  ];
  String restName = 'Burger King';
  String restImg = 'https://st2.depositphotos.com/1000339/5752/i/600/depositphotos_57527967-stock-photo-burger-and-french-fries.jpg';
  String restLoc = 'Baghdad';
  String delRange = '36 - 45';
  String restBio =
      'The king of all burgers, tasty puns, idk what to say tbh please send help';
  double restRating = 4.6;
  String userName = 'Fadel Abbas';
  String userComment = 'Great taste, juicy, i really liked it';
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
            Container(
              height: 350,
              width: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: infocard(restImg, restName,delRange),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: infocard(restImg, restName,delRange),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: infocard(restImg, restName,delRange),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: infocard(restImg, restName,delRange),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: infocard(restImg, restName,delRange),
                  ),
                ],
              ),
            ),

          ],
        ),
      );

  }

  Widget infocard(url, name,delrange) {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTap: () {
            print('tabbed');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => restprof(
                  restImage: restImg,
                  restName: restName,
                  restLoc: restLoc,
                  restBio: restBio,
                  restRating: restRating,
                  delRange: delRange,
                  userName: userName,
                  userComment: userComment,
                )));
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
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('breakfast'),
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
                        borderRadius: BorderRadius.circular(15)

                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.recycling,size: 25,color: Colors.orange,),
                        Text('10% Cashback',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                      ],
                    ),

                  ),
                  SizedBox(width: 10,),

                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(.3),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('+',style: TextStyle(fontSize: 25,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                        Text('Earn points',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
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
