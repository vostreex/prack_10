import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prack_10/features/notes/models/note.dart';
import '../state/add_note_store.dart';
import '../widgets/category_dropdown.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final AddNoteStore _store = AddNoteStore();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.addListener(() => _store.setTitle(_titleController.text));
    _contentController.addListener(() => _store.setBody(_contentController.text));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить заметку'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
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
                onChanged: (String? newValue) {
                  if (newValue != null) _store.setSelectedCategory(newValue);
                },
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text.trim();
                final content = _contentController.text.trim();
                if (title.isNotEmpty && content.isNotEmpty) {
                  _store.addNote(
                    Note(
                      title: title,
                      content: content,
                      category: _store.selectedCategory,
                    ),
                  );
                  _titleController.clear();
                  _contentController.clear();
                  context.pop('/notes');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Заполните оба поля')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 2,
                textStyle: const TextStyle(fontSize: 16.0),
              ),
              child: const Text('Добавить'),
            ),
          ],
        ),
      ),
    );
  }
}
