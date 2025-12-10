import '../../core/models/motivation_item.dart';
import '../dtos/motivation_dto.dart';

class MotivationMapper {
  static MotivationItem fromDto(MotivationDto dto) {
    return MotivationItem(
      id: dto.id,
      text: dto.text,
      category: dto.category,
      type: dto.type,
    );
  }

  static MotivationDto toDto(MotivationItem item) {
    return MotivationDto(
      id: item.id,
      text: item.text,
      category: item.category,
      type: item.type,
    );
  }
}
