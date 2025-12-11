import 'package:json_annotation/json_annotation.dart';

part 'zen_quote_dto.g.dart';

/// DTO для цитаты из ZenQuotes API
@JsonSerializable()
class ZenQuoteDto {
  @JsonKey(name: 'q')
  final String quote;
  
  @JsonKey(name: 'a')
  final String author;
  
  @JsonKey(name: 'i')
  final String? imageUrl;
  
  @JsonKey(name: 'c')
  final String? characterCount;
  
  @JsonKey(name: 'h')
  final String? html;

  const ZenQuoteDto({
    required this.quote,
    required this.author,
    this.imageUrl,
    this.characterCount,
    this.html,
  });

  factory ZenQuoteDto.fromJson(Map<String, dynamic> json) => _$ZenQuoteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ZenQuoteDtoToJson(this);
}
