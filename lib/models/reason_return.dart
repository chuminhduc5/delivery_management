class ReasonReturn {
  final int id;
  final String description;

  ReasonReturn({required this.id, required this.description});

  factory ReasonReturn.fromMap(Map<String, dynamic> json) {
    return ReasonReturn(
        id: json['id'],
        description: json['description'],
    );
  }
}