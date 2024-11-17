import 'package:customeal/models/food_item.dart';
import 'package:equatable/equatable.dart';

class Meals extends Equatable {
  final int id;
  final String name;
  final String description;
  final dynamic price;
  final dynamic stock;
  final dynamic photo;
  final List<FoodItem> fooditems;
  const Meals({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.photo,
    required this.fooditems,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        stock,
        photo,
        fooditems,
      ];
}
