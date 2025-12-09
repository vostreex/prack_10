import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.password,
    String? id,
  }) : id = id ?? const Uuid().v4();

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
