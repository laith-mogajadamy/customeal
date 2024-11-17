import 'package:customeal/models/food_item.dart';
import 'package:customeal/models/food_item_model.dart';
import 'package:customeal/models/meals.dart';

class MealsModel extends Meals {
  const MealsModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.stock,
    required super.photo,
    required super.fooditems,
  });

  factory MealsModel.fromJson(Map<String, dynamic> json) => MealsModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        price: json['price'] ?? 0,
        stock: json['stock'] ?? 0,
        photo: json['photo'] ?? '',
        fooditems: List<FoodItem>.from(
          ((json['food_items'] ?? []) as List).map(
            (e) => FoodItemModel.fromJson(e),
          ),
        ),
      );
}
