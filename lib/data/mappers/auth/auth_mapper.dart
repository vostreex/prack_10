import '../../../core/models/user.dart';
import '../../dtos/auth/auth_response_dto.dart';
import '../../dtos/auth/supabase_user_dto.dart';

/// Mapper для конвертации DTO в доменные модели
class AuthMapper {
  /// Конвертировать AuthResponseDto в доменную модель User
  static User? userFromAuthResponse(AuthResponseDto dto, {String? name}) {
    if (dto.userId == null) return null;
    
    return User(
      id: dto.userId!,
      name: name ?? '',
      email: dto.email ?? '',
      password: '', // Пароль не храним
    );
  }

  /// Конвертировать SupabaseUserDto в доменную модель User
  static User userFromSupabaseUserDto(SupabaseUserDto dto) {
    return User(
      id: dto.id,
      name: dto.name ?? '',
      email: dto.email,
      password: '', // Пароль не храним
    );
  }
}
