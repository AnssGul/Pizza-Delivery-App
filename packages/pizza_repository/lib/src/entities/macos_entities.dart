import 'package:flutter/material.dart';
class MacrosEntity{
  int calories;
  int proteins;
  int fat;
  int carbs;

  MacrosEntity({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.proteins
  });
  Map<String, Object?> toDocuments(){
    return{
      'calories':calories,
      'protein':proteins,
      'fat':fat,
      'carbs':carbs
    };
  }
  static MacrosEntity fromDocument(Map<String, dynamic> doc)
  {
    return MacrosEntity(
      calories:doc['calories'],
      proteins: doc['proteins'],
      fat:doc['fat'],
      carbs:doc['carbs'],

    );



  }}
