  import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class iteminfo extends StatefulWidget {
  final int itemId;
  final int restId;
  iteminfo({
    required this.itemId,
    required this.restId,
  });

  @override
  State<iteminfo> createState() => _iteminfoState();
}

class _iteminfoState extends State<iteminfo> {
  Future getData() async{
    var url=Uri.parse("http://localhost:4000/menu/${widget.restId}/${widget.itemId}");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    print(list1);

    return list1;
  }
  Map itemMap = {};
  @override
  void initState(){
    super.initState();
    getData().then((value) {
      setState((){
        itemMap = value[0];
      });
    });
  }
  Future Add_data(amount,price) async {
    var url = Uri.parse("http://localhost:4000/addOrder");
    Map<String, String> headers = {"Content-type": "application/json"};

    String data = jsonEncode({
      'menuId':widget.itemId,
      'restId':widget.restId,
      'amount':amount,
      'finalprice':price
    });
    // make POST request
    Response response = await post(url, headers: headers, body: data);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var body = jsonDecode(body1);
    print(body);
  }
  String varforradio = '';
  int number = 0;
  bool value1 = false;
  bool value2 = false;
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

      body: SafeArea(
        child: ListView(
          children: [
            Image.network(itemMap['itemImage']),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${itemMap['itemName']}', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 5,),
                Text('${itemMap['itemBio']}', style: TextStyle(fontSize: 12,color: Colors.grey),),
                SizedBox(height: 10,),
                Text('${itemMap['itemPrice']}', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.cyan),),
                SizedBox(height: 30,),

              ],
            ),
            Container(
              color: Colors.grey.withOpacity(.4),
              height: 3,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('choose a protion', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
        RadioListTile(
          title: const Text('Full Meal'),
          value: 'axel',
          tileColor: Colors.redAccent,
          groupValue: varforradio,
          onChanged: (value) {
            setState(() {
              print(value);

              varforradio = "$value";
            });
          },
        ), RadioListTile(
          title: const Text('Half Portion'),
          value: '3',
          groupValue: varforradio,
                  selectedTileColor: Colors.redAccent,

                  onChanged: (value) {
            setState(() {
              varforradio = "$value";
              print(value);

            });
          },
        ), RadioListTile(
          title: Row(

            children: [
              const Text('Quarter'),
              SizedBox(width: 10,),
              Text('- 150 g', style: TextStyle(color: Colors.grey),)

            ],
          ),
          value: '2',
          selectedTileColor: Colors.redAccent,
          groupValue: varforradio,
          onChanged: (value) {
            setState(() {
              varforradio = "$value";

              print(value);
            });
          },
        ),




              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(child: Icon(Icons.minimize),onTap: (){
                  if (number!=0){                  setState(() {
                    number -= 1;
                  });
                  }

                },),
                Text('$number'),
                  GestureDetector(child: Icon(Icons.plus_one),onTap: (){
                    setState(() {

                      number = number+1;
                    });
                }),


              ],
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(maximumSize: Size(300, 300),minimumSize: Size(300, 75)),
                onPressed: () {
                  Add_data(number, number*int.parse(itemMap['itemPrice']));
                  var snackBar = SnackBar(content: Text('Order Placed'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },

            child: Text('Place Order'))
          ],
        ),
      ),
    );
  }
}
