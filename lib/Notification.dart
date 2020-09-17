import 'package:flutter/material.dart';
import 'HomeApp.dart';
// class Notification extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       builder: (BuildContext context, int newNotificationCounterValue,
//           Widget child) {
//         //returns an empty container if the value is 0 and returns the Stack otherwise
//         return newNotificationCounterValue == 0
//             ? Container(
//                 child: Icon(
//                   Icons.notifications,
//                   color: Colors.white,
//                   size: 40,
//                 ),
//               )
//             : Stack(
//                 children: [
//                   Icon(
//                     Icons.notifications,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ],
//               );
//       },
//       valueListenable: notificationCounterValueNotifer,
//     );
//   }
// }

class Notifyy extends StatelessWidget {
  List list;
  Notifyy({Key key, @required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange[900],
            title: Text('HuQQa BuzZ'),
            actions: <Widget>[
              IconButton(
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
            ]),
        body: ListView.builder(
            itemCount: null == list ? 0 : list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    list[index].message,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }));
  }
}
// class History extends StatelessWidget {
//   @override
//   Widget build(BuildContext context)
//   // async{

//     //     final http.Response response = await http
//     //       .get('https://onesignal.com/api/v1/notifications?app_id=appID',
//     //     headers: {
//     //     "Authorization": "Basic api",
//     //     "include_player_ids": playerId,
//     //   },
//     //       );

//     // );
//   }
// }
