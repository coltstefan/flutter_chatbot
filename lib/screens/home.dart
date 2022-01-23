import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:systems_engineering/models/restaurant.dart';
import 'package:systems_engineering/screens/chatbot.dart';
import 'package:systems_engineering/screens/prodcts_page.dart';
import 'package:systems_engineering/widgets/custom_text.dart';
import 'package:systems_engineering/widgets/restaurantWidget.dart';
import 'package:systems_engineering/widgets/screen_navigation.dart';
import 'package:systems_engineering/widgets/text_manipulation.dart';
import 'package:systems_engineering/widgets/globals.dart' as globals;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Restaurant> restaurantList = [
    Restaurant("Pizza Hut", 4.9,
        "https://i.ytimg.com/vi/CPs4owoNWlE/maxresdefault.jpg"),
    Restaurant("Salad Box", 4.2,
        "https://portal.saladbox.ro//Uploads/Images/Location/0db90bc5-7674-4ffb-95b6-79072b0293cd.jpg"),
    Restaurant("McDonalds", 4.3,
        "https://www.corbeancaonline.ro/wp-content/uploads/2018/04/mcdonalds-750x450.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: "No Hai Nu Stiu Ce Sa Mananc", weight: FontWeight.bold, size: 23,),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/21319730?v=4"),
            ),
          )
        ],
        elevation: 0,

      ),
      floatingActionButton: Container(
        width: 80,
        height: 80,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: (){
              changeScreen(context, Chatbot());
            },
            tooltip: 'Chatbot',
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://yt3.ggpht.com/ytc/AKedOLRaFTrIMQ9V8uP0A5AFuvXNjVPabAWznU5zDaFF=s900-c-k-c0x00ffffff-no-rj"),
            ),
            backgroundColor: Colors.white,

          ),
        ),
      ),

      body:SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,10),
              child: Column(
                  children: globals.restaurantList.map((item) => GestureDetector(
                      onTap : () {
                        print(TextManipulation().getProductsByRestaurant(item).length);
                        changeScreen(context, ProductsPage(restaurant: item,));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RestaurantWidget(restaurant: item,),
                      ))).toList()
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),


      )
          );


  }
}
