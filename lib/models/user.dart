import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final dynamic phone;

  final dynamic city;
  final dynamic location;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.location,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        city,
        location,
      ];
}
