import 'package:flutter/material.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key? key}) : super(key: key);

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.search, color: Colors.black,),
            SizedBox(width: 10,),
            Container(
              height: 40,
              width: 300,
              padding: EdgeInsets.all(5),
              alignment: Alignment.centerLeft,
              child: Text('search here',style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.all(20),
              color: Colors.cyan,
            child: Row(children: [
              Image.network('https://image.made-in-china.com/2f0j00uZUEYgrSvpkj/Popular-Cub-Motorcycle-110cc-Avatar-Scooter.jpg',width: 75,height: 75,),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                Text('Order anything',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                Text('PLEASE DO IT FASTER',style: TextStyle(fontSize: 12),),
              ],),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
            ),
            ),
            SizedBox(height: 20,),
            card(),
            card(),
            card(),
            card(),
            card(),
          ],
        ),
      ),
    );
  }
  Widget card(){
    return Container(
      height: 150,
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Image.network('https://image.made-in-china.com/2f0j00uZUEYgrSvpkj/Popular-Cub-Motorcycle-110cc-Avatar-Scooter.jpg',width: 150,height: 150,),
        Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text('Order anything',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            Text('PLEASE DO IT FASTER\n very long text im too lazy',style: TextStyle(fontSize: 12),),
            Text('25 stores',style: TextStyle(fontSize: 10),),
          ],),
      ],
      ),
    );
  }
}
