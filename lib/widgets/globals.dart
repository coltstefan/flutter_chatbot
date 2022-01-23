
import 'dart:math';

import 'package:systems_engineering/models/product.dart';
import 'package:systems_engineering/models/restaurant.dart';

Restaurant pizza_hut = Restaurant("Pizza Hut", 4.9,
    "https://i.ytimg.com/vi/CPs4owoNWlE/maxresdefault.jpg");

Restaurant salad_box = Restaurant("Salad Box", 4.2,
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXzFlQDshiGAp2ZgDloKUX3hyyzkVlnGSHMg&usqp=CAU");

Restaurant mcdonalds = Restaurant("McDonalds", 4.3,
    "https://www.corbeancaonline.ro/wp-content/uploads/2018/04/mcdonalds-750x450.jpg");

List<Restaurant> restaurantList = [
  pizza_hut,
  salad_box,
  mcdonalds
];

List<String> keywords = [
  "HEALTHY",//0
  "HEALTY", //1
  "SALAD", //2
  "VEGETABLES", //3
  "CHICKEN", //4
  "BEEF", //5
  "PIZZA", // 6
  "BURGER", //7
  "WINGS", //8
  "CHEESE", //9
  "STRIPS", //10
  "SANDWICH", //11
  "FAST FOOD", //12
  "WRAP", //13
  "PASTA", //14
  "VEGAN", //15
];

Product pizza_carnivora = Product("Pizza Carnivora", 23, pizza_hut , [keywords[6],keywords[12]]);
Product pizza_pepperoni =  Product("Pizza Pepperoni" , 30 , pizza_hut , [keywords[6],keywords[12],]);
Product vegan_pizza = Product("Vegan Pizza", 20, pizza_hut, [keywords[6],keywords[12],keywords[15],]);
Product  carbonara = Product("Pasta Carbonara", 20, pizza_hut, [keywords[4],keywords[14],keywords[9],]);
Product  ceasar=Product("Ceasar Salad", 25, salad_box, [keywords[0],keywords[1],keywords[2],keywords[3],keywords[4],]);
Product  vegan_salad=Product("Vegan Salad", 20, salad_box, [keywords[0],keywords[1],keywords[2],keywords[3],keywords[15],]);
Product  chicken_wrap=Product("Chicken Wrap", 17, salad_box, [keywords[0],keywords[1],keywords[3],keywords[13],keywords[4],]);
Product  big_mac=Product("Big Mac", 15, mcdonalds, [keywords[5],keywords[7],keywords[11],keywords[12]]);
Product  chicken_nuggets=Product("Chicken Nuggets", 20, mcdonalds, [keywords[4],keywords[8],keywords[10],keywords[12],]);
Product  mc_chicken=Product("McChicken" , 7 , mcdonalds , [keywords[4],keywords[7],keywords[11],keywords[12],]);

List<Product> productsList = [
  pizza_carnivora,
  pizza_pepperoni,
  vegan_pizza,
  carbonara,
  ceasar,
  vegan_salad,
  chicken_wrap,
  big_mac,
  chicken_nuggets,
  mc_chicken
];

List<Map> messages = [];

List<Product> cart = [];


