/// DTO для запроса регистрации
class SignUpRequestDto {
  final String email;
  final String password;

  const SignUpRequestDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
