/// DTO для ответа от Supabase Auth API (signup/signin/refresh)
class AuthResponseDto {
  final String accessToken;
  final String refreshToken;
  final String? userId;
  final String? email;

  const AuthResponseDto({
    required this.accessToken,
    required this.refreshToken,
    this.userId,
    this.email,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      userId: json['user']?['id'] as String?,
      email: json['user']?['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      if (userId != null) 'user': {'id': userId, 'email': email},
    };
  }
}
