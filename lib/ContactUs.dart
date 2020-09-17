import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class FireStore extends StatelessWidget {
  // FireStore({this.auth, this.onSignedOut});
  // final FirebaseAuth auth;
  // final VoidCallback onSignedOut;

  // void _signOut() async {
  //   try {
  //     await auth.signOut();
  //     onSignedOut();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: Colors.deepOrange[900],
            title: new Text('Contact Us'),
            actions: <Widget>[
              // new FlatButton(
              //     child: new Text('Logout',
              //         style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              //     onPressed: _signOut)
            ]),
        body: new StreamBuilder(
          stream: Firestore.instance.collection('contact messages').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return new GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(4.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['title']),
                  subtitle: new Text(document['author']),
                  trailing: new Text(document['Email']),
                  leading: new Text(document['Message']),
                );
              }).toList(),
            );
          },
        ),
        floatingActionButton: new FloatingActionButton(
            elevation: 0.0,
            child: new Icon(Icons.add),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => UploadFormField(),
                  ));
            }));
  }
}

// UPLOAD TO FIRESTORE

class UploadFormField extends StatefulWidget {
  @override
  _UploadFormFieldState createState() => _UploadFormFieldState();
}

class _UploadFormFieldState extends State<UploadFormField> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  String title, author;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.deepOrange[900],
          title: new Text('Contact Form'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    Text('Email us your Feedback');
    return new Column(
      children: <Widget>[
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Title'),
            validator: validateTitle,
            onSaved: (String val) {
              title = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Name'),
            validator: validateAuthor,
            onSaved: (String val) {
              author = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Email'),
            validator: validateAuthor,
            onSaved: (String val) {
              author = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(
                hintText: 'Phone No.', border: OutlineInputBorder()),
            validator: validateAuthor,
            onSaved: (String val) {
              author = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Message'),
            validator: validateAuthor,
            onSaved: (String val) {
              author = val;
            }),
        new SizedBox(height: 15.0),
        new RaisedButton(
          onPressed: _sendToServer,
        ),
      ],
    );
  }

  String validateTitle(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Title is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Title must be a-z and A-Z";
    }
    return null;
  }

  String validateAuthor(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "name must be a-z and A-Z";
    }
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      //No error in validator
      Text('submitted');
      _key.currentState.save();
      Firestore.instance.runTransaction((Transaction transaction) async {
        CollectionReference reference =
            Firestore.instance.collection('ContactUs');

        await reference.add({"Title": "$title", "name": "$author"});
      });
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }
}
