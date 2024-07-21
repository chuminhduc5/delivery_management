import 'package:intl/intl.dart';
import 'delivery_status.dart';

class Delivery {
  final int id;
  final int statusId;
  final DateTime lastUpdateDate;
  final DateTime createDate;
  final int? customerId;
  final String customerAddress;
  final String transactionNumber;

  const Delivery({
    required this.id,
    required this.statusId,
    required this.lastUpdateDate,
    required this.createDate,
    this.customerId,
    required this.customerAddress,
    required this.transactionNumber,
  });

  factory Delivery.fromMap(Map<String, dynamic> json) {
    DateTime parseDateTime(String dateTimeString) {
      final utcDateTime = DateTime.parse(dateTimeString).toUtc();
      return utcDateTime.add(Duration(hours: 7)); // Chuyển đổi sang giờ Việt Nam (UTC+7)
    }

    return Delivery(
      id: json['id'] is int ? json['id'] : int.parse(json['id']),
      statusId: json['statusId'] is int
          ? json['statusId']
          : int.parse(json['statusId']),
      lastUpdateDate: json['lastUpdateDate'] != null
          ? parseDateTime(json['lastUpdateDate'])
          : DateTime.now(),
      createDate: json['createDate'] != null
          ? parseDateTime(json['createDate'])
          : DateTime.now(),
      customerId: json['customerId'] is int
          ? json['customerId']
          : int.tryParse(json['customerId'] ?? '') ?? 0,
      customerAddress: json['customerAddress'] ?? 'Chưa có địa chỉ giao hàng',
      transactionNumber: json['transactionNumber'] ?? '',
    );
  }

  String getStatusName(List<DeliveryStatus> statusList) {
    final status = statusList.firstWhere(
          (element) => element.value == statusId.toString(),
      orElse: () => const DeliveryStatus(value: 'unknown', name: 'Unknown'),
    );
    return status.name;
  }

  // Phương thức để định dạng ngày giờ Việt Nam theo kiểu bạn muốn
  String formatLastUpdateDate() {
    return DateFormat('dd/MM/yyyy ss:mm:HH').format(lastUpdateDate);
  }

  String formatCreateDate() {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(createDate);
  }
}