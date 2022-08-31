import 'package:flutter/material.dart';

class iteminfo extends StatefulWidget {
  const iteminfo({Key? key}) : super(key: key);

  @override
  State<iteminfo> createState() => _iteminfoState();
}

class _iteminfoState extends State<iteminfo> {
  String varforradio = '';
  int number = 0;
  bool value1 = false;
  bool value2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.cancel,color: Colors.black,),
        elevation: 0,
        actions: [
          Icon(Icons.favorite_outline,color: Colors.black,),
          SizedBox(width: 10,),
          Icon(Icons.share,color: Colors.black,)
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Image.asset('images/bg.jpg'),
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('A lot of chicken', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 5,),
                Text('im too lazy to open lorem ipsum please count this as that \n idk what else to say', style: TextStyle(fontSize: 12,color: Colors.grey),),
                SizedBox(height: 10,),
                Text('IQD free for kind people', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.cyan),),
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
          title: const Text('Half Chicken'),
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
            CheckboxListTile(

                value: value1, onChanged: (value) {
              setState(() {
                value1 = value!;
              });
            }),CheckboxListTile(
                value: value2, onChanged: (value) {
              setState(() {
                value2 = value!;
              });
            }),
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
            )
          ],
        ),
      ),
    );
  }
}
