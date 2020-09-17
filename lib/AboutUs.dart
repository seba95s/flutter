import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[900],
          title: Text('HuQQa BuzZ',style:TextStyle(fontFamily: 'Raleway')),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Stack(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image(
              color: Colors.grey[600],
              colorBlendMode: BlendMode.modulate,
              image: new AssetImage('images/ab.jpg'),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 110, top: 100),
                  child: Text('Who are we?',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'We are an online food ordering service that helps customers find restaurants in their area, filter by cuisine, browse menus and place their orders with an option of online payment or cash on delivery.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 15,
                            color: Colors.black)),
                  ])),
          SizedBox(
            height: 10,
          ),

          //   Row(children: <Widget>[
          //     Container(
          //       margin: EdgeInsets.only(left: 50),
          //       child: Text(
          //         'Who are we?',
          //         style: TextStyle(
          //           fontSize: 25,
          //           fontFamily: 'DancingScript',
          //           color: Colors.black,
          //         ),
          //       ),
          //     )
          //   ])
          // ]),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.deepOrange[900],
                      )),
                  FlatButton(
                      onPressed: () {},
                      child: Icon(Icons.check, color: Colors.deepOrange[900])),
                  FlatButton(
                      onPressed: () {},
                      child: Icon(Icons.attach_money,
                          color: Colors.deepOrange[900])),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('  Choose your meal',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Colors.black,
                      )),
                  Text(' '),
                  Text(
                    'Place Order',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Colors.black,
                    ),
                  ),
                  Text(' '),
                  Text(
                    'Pay Cash or Card',
                    style:
                        TextStyle(fontFamily: 'Raleway', color: Colors.black),
                  ),
                  Text(' ')
                ],
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Your credit card is of no concern to us!',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    Text(''),
                    Text(
                      ' We take your orders in the most accurate, fastest and easiest way and forward them to the relevant restaurant completely and instantly. Credit card, no security problem. Place your order at no extra cost  and you will have your food in 10-45 minutes (average shipping time of the restaurant).',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ]))
        ])));
  }
}
