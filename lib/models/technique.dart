class Technique {
  final String id;
  final String status;
  final String date;
  final String branch;

  Technique(
      {required this.id,
      required this.status,
      required this.date,
      required this.branch});

  factory Technique.fromMap(Map<String, dynamic> json) {
    return Technique(
        id: json[''],
        status: json[''],
        date: json[''],
        branch: json[''],
    );
  }
}
