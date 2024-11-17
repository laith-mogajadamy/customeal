import 'package:customeal/models/order.dart';

class OrderModel extends Order {
  const OrderModel({
    required super.id,
    required super.userid,
    required super.totalprice,
    required super.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] ?? 0,
        userid: json['userid'] ?? 0,
        totalprice: json['totalprice'] ?? 0,
        status: json['status'] ?? '',
        // languages: List<LanguageModel>.from(
        //   ((json['languages'] ?? []) as List).map(
        //     (e) => LanguageModel.fromJson(e),
        //   ),
        // ),
      );
}
