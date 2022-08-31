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
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Past Order",
                //  icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                text: "Upcoming",
                // icon: Icon(Icons.beach_access_sharp),
              ), Tab(
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
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("You do not have any pat orders"),
            ),
            Center(
              child: Text("You do not have any pat orders"),
            ), Center(
              child: Text("You do not have any pat orders"),
            ), Center(
              child: Text("You do not have any pat orders"),
            ),
          ],
        ),
      ),
    );

  }
}
