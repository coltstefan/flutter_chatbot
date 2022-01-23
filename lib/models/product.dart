import 'package:systems_engineering/models/restaurant.dart';

class Product{

  String name;
  int price;
  Restaurant restaurant;
  List<String> keywords;

  Product(String name, int price, Restaurant restaurant , List<String> keywords){
    this.name = name;
    this.price = price;
    this.restaurant = restaurant;
    this.keywords = keywords;
  }

}