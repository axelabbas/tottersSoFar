import 'package:flutter/material.dart';

class restprof extends StatefulWidget {

  final String restName;
  final String restImage;
  final String restLoc;
  final String delRange;
  final String restBio;
  final double restRating;
  final String userName;
  final String userComment;

  restprof({
    required this.restName,
    required this.restImage,
    required this.restLoc,
    required this.delRange,
    required this.restBio,
    required this.restRating,
    required this.userName,
    required this.userComment,
});
  @override
  State<restprof> createState() => _restprofState();
}

class _restprofState extends State<restprof> {
  int fullStars = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body:Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 450,
                width: 400,
                decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.restImage),
                )
              ),
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
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${widget.delRange}',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('mins')
                    ],

                  ),),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('${widget.restName} - ${widget.restLoc}', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 5,),
                Text('${widget.restBio}', style: TextStyle(fontSize: 15,color: Colors.black.withOpacity(.7)),),
                SizedBox(height: 20,),
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
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('${widget.restRating}', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        SizedBox(width: 10,),
                        Column(
                          children: [

                            Row(children: [
                              Icon(Icons.star,color: Colors.greenAccent,),
                              Icon(Icons.star,color: Colors.greenAccent,),
                              Icon(Icons.star,color: Colors.greenAccent,),
                              Icon(Icons.star,color: Colors.greenAccent,),
                              Icon(Icons.star,color: Colors.greenAccent,),
                            ],),
                            Text('based on 1200 rating')

                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
                SizedBox(height: 10,),
                Divider(
                  thickness: 3,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('${widget.userName}', style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Icon(Icons.star,color: Colors.greenAccent,),
                    Icon(Icons.star,color: Colors.greenAccent,),
                    Icon(Icons.star,color: Colors.greenAccent,),
                    Icon(Icons.star,color: Colors.greenAccent,),
                    Icon(Icons.star,color: Colors.greenAccent,),
                  ],

                ),
                SizedBox(height: 10,),

                Text('"${widget.userComment}"')
              ],
            ),
          ),
        ],
      ),

    );
  }
}
