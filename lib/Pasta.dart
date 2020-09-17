import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

int dollars = 15;

class Pasta extends StatelessWidget {
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
                ' Pasta Menu',
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
                        "images/p2.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Text(' '),
                        Text(' Chicken Alfredo    \$$dollars ',
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.black,
                                fontSize: 15)),
                        Text('\n \n White sauce with mushroms',
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
                        "images/p1.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Text(' '),
                        Text(' Spaghetti    \$$dollars ',
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.black,
                                fontSize: 15)),
                        Text('\n \n Red sauce with meatballs',
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
                        "images/p3.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Text(' '),
                        Text(' Penne Pesto    \$$dollars ',
                            maxLines: 5,
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                color: Colors.black,
                                fontSize: 15)),
                        Text('\n \n White sauce with Pesto',
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
