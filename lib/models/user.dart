class AuthResponse {
  final String jwt;
  final String? refreshToken;
  final String id;
  final String userName;
  final String fullName;
  final String? email;
  final int phone;
  final DateTime dateExpires;
  final String? departmentName;

  AuthResponse({
    required this.jwt,
    this.refreshToken,
    required this.id,
    required this.userName,
    required this.fullName,
    this.email,
    required this.phone,
    required this.dateExpires,
    this.departmentName,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      jwt: json['data']['jwt'] as String,
      refreshToken: json['data']['refreshToken'] as String?,
      id: json['data']['id'] as String,
      userName: json['data']['userName'] as String,
      fullName: json['data']['fullName'] as String,
      email: json['data']['email'] as String?,
      phone: json['data']['phone'] as int,
      dateExpires: DateTime.parse(json['data']['dateExpires'] as String),
      departmentName: json['data']['departmentName'] as String?,
    );
  }
}
