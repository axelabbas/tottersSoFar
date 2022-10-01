import 'package:flutter/material.dart';

class butlerScreen extends StatefulWidget {
  const butlerScreen({Key? key}) : super(key: key);

  @override
  State<butlerScreen> createState() => _butlerScreenState();
}

class _butlerScreenState extends State<butlerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              height: 150,
              child: Center(child: Text('We deleiver anything (we are lying) \nim trying',style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Request a butler:', style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                  SizedBox(height: 10,),
                  card('Dilver your stuff', 'you forgot your keys because you are dumb, pay us to give it back to you', 'https://image.made-in-china.com/2f0j00uZUEYgrSvpkj/Popular-Cub-Motorcycle-110cc-Avatar-Scooter.jpg'),
                  card('Buy stuff', 'you need something from the story and you are lazy? pay us to get it for you', 'https://image.made-in-china.com/2f0j00uZUEYgrSvpkj/Popular-Cub-Motorcycle-110cc-Avatar-Scooter.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget card(title,bio,image){
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.withOpacity(.3),

      ),
      height: 150,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(color: Colors.greenAccent,fontSize: 20),),
                Text(bio, style: TextStyle(color: Colors.black,fontSize: 15),)
              ],
            ),
          ),
          Image.network(image,width: 100,height: 100,),
          SizedBox(width: 10,),
          Icon(Icons.arrow_forward_ios_rounded,color: Colors.orange,)
        ],
      ),
    );
  }
}
