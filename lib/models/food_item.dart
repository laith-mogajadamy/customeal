import 'package:equatable/equatable.dart';

class FoodItem extends Equatable {
  final int id;
  final String name;
  final String description;
  final dynamic price;
  final dynamic category;
  final dynamic stock;
  final dynamic exdate;
  final dynamic photo;

  const FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.stock,
    required this.exdate,
    required this.photo,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        category,
        stock,
        exdate,
        photo,
      ];
}
