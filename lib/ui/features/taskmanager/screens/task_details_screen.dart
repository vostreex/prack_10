// screens/task_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../state/task_details_store.dart';
import 'package:prack_10/core/models/task.dart';

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
        title: Observer(
          builder: (_) => Text(store.task.title),
        ),
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
              if (store.task.description.isNotEmpty) ...[
                Text(
                  store.task.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
              ],
              Text("Категория: ${store.task.category}"),
              const SizedBox(height: 8),
              Text(
                "Дедлайн: ${store.task.deadline.toLocal().toString().split(' ')[0]}",
                style: TextStyle(
                  color: store.task.deadline.isBefore(DateTime.now())
                      ? Colors.red
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: store.task.progressPercent / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        store.task.isCompleted ? Colors.green : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "${store.task.progressPercent}%",
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
                child: store.task.items.isEmpty
                    ? const Center(
                  child: Text(
                    "Подзадач пока нет",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: store.task.items.length,
                  itemBuilder: (context, index) {
                    final item = store.task.items[index];
                    return Observer(
                      builder: (_) => CheckboxListTile(
                        value: item.isCompleted,
                        title: Text(
                          item.title,
                          style: TextStyle(
                            decoration: item.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                            color: item.isCompleted ? Colors.grey : null,
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