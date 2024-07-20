class Branch {
  final String name;
  final String? address;
  final String? road;

  Branch({required this.name, this.address, this.road});

  factory Branch.fromMap(Map<String, dynamic> json) {
    return Branch(name: json['name']);
  }
}
