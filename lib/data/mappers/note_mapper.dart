import '../../core/models/note.dart';
import '../dtos/note_dto.dart';

class NoteMapper {
  static Note fromDto(NoteDto dto) {
    return Note(
      id: dto.id,
      title: dto.title,
      content: dto.content,
      category: dto.category,
      creationDate: DateTime.fromMillisecondsSinceEpoch(dto.creationDate),
      isFavorite: dto.isFavorite == 1,
      isArchived: dto.isArchived == 1,
    );
  }

  static NoteDto toDto(Note entity) {
    return NoteDto(
      id: entity.id,
      title: entity.title,
      content: entity.content,
      category: entity.category,
      creationDate: entity.creationDate.millisecondsSinceEpoch,
      isFavorite: entity.isFavorite ? 1 : 0,
      isArchived: entity.isArchived ? 1 : 0,
    );
  }
}
