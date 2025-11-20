// screens/task_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../state/task_details_store.dart';
import '../models/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final store = TaskDetailsStore(task);
    final TextEditingController _controller = TextEditingController();

    // Синхронизируем контроллер с observable
    _controller.addListener(() {
      store.setNewItemTitle(_controller.text);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              Navigator.of(context).pop({'delete': true});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (task.description.isNotEmpty) ...[
                Text(
                  task.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
              ],
              Text("Категория: ${task.category}"),
              const SizedBox(height: 8),
              Text(
                "Дедлайн: ${task.deadline.toLocal().toString().split(' ')[0]}",
                style: TextStyle(
                  color: task.deadline.isBefore(DateTime.now())
                      ? Colors.red
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: task.progressPercent / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        task.isCompleted ? Colors.green : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${task.progressPercent}%",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "Подзадачи",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Expanded(
                child: task.items.isEmpty
                    ? const Center(
                  child: Text(
                    "Подзадач пока нет",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: task.items.length,
                  itemBuilder: (context, index) {
                    final item = task.items[index];
                    return Observer(
                      builder: (_) => CheckboxListTile(
                        value: item.isDone,
                        title: Text(
                          item.title,
                          style: TextStyle(
                            decoration: item.isDone
                                ? TextDecoration.lineThrough
                                : null,
                            color: item.isDone ? Colors.grey : null,
                          ),
                        ),
                        onChanged: (_) => store.toggleItem(item),
                        secondary: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => store.removeItem(item),
                        ),
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
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: "Новая подзадача",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onSubmitted: (_) => store.addItem(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Observer(
                    builder: (_) => ElevatedButton(
                      onPressed: store.canAddItem ? () {
                        store.addItem();
                        _controller.clear();
                      } : null,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}