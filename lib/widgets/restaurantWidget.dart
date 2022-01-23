
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:systems_engineering/models/restaurant.dart';

import 'custom_text.dart';

class RestaurantWidget extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantWidget({Key key, this.restaurant}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
    child: Container(
      height: 160,
      width: 250,
      decoration: BoxDecoration(
        image: new DecorationImage(
          image: NetworkImage(restaurant.image),
          ),
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
          colors: [
          Colors.blueGrey,
          Colors.white,
    //Colors.blueGrey,
    ]
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.grey,
    spreadRadius: 3,
    blurRadius: 7,
    offset: Offset(0,3)


    )
    ]

    ),
    child: Column(
    children: [
    SizedBox(height: 120,),
    Container(
    width: MediaQuery.of(context).size.width,
    height: 40,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20) , bottomLeft: Radius.circular(20)),

    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    CustomText(text: "${restaurant.name}", weight: FontWeight.bold,),
    CustomText(text: "${restaurant.rating}/5", weight: FontWeight.bold,)


    ],
    ),
    ),),],),),);
  }
}
