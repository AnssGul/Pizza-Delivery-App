import 'package:pizza_repository/src/entities/macos_entities.dart';

import '../models/macros.dart';

class PizzaEntity{
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macros macros;
//
//   String pizzaId;
//   String picture;
//   bool isVeg;
//   int spicy;
//   String name;
//   String description;
//   int price;
//   int discount;
//   Macros macros;

  PizzaEntity({
    required this.pizzaId,
     required this.picture,
    required this.isVeg,
    required this.spicy,
    required  this.name,
    required  this.description,
    required this.price,
    required this.discount, // Set default discount to 0
    required  this.macros
  });
  Map<String, Object?> toDocuments(){
    return{
      'pizzaId':pizzaId,
      'picture':picture,
      'isVeg':isVeg,
      'spicy':spicy,
      'name':name,
      'description':description,
      'price':price,
      'discount':discount,
      'macros':macros.toEntity().toDocuments(),

    };
  }
  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
      pizzaId: doc['pizzaId'],
      picture: doc['picture'],
      isVeg: doc['isVeg'],
      spicy: doc['spicy'],
      name: doc['name'],
      description: doc['description'],
      price: doc['price'],
      discount: doc['discount'],
      macros:
      Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );



  }



}