import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final int userid;
  final dynamic totalprice;
  final dynamic status;

  const Order({
    required this.id,
    required this.userid,
    required this.totalprice,
    required this.status,
  });

  @override
  List<Object?> get props => [
        id,
        userid,
        totalprice,
        status,
      ];
}
