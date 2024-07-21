class AuthResponse {
  final String jwt;
  final String id;
  final String username;
  final String fullName;

  const AuthResponse({
    required this.jwt,
    required this.id,
    required this.username,
    required this.fullName,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      jwt: json['data']['jwt'],
      id: json['data']['id'],
      username: json['data']['username'],
      fullName: json['data']['fullName'],
    );
  }
}
