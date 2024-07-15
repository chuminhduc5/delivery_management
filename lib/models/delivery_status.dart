class DeliveryStatus {
  final String statusName;
  
  const DeliveryStatus ({required this.statusName});
  
  factory DeliveryStatus.fromMap(Map<String, dynamic> json) {
    return DeliveryStatus(statusName: json['name']);
  }
}