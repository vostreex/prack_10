import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prack_10/features/notes/models/note.dart';
import 'package:prack_10/shared/widgets/empty_state.dart';
import 'note_tile.dart';

class NoteListView extends StatelessWidget {
  final List<Note> notes;
  final Function(int) onTap;
  final Function(int) onDelete;
  final VoidCallback onRefresh;
  final Function(int) onToggleFavorite;
  final Function(int) onToggleArchive;

  const NoteListView({
    super.key,
    required this.notes,
    required this.onTap,
    required this.onDelete,
    required this.onRefresh,
    required this.onToggleFavorite,
    required this.onToggleArchive,
  });

  @override
  Widget build(BuildContext context) {
    return notes.isEmpty
        ? const EmptyState(message: 'Ничего не найдено')
        : ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) => NoteTile(
            note: notes[index],
            onTap: () => onTap(index),
            onDelete: () => onDelete(index),
            onRefresh: onRefresh,
            onToggleFavorite: () => onToggleFavorite(index),
            onToggleArchive: () => onToggleArchive(index),
          ),
        );
      },
    );
  }
}
