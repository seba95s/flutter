// import 'package:flutter/foundation.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:firebase_messaging/firebase_messaging.dart' hide MessageHandler;

import 'Pasta.dart';
import 'Burger.dart';
import 'Pizza.dart';

import 'dart:async';
import 'ui/home/HomeScreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:flutter/services.dart';

import 'model/User.dart';

import 'ui/services/Authenticate.dart';
import 'ui/utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart' as Constants;
import 'ui/auth/AuthScreen.dart';
import 'ui/onBoarding/OnBoardingScreen.dart';

import 'package:flutter/cupertino.dart';

// import 'package:simple_slider/simple_slider.dart';
// import 'package:google_fonts/google_fonts.dart';
void main() => runApp(MaterialApp(home: MyHomePage()));

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HuQQa BuZz',
      home: MyHomePage(),
    );
  }
}

var bannerItems = ["Burger", "cheesechilly", "Noodles", "Pizza"];
var bannerImages = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg"
];

class MyHomePage extends StatelessWidget {
  IconData _iconData = Icons.notifications;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[900],
        title: Text('HuQQa BuzZ', style: TextStyle(fontFamily: 'Raleway')),
        centerTitle: true,
        actions: <Widget>[
          //action button
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ),
                );
              })
        ],
      ),

      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Text(
      //           'HuQQa list',
      //           textAlign: TextAlign.center,
      //           style: TextStyle(fontSize: 18),
      //         ),
      //         decoration: BoxDecoration(
      //           color: Colors.orange[900],
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('feedback'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => ContactUs()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      //       ListTile(
      //         leading: Icon(Icons.restaurant_menu),
      //         title: Text('Menu'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Menu1(),
      //             ),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.contact_mail),
      //         title: Text('Contact Us'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.import_contacts),
      //         title: Text('About Us'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => AboutUs(),
      //             ),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Profile',
      //           style: TextStyle(color: Colors.black),
      //         ),
      //         leading: Transform.rotate(
      //             angle: pi / 1,
      //             child: Icon(Icons.exit_to_app, color: Colors.black)),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => HomeScreen(),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: NetworkImage(
                    
                      "https://cdn.pixabay.com/photo/2015/01/07/16/37/wood-591631_960_720.jpg"),
                  fit: BoxFit.cover)),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[],
                  ),
                ),
                BannerWidgetArea(),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white12,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            spreadRadius: 1.0)
                      ]),
                  child: Column(
                    children: <Widget>[
                      // Text(' '),
                      // Text(
                      //   '- COME VISIT US -',
                      //   style: TextStyle(
                      //     fontSize: 25,
                      //     fontFamily: 'Raleway',
                      //     color: Colors.white,
                      //   ),
                      // ),
                      Text('  '),
                      // Text('HuQQa BuzZ Restaurants Near You',
                      //     style: TextStyle(
                      //       fontSize: 20,
                      //       fontFamily: 'Raleway',
                      //       color: Colors.white,
                      //     )),
                      Text(
                        'We currently have 3 locations and we are expanding. Our dining rooms are spacious and beautifully decorated. Perfect for eating out with family or entertaining guests',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Raleway',
                          color: Colors.white,
                        ),
                      ),
                      Text(' '),
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image(
                            // color: Colors.grey[600],
                            colorBlendMode: BlendMode.modulate,
                            image: new AssetImage('images/pasta.jpg'),
                          ),
                          Row(children: <Widget>[
                            // Container(
                            //   margin: EdgeInsets.only(left: 50),
                            //   child: Text(
                            //     'Checkout our Yummiest food  ',
                            //     style: TextStyle(
                            //       fontSize: 17,
                            //       fontFamily: 'Raleway',
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                            //       Row(children: [
                            //         Container(
                            //           margin: EdgeInsets.only(left: 0),
                            //           child: new GestureDetector(
                            //             onTap: () {
                            //               Navigator.push(
                            //                   context,
                            //                   MaterialPageRoute(
                            //                       builder: (context) => Menu1()));
                            //             },
                            //             child: Text(
                            //               "Here!",
                            //               // textAlign: TextAlign.left,
                            //               style: TextStyle(
                            //                   decoration: TextDecoration.underline,
                            //                   color: Colors.white,
                            //                   fontSize: 17),
                            //             ),
                            //           ),
                            //         )
                            //       ])
                          ])
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(children: <Widget>[
                    Text(' '),
                    Text(
                      'How good we are',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        color: Colors.white,
                      ),
                    ),
                    Text(' '),
                  ]),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            )),
                        FlatButton(
                            onPressed: () {},
                            child:
                                Icon(Icons.credit_card, color: Colors.white)),
                        FlatButton(
                            onPressed: () {},
                            child: Icon(Icons.check_box, color: Colors.white)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('   Accessible',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              letterSpacing: 2.0,
                              color: Colors.white,
                            )),
                        Text(' '),
                        Text(
                          'Accept Card',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(' '),
                        Text(
                          'Quality Food',
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              letterSpacing: 2.0,
                              color: Colors.white),
                        ),
                        Text(' ')
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ])))),
    );
  }
}
/*slider*/

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  bannerImages[x],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[x],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
                      "More than 40% Off",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}

