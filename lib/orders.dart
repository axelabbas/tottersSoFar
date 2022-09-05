import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(

          bottom: const TabBar(
            indicatorColor: Colors.white,

            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: "Past Order",
                //  icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                text: "Upcoming",
                // icon: Icon(Icons.beach_access_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text("You do not have any past orders", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            ),
             Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.network('https://images.all-free-download.com/images/graphiclarge/error_404_page_not_found_6845510.jpg',width: 200,height: 200,),
                  Text("No upcoming orders", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

                ],
              ),

          ],
        ),
      ),
    );

  }
}
