import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> orderList = [];

  Future getData() async {
    var url = Uri.parse("http://localhost:4000/orders");
    Response response = await get(url);

    String body = response.body;

    List<dynamic> list1 = json.decode(body);

    return list1;
  }


  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        orderList = value;
      });
    });
  }

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
              child: Text("You do not have any past orders", style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (orderList.isEmpty) ?
                Column(
                  children: [

                    Image.network(
                      'https://images.all-free-download.com/images/graphiclarge/error_404_page_not_found_6845510.jpg',
                      width: 200, height: 200,),
                    Text("No upcoming orders", style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),)

                  ],
                ) : ListView.builder(
                  itemBuilder: (BuildContext context, int i) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),

                    );
                  },
                  itemCount: orderList.length,

                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget orders() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Secret Sandwich',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                        'bread,crispy chicken,secret sauce,cheese',
                      )),
                  Text(
                    'IQD 6,000',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              width: 100,
          color: Colors.red,
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: AssetImage('images/chicken.jpg'))),
            )
          ],
        ),
      ),
    );
  }
}