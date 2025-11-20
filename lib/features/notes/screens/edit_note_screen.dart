import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../state/edit_note_store.dart';
import '../widgets/category_dropdown.dart';
import '../models/note.dart';

class EditNoteScreen extends StatelessWidget {
  final String index;
  final Note note;

  EditNoteScreen({super.key, required this.index, required this.note});

  final EditNoteStore _store = EditNoteStore();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = note.title;
    _contentController.text = note.content;
    _store.setTitle(note.title);
    _store.setBody(note.content);
    _store.setSelectedCategory(note.category);

    _titleController.addListener(() => _store.setTitle(_titleController.text));
    _contentController.addListener(() => _store.setBody(_contentController.text));

    return Scaffold(
      appBar: AppBar(
        title: Text("Редактирование заметки: ${_titleController.text}"),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Заголовок',
                hintText: 'Введите заголовок заметки',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
              maxLength: 70,
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Содержимое',
                hintText: 'Введите текст заметки',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
              maxLines: 5,
              minLines: 3,
            ),
            const SizedBox(height: 20.0),
            Observer(
              builder: (_) => CategoryDropdown(
                value: _store.selectedCategory,
                onChanged: (String? newValue) => _store.setSelectedCategory(newValue!),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                final content = _contentController.text.trim();
                if (title.isNotEmpty && content.isNotEmpty) {
                  _store.updateNote(
                    index,
                    Note(
                      title: title,
                      content: content,
                      category: _store.selectedCategory,
                      isFavorite: note.isFavorite,
                      isArchived: note.isArchived,
                    ),
                  );
                  context.pop();
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      title: const Text('Ошибка'),
                      content: const Text('Оба поля должны быть заполнены!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                        ),
                      ],
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                elevation: 2,
                textStyle: const TextStyle(fontSize: 16.0),
              ),
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
