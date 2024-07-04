class DeliveryModel {
  final String id;
  final String status;

  DeliveryModel({required this.id, required this.status});

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['id'].toString(),
      status: json['status'] ?? 'unknown',
    );
  }
}
