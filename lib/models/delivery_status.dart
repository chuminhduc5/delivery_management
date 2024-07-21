class DeliveryStatus {
  final String value;
  final String name;

  const DeliveryStatus({required this.value, required this.name});

  int get intValue => int.parse(value);

  factory DeliveryStatus.fromMap(Map<String, dynamic> json) {
    return DeliveryStatus(value: json['value'], name: json['text']);
  }
}
