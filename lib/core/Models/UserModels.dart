import 'package:hive/hive.dart';

part 'UserModels.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String userType;

  @HiveField(4)
  final String token;
  @HiveField(5)
  final List<dynamic> permation;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.userType,
      required this.token,
      required this.permation});

  // تحويل من JSON إلى كائن User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      userType: json['user_type'],
      token: json['token'],
      permation: json['permissions'],
    );
  }

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'user_type': userType,
      'token': token,
      'permissions': permation,
    };
  }
}
