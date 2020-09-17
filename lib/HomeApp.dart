// import 'package:flutter/foundation.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mycafe/main.dart';
import 'Custom_Text.dart';
import 'Notification.dart';
import 'Pasta.dart';
import 'Burger.dart';
import 'Pizza.dart';
import 'AboutUs.dart';
import 'dart:async';
import 'ui/home/HomeScreen.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ContactUs.dart';
import 'package:flutter/services.dart';
import 'package:mycafe/model/User.dart';
import 'package:mycafe/ui/home/HomeScreen.dart';
import 'package:mycafe/ui/services/Authenticate.dart';
import 'package:mycafe/ui/utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io';



import 'package:firebase_messaging/firebase_messaging.dart';


import 'constants.dart' as Constants;
import 'ui/auth/AuthScreen.dart';
import 'ui/onBoarding/OnBoardingScreen.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';

import 'package:flutter/cupertino.dart';

import 'package:mycafe/ui/auth/AuthScreen.dart';

var bannerItems = ["Burger", "cheesechilly", "Noodles", "Pizza"];
var bannerImages = [
  "images/burger.jpg",
  "images/cheesechilly.jpg",
  "images/noodles.jpg",
  "images/pizza.jpg"
];

ValueNotifier<int> notificationCounterValueNotifer = ValueNotifier(0);

class Notify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterBase',
      home: Scaffold(
        body: MessageHandler(),
      ),
    );
  }
}

class MessageHandler extends StatefulWidget {
  @override
  _MessageHandlerState createState() => _MessageHandlerState();
}

class _MessageHandlerState extends State<MessageHandler> with ChangeNotifier {
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
// List<Message> messagesList;
  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        print(data);
        _saveDeviceToken();
      });

      _fcm.requestNotificationPermissions(IosNotificationSettings());
    } else {
      _saveDeviceToken();
    }

// void _incrementCounter() {

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

        // _setMessage(message);
        // RaisedButton(
        //   child: Text(message['notification']['title']),
        //   onPressed: () {
        //     Flushbar(
        //       flushbarPosition: FlushbarPosition.TOP,
        //       icon: Icon(
        //         Icons.notifications_active,
        //         color: Colors.white,
        //       ),
        //       mainButton: FlatButton(
        //         onPressed: () {
        //           Navigator.pop(context);
        //           //  Flush.showGoodFlushbar(context, 'login successful!');
        //         },
        //         // child: Text(
        //         //   "ADD",
        //         //   style: TextStyle(color: Colors.amber),
        //         // ),
        //       ),
        //       // duration: Duration(seconds: 7))
        //     ).show(context);
        //   },
        // );
        // FlutterAppBadger.isAppBadgeSupported();
        FlutterAppBadger.updateBadgeCount(1);
        notificationCounterValueNotifer.value++;
        notificationCounterValueNotifer
            .notifyListeners(); // notify listeners here so ValueListenableBuilder will build the widget.
        final snackbar = SnackBar(
          content: Text(message['notification']['title']),
          action: SnackBarAction(
            label: 'Go',
            onPressed: () => null,
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     content: ListTile(
        //       title: Text(message['notification']['title']),
        //       subtitle: Text(message['notification']['body']),
        //     ),
        //     actions: <Widget>[
        //       FlatButton(
        //         color: Colors.amber,
        //         child: Text('Ok'),
        //         onPressed: () => Navigator.of(context).pop(),
        //       ),
        //     ],
        //   ),
        // );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // final snackbar = SnackBar(
        //   content: Text(message['notification']['title']),
        //   action: SnackBarAction(
        //     label: 'Go',
        //     onPressed: () => null,
        //   ),
        // );

        // Scaffold.of(context).showSnackBar(snackbar);

        // // FlutterAppBadger.updateBadgeCount(1);
        // notificationCounterValueNotifer.value++;
        // notificationCounterValueNotifer.notifyListeners();
        
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");

        // FlutterAppBadger.updateBadgeCount(1);
        // notificationCounterValueNotifer.value++;
        // notificationCounterValueNotifer.notifyListeners();
       
      },
    );
  }

  // _setMessage(Map<String, dynamic> message) {
  //   final notification = message['notification'];
  //   final data = message['data'];
  //   final String title = notification['title'];
  //   final String body = notification['body'];
  //   String mMessage = data['message'];
  //   print("Title: $title, body: $body, message: $mMessage");
  //   setState(() {
  //     Message msg = Message(title, body, mMessage);
  //     messagesList.add(msg);
  //   });
  // }

  @override
  void dispose() {
    if (iosSubscription != null) iosSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _handleMessages(context);
    return MaterialApp(
        home: Scaffold(body: HomeApp()

            // ListView.builder(
            //     itemCount: null == messagesList ? 0 : messagesList.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Card(
            //         child: Padding(
            //           padding: EdgeInsets.all(10.0),
            //           child: Text(
            //             messagesList[index].message,
            //             style: TextStyle(
            //               fontSize: 16.0,
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //       );

            //     })));
            ));
  }

  /// Get the token, save it to the database for current user
  _saveDeviceToken() async {
    // Get the current user
    String uid = 'jeffd23';
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    // Save it to Firestore
    if (fcmToken != null) {
      var tokens = _db
          .collection('users')
          .document(uid)
          .collection('tokens')
          .document(fcmToken);

      await tokens.setData({
        'token': fcmToken,
        'createdAt': FieldValue.serverTimestamp(), // optional
        'platform': Platform.operatingSystem // optional
      });
    }
  }

  /// Subscribe the user to a topic
  _subscribeToTopic() async {
    // Subscribe the user to a topic
    _fcm.subscribeToTopic('puppies');
  }
}

