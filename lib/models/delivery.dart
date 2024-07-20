import 'delivery_status.dart';

class Delivery {
  final int id;
  final int statusId;
  final String createDate;
  final int? customerId;
  final String customerAddress;
  final String transactionNumber;

  const Delivery(
      {required this.id,
      required this.statusId,
      required this.createDate,
      this.customerId,
      required this.customerAddress,
      required this.transactionNumber});

  factory Delivery.fromMap(Map<String, dynamic> json) {
    return Delivery(
        id: json['id']is int
            ? json['id']
            : int.parse(json['id']),
        statusId: json['statusId'] is int
            ? json['statusId']
            : int.parse(json['statusId']),
        createDate: json['createDate'] ?? '',
        customerId: json['customerId'] is int
            ? json['customerId']
            : int.tryParse(json['customerId'] ?? '') ?? 0,
        customerAddress: json['customerAddress'] ?? '',
        transactionNumber: json['transactionNumber'] ?? '');
  }

  String getStatusName(List<DeliveryStatus> statusList) {
    final status = statusList.firstWhere(
      (element) => element.value == statusId.toString(),
      orElse: () => const DeliveryStatus(value: 'unknown', name: 'Unknown'),
    );
    return status.name;
  }
}
