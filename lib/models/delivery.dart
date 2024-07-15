class Delivery {
  final String id;
  final String status;
  final int statusId;
  final String createDate;
  final String nameCustomer;
  final String customerAddress;

  const Delivery({
    required this.id,
    required this.status,
    required this.statusId,
    required this.createDate,
    required this.nameCustomer,
    required this.customerAddress,
  });

  factory Delivery.fromMap(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'].toString(),
      status: json['status'] ?? '',
      statusId: json['statusId'] is int ? json['statusId'] : int.parse(json['statusId']),
      createDate: json['createDate'] ?? '',
      nameCustomer: json['nameCustomer'] ?? '',
      customerAddress: json['customerAddress'] ?? '',
    );
  }
}
