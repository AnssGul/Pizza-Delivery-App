import '../entities/macos_entities.dart';

class Macros{
  int calories;
  int proteins;
  int fat;
  int carbs;
  Macros({
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.proteins
});

  MacrosEntity toEntity(){
    return MacrosEntity(
     calories:calories,
      proteins:proteins,
      fat:fat,
      carbs:carbs
    );
  }

  static Macros fromEntity(MacrosEntity entity){
    return Macros(
        // pizzaId:entity.pizzaId,
      calories: entity.calories,
      proteins: entity.proteins,
       fat: entity.fat,
      carbs: entity.carbs
    );

  }}
