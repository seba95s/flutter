import 'package:flutter/material.dart';
// import 'package:image_slider/Custom_Text.dart';
// import 'category.dart';
// import 'Custom_Text.dart';

// List<Category> categoriesList = [
//   Category(name: "salad", image: "pasta.jpg"),
//   Category(name: "pasta", image: "p.jpg"),
// ];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // // var screenHeight = MediaQuery.of(context).size.height;
    // return Container(
    //     height: 120,
    //     alignment: Alignment.topRight,
    //     // decoration: BoxDecoration(

    //     //   border: Border.all(color: Colors.grey[600], width: 50),
    //     //   boxShadow: [
    //     //     BoxShadow(
    //     //         color: Colors.grey[300], offset: Offset(4, 6), blurRadius: 40)
    //     //   ],
    //     // ),
    //     child: ListView.builder(
    //         scrollDirection: Axis.vertical,
    //         itemCount: 4,
    //         itemBuilder: (_, index) {
    //           return Padding(
    //               padding: EdgeInsets.all(10),
    //               child: Row(
    //                 children: <Widget>[
    //                   Container(
    //                     height: 40,
    //                     decoration: BoxDecoration(
    //                       // color: Colors.white,
    //                       boxShadow: [
    //                         BoxShadow(
    //                             color: Colors.grey[300],
    //                             offset: Offset(4, 6),
    //                             blurRadius: 20)
    //                       ],
    //                     ),
    //                     child: Image.asset(
    //                       // "images/${categoriesList[index].image}",
    //                       "images/pasta.jpg",
    //                       width: 120,
    //                     ),

    //                   ),
    //                   SizedBox(
    //                     height: 20,
    //                   ),
    //                   CustomText(text: 'pasta'),

    //                 ],

    //               )

    //               );
    //         }));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black])),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0,
                  top: 0,
                  child: Image(
                    image: new AssetImage("images/pasta.jpg"),
                  ),
                ),
                Text('Pasta')
              ],
            )
          ],
        ),
      ),
    );
  }
}
