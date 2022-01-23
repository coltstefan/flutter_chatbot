import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:systems_engineering/models/product.dart';
import 'package:systems_engineering/models/restaurant.dart';
import 'package:systems_engineering/widgets/custom_text.dart';
import 'package:systems_engineering/widgets/globals.dart';
import 'package:systems_engineering/widgets/screen_navigation.dart';
import 'package:systems_engineering/widgets/text_manipulation.dart';
import 'package:systems_engineering/widgets/globals.dart' as globals;

class ProductsPage extends StatefulWidget {

  final Restaurant restaurant;

  const ProductsPage({Key key, this.restaurant}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<ProductsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: CustomText(text: "Products", color: Colors.white, size: 25, weight: FontWeight.bold,),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CustomText(text: "${widget.restaurant.name}" , color: Colors.white, size: 15, weight: FontWeight.bold,)),
          ),

        ],
      ),
      body: SafeArea(
        child: ListView(
            children: [

            Padding(
            padding: const EdgeInsets.fromLTRB(8,8,8,10),
            child: Column(
                children: TextManipulation().getProductsByRestaurant(widget.restaurant).map((item) => GestureDetector(
                    onTap : () {
                      //changeScreen(context, ProductsPage(restaurant: item,));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey,
                          //     blurRadius: 3,
                          //     offset: Offset(2,1)
                          //   )
                          // ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(text: "${item.name}", size: 25, weight: FontWeight.bold,),
                              Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 3,
                                      offset: Offset(2,1)
                                    )
                                  ]
                                ),
                                child: Center(child: CustomText(text: "${item.price} RON", size: 20, weight: FontWeight.bold,)),

                              )

                            ],
                          ),
                        ),

                      ),
                    ))).toList()
            ),
          )
          ],
    ),
      ),

    );
  }
}
