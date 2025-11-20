import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../state/add_task_store.dart';
import '../widgets/task_category_dropdown.dart';
import 'package:go_router/go_router.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  final AddTaskStore _store = AddTaskStore();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _newItemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.addListener(() => _store.setTitle(_titleController.text));
    _descriptionController.addListener(
            () => _store.setDescription(_descriptionController.text));
    _newItemController.addListener(() => _store.setNewItemTitle(_newItemController.text));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Добавить задачу'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Название',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Описание',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => TaskCategoryDropdown(
                includeAll: false,
                value: _store.selectedCategory,
                onChanged: (v) {
                  if (v != null) _store.setSelectedCategory(v);
                },
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => ListTile(
                title: Text(
                  'Дедлайн: ${_store.deadline?.toLocal().toString().split(' ')[0] ?? 'Не установлен'}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _store.deadline ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    _store.setDeadline(date);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Подзадачи', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Observer(
              builder: (_) => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _store.newItems.length,
                itemBuilder: (context, index) {
                  final item = _store.newItems[index];
                  return ListTile(
                    title: Text(item),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _store.removeNewItem(item),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _newItemController,
                    decoration: InputDecoration(
                      labelText: 'Новая подзадача',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _store.addNewItem();
                    _newItemController.clear();
                  },
                  child: const Text('Добавить'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_store.title.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Введите название')),
                  );
                  return;
                }

                final task = _store.buildTask();
                Navigator.of(context).pop(task);
              },
              child: const Text('Создать задачу'),
            ),
          ],
        ),
      ),
    );
  }
}