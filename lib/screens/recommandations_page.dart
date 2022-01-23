import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:systems_engineering/models/product.dart';
import 'package:systems_engineering/screens/cart.dart';
import 'package:systems_engineering/widgets/custom_text.dart';
import 'package:systems_engineering/widgets/globals.dart';
import 'package:systems_engineering/widgets/globals.dart' as globals;
import 'package:systems_engineering/widgets/screen_navigation.dart';

class RecomPage extends StatefulWidget {

  final List<Product> productsList;

  const RecomPage({Key key, this.productsList}) : super(key: key);

  @override
  _RecomPageState createState() => _RecomPageState();
}

class _RecomPageState extends State<RecomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: CustomText(text: "Recommended Products", color: Colors.white, size: 25, weight: FontWeight.bold,),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CustomText(text: "${widget.productsList.length}" , color: Colors.white, size: 15, weight: FontWeight.bold,)),
          ),

        ],
      ),
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            onPressed: (){
              changeScreen(context, Cart());
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.shopping_cart),
          ),

          Positioned(
            top: 0.0,
            right: 0.0,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(2,1)
                  )
                ]
              ),
              child: Center(child: CustomText(text: "${globals.cart.length}", color: Colors.redAccent, weight: FontWeight.bold,)),
            ),
          )

        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(8,8,8,10),
              child: Column(
                  children: widget.productsList.map((item) => GestureDetector(
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

                                ),

                                IconButton(icon: Icon(
                                  Icons.add_circle_outline
                                ), onPressed: (){
                                  final snackBar = SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("${item.name} added to cart"),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    globals.cart.add(item);
                                  });

                                })

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
