import '../../core/models/motivation_item.dart';
import '../dtos/zenquotes/zen_quote_dto.dart';

/// Mapper для конвертации DTO ZenQuotes API в доменные модели
class ZenQuotesMapper {
  /// Конвертировать ZenQuoteDto в MotivationItem (цитата)
  static MotivationItem zenQuoteDtoToMotivationItem(ZenQuoteDto dto) {
    // Формируем текст цитаты: "Текст цитаты" – Автор
    final text = '${dto.quote} – ${dto.author}';
    
    // Используем "Без категории", так как ZenQuotes не предоставляет категории
    return MotivationItem(
      id: '${dto.author}_${dto.quote.hashCode}', // Генерируем ID из автора и текста
      text: text,
      category: 'Без категории',
      type: 'quote',
    );
  }

  /// Конвертировать список ZenQuoteDto в список MotivationItem
  static List<MotivationItem> zenQuoteDtoListToMotivationItems(List<ZenQuoteDto> dtos) {
    return dtos.map((dto) => zenQuoteDtoToMotivationItem(dto)).toList();
  }
}
