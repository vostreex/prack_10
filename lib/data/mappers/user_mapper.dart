import 'package:prack_10/core/models/user.dart';
import '../dtos/user_dto.dart';

class UserMapper {
  static User fromDto(UserDto dto) {
    return User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      password: dto.password,
    );
  }

  static UserDto toDto(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
    );
  }
}
