import 'package:flutter/material.dart';

import 'package:mycafe/ui/utils/helper.dart';

import '../login/LoginScreen.dart';
import '../signUp/SignUpScreen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[900],
        title: Text('HuQQa BuzZ'),
        centerTitle: true,
        // actions: <Widget>[
        //   // action button
        //   IconButton(
        //       icon: Icon(Icons.arrow_back),
        //       alignment: Alignment.topLeft,
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => MyHomePage(),
        //           ),
        //         );
        //       })
        // ],
      ),
      body:
          // SingleChildScrollView(
          // child:
          Container(
        // constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_960_720.jpg"),
                fit: BoxFit.cover)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0, bottom: 20.0),
                child: Icon(Icons.person, size: 100, color: Colors.white),
              ),
            ),
            // Text(
            //   'HuQQa BuZz!',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 25.0,
            //       fontFamily: 'Raleway',
            //       fontWeight: FontWeight.bold),
            // ),
            Text(
              'Welcome,',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Raleway',
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Become a Member Now!',
                style: TextStyle(
                    fontSize: 19, color: Colors.white, fontFamily: 'Raleway'),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: RaisedButton(
                  color: Colors.deepOrange[900],
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.deepOrange[900],
                  onPressed: () {
                    push(context, new LoginScreen());
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.deepOrange[900])),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0, top: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: double.infinity),
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                  onPressed: () {
                    push(context, new SignUpScreen());
                  },
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
