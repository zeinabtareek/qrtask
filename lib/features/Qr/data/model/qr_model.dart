



import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

class QRModel extends Equatable {
  final int orderId;
  final String merchantName;
  final int merchantId;
  final double amount;
  final String productId;

  QRModel({
    required this.orderId,
    required this.merchantName,
    required this.merchantId,
    required this.amount,
    required this.productId,
  });

  factory QRModel.fromJson(Map<String, dynamic> json) {
    return QRModel(
      orderId: json['orderId'] as int,
      merchantName: json['merchantName'] as String,
      merchantId: json['merchantId'] as int,
      amount: json['amount'] as double,
      productId: json['productId'] as String,
    );
  }

  @override
  List<Object?> get props => [orderId, merchantName, merchantId, amount, productId];

  @override
  bool? get stringify => true;
}

