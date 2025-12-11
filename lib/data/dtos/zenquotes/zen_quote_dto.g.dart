// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zen_quote_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZenQuoteDto _$ZenQuoteDtoFromJson(Map<String, dynamic> json) => ZenQuoteDto(
  quote: json['q'] as String,
  author: json['a'] as String,
  imageUrl: json['i'] as String?,
  characterCount: json['c'] as String?,
  html: json['h'] as String?,
);

Map<String, dynamic> _$ZenQuoteDtoToJson(ZenQuoteDto instance) =>
    <String, dynamic>{
      'q': instance.quote,
      'a': instance.author,
      'i': instance.imageUrl,
      'c': instance.characterCount,
      'h': instance.html,
    };
