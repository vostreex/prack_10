/// DTO для запроса смены пароля
class UpdatePasswordRequestDto {
  final String password;

  const UpdatePasswordRequestDto({
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': password,
    };
  }
}
