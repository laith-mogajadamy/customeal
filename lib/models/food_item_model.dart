import 'package:customeal/models/food_item.dart';

class FoodItemModel extends FoodItem {
  const FoodItemModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.category,
    required super.stock,
    required super.exdate,
    required super.photo,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> json) => FoodItemModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        price: json['price'] ?? 0,
        category: json['category'] ?? '',
        stock: json['stock'] ?? 0,
        exdate: json['exdate'] ?? '',
        photo: json['photo'] ?? '',

        // languages: List<LanguageModel>.from(
        //   ((json['languages'] ?? []) as List).map(
        //     (e) => LanguageModel.fromJson(e),
        //   ),
        // ),
      );
}
