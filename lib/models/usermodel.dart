import 'package:customeal/models/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.city,
    required super.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        city: json['city'] ?? '',
        // languages: List<LanguageModel>.from(
        //   ((json['languages'] ?? []) as List).map(
        //     (e) => LanguageModel.fromJson(e),
        //   ),
        // ),
        // location: json["lawyer"]?['location'] ?? '',
        location: json['location'] ?? '',
      );
}
