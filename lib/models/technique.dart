class Technique {
  final String id;
  final String status;
  final String createDate;
  final String description;

  Technique(
      {required this.id,
      required this.status,
      required this.createDate,
      required this.description});

  factory Technique.fromMap(Map<String, dynamic> json) {
    return Technique(
      id: json['id'].toString(),
      status: json['status'].toString(),
      createDate: json['createDate'] ?? '',
      description: json['description'].toString(),
    );
  }
}
