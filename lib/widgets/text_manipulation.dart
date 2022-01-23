
import 'package:flutter/cupertino.dart';
import 'package:systems_engineering/models/product.dart';
import 'package:systems_engineering/models/restaurant.dart';
import 'package:systems_engineering/widgets/globals.dart' as globals;

class TextManipulation{
  List<String> getKeywords(String message){

    String message_upper = message.toUpperCase();
    List<String> words = [];

    int curr=0;
    int index = 0;
    for (var i=1; i< message_upper.length ; i++){

      if( message_upper[i] == " ") {
        String word = message_upper.substring(curr,i);
        if (globals.keywords.contains(word)){
          words.insert(index, word);
          index++;
        }
        curr = i+1;

      }

    }

    String word = message_upper.substring(curr);
    if (globals.keywords.contains(word)){
      words.insert(index, word);
      //index++;
    }

    print(message_upper);
    return words;

  }

  List<Product> getProductsByRestaurant(Restaurant r){

    List<Product> products = [];


    for (var i=0 ; i<10; i++){
      if (globals.productsList[i].restaurant.name == r.name){
        products.add(globals.productsList[i]);
      }
    }

    return products;


  }

  List<Product> getProductsByKeywords(List<String> currKeywords){

    List<Product> products = [];

    for( var i = 0; i< currKeywords.length ; i++){
      for ( var j = 0 ; j < globals.productsList.length ; j++) {
        if (globals.productsList[j].keywords.contains(currKeywords[i]) && !products.contains(globals.productsList[j]))
          products.add(globals.productsList[j]);
      }
    }

    return products;


  }

}