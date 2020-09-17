import 'package:flutter/material.dart';

int dollar = 10;
int dollar1 = 14;
int dollar2 = 11;

class Burger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[900],
          title: Text('HuQQa BuzZ',style:TextStyle(fontFamily: 'Raleway')),
          
          centerTitle: true,
        ),
        
        body: Container(
            child: SafeArea(
                child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Text(
                ' Burger Menu',
                textAlign: TextAlign.right,
                style: TextStyle(fontFamily: 'Raleway', fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2.0,
                          blurRadius: 5.0)
                    ],
                  ),
                  child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        "images/b1.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Text(' '),
                        Text(' Cheese Burger   \$$dollar ',
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.black,
                                fontSize: 15)),
                        Text('\n \n  Burger meal with cheese',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.grey,
                                fontSize: 10)),
                        Text(' '),
                        Text(' '),
                      ],
                    ),
                  ]))),
          Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2.0,
                          blurRadius: 5.0)
                    ],
                  ),
                  child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        "images/b2.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Text(' '),
                        Text(' Double Sandwich   \$$dollar1 ',
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.black,
                                fontSize: 15)),
                        Text('\n \n  Double Burger',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.grey,
                                fontSize: 10)),
                        Text(' '),
                        Text(' '),
                      ],
                    ),
                  ]))),
          Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2.0,
                          blurRadius: 5.0)
                    ],
                  ),
                  child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        "images/b3.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Text(' '),
                        Text(' Chicken Burger   \$$dollar2 ',
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.black,
                                fontSize: 15)),
                        Text('\n \n  Chicken Breast Burger',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.grey,
                                fontSize: 10)),
                        Text(' '),
                        Text(' '),
                      ],
                    ),
                  ])))
        ]))));
  }
}
