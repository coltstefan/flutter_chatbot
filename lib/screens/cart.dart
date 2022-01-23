import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:systems_engineering/widgets/custom_text.dart';
import 'package:systems_engineering/widgets/globals.dart' as globals;

class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  int total = 0;

  @override
  void initState(){
    super.initState();

    for(var i = 0; i< globals.cart.length ; i++){
      total = total + globals.cart[i].price;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: CustomText(text: "Cart", size: 25, color: Colors.white, weight: FontWeight.bold,),
      ),

      body: Center(
        child: globals.cart.length != 0 ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Container(
                height: 150,
                child:  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: globals.cart.length,
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 210,
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
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,8,8,0),
                                child: CustomText(text: "${globals.cart[index].name}", weight: FontWeight.bold,),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,8,8),
                                child: CustomText(text: "${globals.cart[index].restaurant.name}", size: 14, color: Colors.redAccent,),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(8,0,8,8),
                                child: CustomText(text: "${globals.cart[index].price} Ron", weight: FontWeight.bold,),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 12,
                          ),
                          GestureDetector(
                            onTap: (){
                              final snackBar = SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("${globals.cart[index].name} removed from cart"),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              setState(() {
                                total = total - globals.cart[index].price;
                                globals.cart.remove(globals.cart[index]);
                              });
                            },
                            child: Container(
                              width: 150,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),

                              ),
                              child: Center(child: CustomText(text: "Remove from Cart", color: Colors.white, size: 15, weight: FontWeight.bold,)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }) ,

              )
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: CustomText(text: "Total to pay: ${total} RON", color: Colors.white, size: 18, weight: FontWeight.bold,)),
            )

          ],
        ) : Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomText(text: "No items in Cart" , size: 25, weight: FontWeight.bold,),
        ),
      ) ,

    );
  }
}
