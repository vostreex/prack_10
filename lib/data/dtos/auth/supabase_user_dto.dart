/// DTO для пользователя Supabase
class SupabaseUserDto {
  final String id;
  final String email;
  final String? name;
  final Map<String, dynamic>? userMetadata;

  const SupabaseUserDto({
    required this.id,
    required this.email,
    this.name,
    this.userMetadata,
  });

  factory SupabaseUserDto.fromJson(Map<String, dynamic> json) {
    return SupabaseUserDto(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['user_metadata']?['name'] as String?,
      userMetadata: json['user_metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      if (userMetadata != null) 'user_metadata': userMetadata,
    };
  }
}