/*menu page*/
class Menu1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[900],
        title: Text('HuQQa BuzZ', style: TextStyle(fontFamily: 'Raleway')),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'what do you like to eat? ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 14,
                      fontWeight: FontWeight.bold), // used custom text
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey[300],
                    offset: Offset(1, 1),
                    blurRadius: 4)
              ]),
              child: ListTile(
                  leading: Icon(Icons.search),
                  focusColor: Colors.deepOrange[900],
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Find your best meal",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(Icons.filter_list),
                  hoverColor: Colors.deepOrange[900]),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          // Container(
          //     height: 120,
          //     child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: categoriesList.length,
          //         itemBuilder: (_, index) {
          //           return Padding(
          //               padding: EdgeInsets.all(8),
          //               child: Column(
          //                 children: <Widget>[
          //                   Container(
          //                       decoration: BoxDecoration(
          //                         color: Colors.white,
          //                         boxShadow: [
          //                           BoxShadow(
          //                               color: Colors.grey[300],
          //                               offset: Offset(4, 6),
          //                               blurRadius: 20)
          //                         ],
          //                       ),
          //                       child: Padding(
          //                         padding: EdgeInsets.all(4),
          //                         child: Image.asset(
          //                           "images/${categoriesList[index].image}",
          //                           width: 60,
          //                         ),
          //                       )),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   Text(
          //                     'Pasta',
          //                     style: TextStyle(fontSize: 16),
          //                   )
          //                 ],
          //               ));
          //         }))
          // Categories()
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        "images/p.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Pasta()));
                        },
                        child:
                            new Text("Pasta (white sauce, Alfredo, Red sauce)"),
                      ),
                    )
                  ],
                )),
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        "images/burger.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Burger()));
                        },
                        child: new Text("Burger (Cheese, Mushroms,Chicken)"),
                      ),
                    )
                  ],
                )),
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
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.asset(
                        "images/pizza1.jpg",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: new GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Pizza()));
                        },
                        child: new Text("Pizza (BBQ, Cheese,Chicken)"),
                      ),
                    )
                  ],
                )),
          )
        ]),
      ),
    );
  }
}

class Notification1 extends StatefulWidget {
  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<Notification1>
    with WidgetsBindingObserver {
  static User currentUser;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.deepOrange[900]));
    return MaterialApp(
        theme: ThemeData(accentColor: Colors.deepOrange[900]),
        debugShowCheckedModeBanner: false,
        color: Colors.deepOrange[900],
        home: OnBoarding());
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (FirebaseAuth.instance.currentUser() != null && currentUser != null) {
      if (state == AppLifecycleState.paused) {
        //user offline
        currentUser.active = false;
        currentUser.lastOnlineTimestamp = Timestamp.now();
        FireStoreUtils.currentUserDocRef.updateData(currentUser.toJson());
      } else if (state == AppLifecycleState.resumed) {
        //user online
        currentUser.active = true;
        FireStoreUtils.currentUserDocRef.updateData(currentUser.toJson());
      }
    }
  }
}

class OnBoarding extends StatefulWidget {
  @override
  State createState() {
    return OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> {
  Future hasFinishedOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool finishedOnBoarding =
        (prefs.getBool(Constants.FINISHED_ON_BOARDING) ?? false);

    if (finishedOnBoarding) {
      FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
      if (firebaseUser != null) {
        User user = await FireStoreUtils().getCurrentUser(firebaseUser.uid);
        if (user != null) {
          NotificationState.currentUser = user;
          pushReplacement(context, new HomeScreen(user: user));
        } else {
          pushReplacement(context, new AuthScreen());
        }
      } else {
        pushReplacement(context, new AuthScreen());
      }
    } else {
      pushReplacement(context, new OnBoardingScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    hasFinishedOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[900],
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

// class PushNotificationsManager {
//   PushNotificationsManager._();

//   factory PushNotificationsManager() => _instance;

//   static final PushNotificationsManager _instance =
//       PushNotificationsManager._();

//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   bool _initialized = false;

//   Future<void> init() async {
//     if (!_initialized) {
//       // For iOS request permission first.
//       _firebaseMessaging.requestNotificationPermissions();
//       _firebaseMessaging.configure();

//       // For testing purposes print the Firebase Messaging token
//       String token = await _firebaseMessaging.getToken();
//       print("FirebaseMessaging token: $token");

//       _initialized = true;
//     }
//   }
// }
