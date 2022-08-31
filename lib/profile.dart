import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.5),
      appBar: AppBar(
        elevation: 0.4,
        title: Text(
          'Suzan ALkarkhi',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20, bottom: 3),
          child: ListView(

            children: [
              SizedBox(height: 5,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 150,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.card_giftcard),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Green', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              Text('0 pts', style: TextStyle(color: Colors.grey,fontSize: 10),),
                            ],

                          ),
                        ],
                      ),

                      Icon(Icons.arrow_forward_ios_rounded),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(.3)),
                            child: Icon(Icons.person)),
                        Text('Profile')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(.3)),
                            child: Icon(Icons.headphones)),
                        Text('Customer')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.withOpacity(.3)),
                            child: Icon(Icons.card_membership)),
                        Text('payment')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(.3)),
                                child: Icon(Icons.language)),
                            Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                child: Text('En'),
                              ),
                            ),
                          ],
                        ),
                        Text('Language')
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              dividedCard(
                  Row(
                    children: [
                      Text(
                        'try',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.warning_amber_outlined)
                    ],
                  ),
                  [
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                  ]),
              dividedCard(
                  Row(
                    children: [
                      Text(
                        'try',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  [
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                  ]),
              dividedCard(
                  Row(
                    children: [
                      Text(
                        'try',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.warning_amber_outlined)
                    ],
                  ),
                  [
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                  ]),
              dividedCard(
                  Row(
                    children: [
                      Text(
                        'try',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.warning_amber_outlined)
                    ],
                  ),
                  [
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.wallet_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Wallet'),
                      ],
                    ),
                  ]),
            SizedBox(height: 10,),
            Container(
            padding: EdgeInsets.all(10),
            width: 150,

            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white),
            child:  Row(
              children: [
                Icon(Icons.exit_to_app),
                Text('Logout'),
              ],

            ))
            ],
          ),
        ),
      ),
    );
  }

  Widget dividedCard(title, List childrenList) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          SizedBox(
            height: 15,
          ),
          for (var item in childrenList)
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                item,
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 3,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            )
        ],
      ),
    );
  }
}
