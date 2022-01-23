




import 'package:path/path.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:systems_engineering/models/product.dart';
import 'package:systems_engineering/screens/recommandations_page.dart';
import 'package:systems_engineering/widgets/custom_text.dart';
import 'package:systems_engineering/widgets/screen_navigation.dart';
import 'package:systems_engineering/widgets/text_manipulation.dart';
import 'package:systems_engineering/widgets/globals.dart' as globals;

class Chatbot extends StatefulWidget {

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {

  List<Product> produse = [];


  @override
  void initState(){
    super.initState();
    globals.messages.insert(0, {
      "data":0,
      "message": "Hello, I am Ionut Lenghel from Imi Place Sa Mananc, and I am an expert in Food Catering, what would you like to eat?"
    });
  }
  @override
  Widget build(BuildContext context) {

    final messageInsert = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: "Chatbot", color: Colors.black, size: 20, weight: FontWeight.bold,),
        actions: [],

      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        child: CustomText(text: "Today, ${DateTime.now().day} -  ${DateTime.now().month}",),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      changeScreen(context, RecomPage(productsList: produse,));
                    },
                    child: Flexible(

                      child: Container(
                        constraints: BoxConstraints( maxWidth: 300),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12,6,12,0),
                          child: CustomText(text: produse.length == 0 ? "No products" : "Recommended Products", color: Colors.white,weight: FontWeight.bold, size: 14,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 2,
            // ),


            Flexible(
                child: ListView.builder(
                  reverse: true,
                  itemCount: globals.messages.length,
                  itemBuilder: ( _ , index) {
                    print(produse.length);
                    return chat(globals.messages[index]["message"], globals.messages[index]["data"] , produse , context);
                  },
                )
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 5,
              color: Colors.greenAccent,
            ),

            Container(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.deepPurple, size: 35,),
                ),
                title: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: InputDecoration(
                      hintText: "Enter a Message...",
                      hintStyle: TextStyle(
                        color: Colors.black26
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                    ),
                    onChanged: (value){

                    },
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.send,
                    size: 30,
                    color: Colors.deepPurple,
                  ),
                  onPressed: (){
                    if (messageInsert.text.isEmpty) {
                      print("empty message");
                    } else {
                      setState(() {
                        globals.messages.insert(0,
                            {"data": 1, "message": messageInsert.text});
                      });
                      //response(messageInsert.text);
                      List<String> currKeywords = TextManipulation().getKeywords(messageInsert.text);
                      print(currKeywords);
                      List<Product> produseRecomandate = TextManipulation().getProductsByKeywords(currKeywords);
                      String productString = "";
                      if (produseRecomandate.length != 0) {
                         productString = "Good, we found some products for you, here they are: ";
                         for (var i = 0; i<produseRecomandate.length ; i++){
                           productString = productString + "${produseRecomandate[i].name}, " ;
                         }
                      }
                      else{
                         productString = "Unfortunately, we cannot find anything to match your criteria";
                      }

                      setState(() {
                        produse = produseRecomandate;
                        globals.messages.insert(0,
                        {"data": 0, "message": productString});
                      });
                      //print(messages.length);
                    }
                  },
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}


Widget chat(String message , int data , List<Product> listaProduse, BuildContext context) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),

    child: Row(
      mainAxisAlignment: data==1 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [

        GestureDetector(
          onTap: (){
            if(listaProduse.isNotEmpty){
              print(listaProduse.length);
              changeScreen(context, RecomPage(productsList: listaProduse,));
            }

          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(15.0),
                color: data == 0 ? Color.fromRGBO(23, 157, 139, 1) : Colors.deepPurple,
                elevation: 0.0,

                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      SizedBox(
                        width: 5.0,
                      ),
                      Flexible(
                          child: Container(
                            constraints: BoxConstraints( maxWidth: 200),
                            child: Text(
                              message,
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                )),
          ),
        ),





      ],

    ),

  );
}
