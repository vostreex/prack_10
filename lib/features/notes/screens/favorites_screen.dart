import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../state/favorites_store.dart';
import '../widgets/note_list_view.dart';
import '../widgets/category_dropdown.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final FavoritesStore _store = FavoritesStore();
  final TextEditingController _controller = TextEditingController();

  void _toggleFavorite(BuildContext ctx, String id) {
    final note = _store.notes.firstWhere((n) => n.id == id);
    final wasFavorite = note.isFavorite;
    _store.toggleFavorite(id);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(wasFavorite ? 'Заметка удалена из избранного' : 'Заметка добавлена в избранное')),
    );
  }

  void _toggleArchive(BuildContext ctx, String id) {
    final note = _store.notes.firstWhere((n) => n.id == id);
    final wasArchived = note.isArchived;
    _store.toggleArchive(id);
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text(wasArchived ? 'Заметка восстановлена из архива' : 'Заметка добавлена в архив')),
    );
  }

  void _deleteNote(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Подтверждение'),
        content: const Text('Вы уверены, что хотите удалить эту заметку?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
          TextButton(
            onPressed: () {
              _store.deleteNote(id);
              Navigator.of(context).pop();
            },
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() => _store.setSearchQuery(_controller.text));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Поиск избранных заметок',
                      hintText: 'Введите запрос для поиска',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Observer(
                  builder: (_) => CategoryDropdown(
                    value: _store.selectedCategory,
                    onChanged: (String? newValue) => _store.setSelectedCategory(newValue!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Observer(
              builder: (_) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey[100],
                ),
                child: Row(
                  children: [
                    Text('Сортировать по:', style: TextStyle(fontSize: 14.0, color: Colors.grey[700])),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _store.sortCriteria,
                          isExpanded: true,
                          items: <String>['Дата создания', 'Заголовок']
                              .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                              .toList(),
                          onChanged: (String? newValue) => _store.setSortCriteria(newValue!),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: Observer(
                builder: (_) => NoteListView(
                  notes: _store.filteredNotes,
                  onDelete: (index) => _deleteNote(context, _store.filteredNotes[index].id),
                  onTap: (index) => context.push('/edit/${_store.filteredNotes[index].id}', extra: _store.filteredNotes[index]),
                  onRefresh: () {},
                  onToggleFavorite: (index) => _toggleFavorite(context, _store.filteredNotes[index].id),
                  onToggleArchive: (index) => _toggleArchive(context, _store.filteredNotes[index].id),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
