class User{
  final String username;

  const User({required this.username});

  factory User.fromMap(Map<String, dynamic> json){
    return User(username: json['username']);
  }

}