class Message {
  String title;
  String body;
  String message;
  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}

List<Message> messagesList;
Widget myAppBarIcon() {
  return ValueListenableBuilder(
    builder:
        (BuildContext context, int newNotificationCounterValue, Widget child) {
      return newNotificationCounterValue == 0
          ? Container(
              child: IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.white,
                  // size: 40,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notifyy(),
                      ),
                    );
                  }),
            )
          : Stack(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.notifications),
                    color: Colors.white,
                    // size: 40,
                    onPressed: () {
                      notificationCounterValueNotifer.value--;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Notifyy(),
                          ));
                    }),
                Container(
                  width: 15,
                  height: 15,
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(top: 8, left: 10),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffc32c37),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        newNotificationCounterValue.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                ),
              ],
            );
    },
    valueListenable: notificationCounterValueNotifer,
  );
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[900],
        title: Text('HuQQa BuzZ'),
        actions: <Widget>[myAppBarIcon()],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'HuQQa list',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              decoration: BoxDecoration(
                color: Colors.orange[900],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeApp(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('Menu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Menu1(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FireStore()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              leading: Transform.rotate(
                  angle: pi / 1, child: Icon(Icons.exit_to_app)),
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                            user: null,
                          )),
                );
              },
            ),
          ],
        ),
      ),
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
                    ],
                  ),
                ),
                // Menu1(),

                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pasta()));
                              },
                              child: new Text(
                                  "Pasta (white sauce, Alfredo, Red sauce)"),
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                              child:
                                  new Text("Burger (Cheese, Mushroms,Chicken)"),
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white60,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pizza()));
                              },
                              child: new Text("Pizza (BBQ, Cheese,Chicken)"),
                            ),
                          )
                        ],
                      )),
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
        title: Text('HuQQa BuzZ'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: CustomText(
                  text: 'what do you like to eat? ',
                  size: 14, // used custom text
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

class MyApp1 extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp1> with WidgetsBindingObserver {
  static User currentUser;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(Constants.COLOR_PRIMARY_DARK)));
    return MaterialApp(
        theme: ThemeData(accentColor: Color(Constants.COLOR_PRIMARY)),
        debugShowCheckedModeBanner: false,
        color: Color(Constants.COLOR_PRIMARY),
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
          MyAppState.currentUser = user;
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
      backgroundColor: Color(Constants.COLOR_PRIMARY),
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
