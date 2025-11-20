import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../models/task.dart';
import '../state/tasks_list_store.dart';
import '../widgets/task_tile.dart';
import '../widgets/task_category_dropdown.dart';

class TasksListScreen extends StatelessWidget {
  TasksListScreen({super.key});

  final TasksListStore _store = TasksListStore();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() => _store.setSearchQuery(_controller.text));

    void _confirmDelete(String id) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Подтверждение'),
          content: const Text('Вы уверены, что хотите удалить задачу?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                _store.deleteTask(id);
                Navigator.of(context).pop();
              },
              child: const Text('Удалить'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Задачи'),
        actions: [
          IconButton(icon: const Icon(Icons.home), onPressed: () => context.push('/')),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await context.push('/tasks/add');
              if (result != null && result is Task) {
                _store.tasks.add(result);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Поиск задач',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Observer(
                    builder: (_) => TaskCategoryDropdown(
                      includeAll: true,
                      value: _store.selectedCategory,
                      onChanged: (v) {
                        if (v != null) _store.setSelectedCategory(v);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Observer(
                    builder: (_) => DropdownButtonFormField<String>(
                      value: _store.sortCriteria,
                      items: const [
                        DropdownMenuItem(value: 'Дедлайн', child: Text('Дедлайн')),
                        DropdownMenuItem(value: 'Название', child: Text('Название')),
                      ],
                      onChanged: (v) {
                        if (v != null) _store.setSortCriteria(v);
                      },
                      decoration: InputDecoration(
                        labelText: 'Сортировка',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Observer(
                builder: (_) {
                  final tasks = _store.filteredTasks;

                  if (tasks.isEmpty) {
                    return const Center(
                      child: Text(
                        'Нет задач',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (_, i) {
                      final task = tasks[i];

                      return TaskTile(
                        task: task,
                        onDelete: () => _confirmDelete(task.id),
                        onTap: () async {
                          final result = await context.push('/tasks/${task.id}');
                          if (result != null && result is Map<String, dynamic>) {
                            if (result['delete'] == true) {
                              _store.deleteTask(task.id);
                            }
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}