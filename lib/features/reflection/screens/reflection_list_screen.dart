import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../state/reflections_list_store.dart';
import '../widgets/reflections_list_view.dart';

class ReflectionsListScreen extends StatelessWidget {
  ReflectionsListScreen({super.key});

  final ReflectionsListStore _store = ReflectionsListStore();
  final TextEditingController _controller = TextEditingController();

  void _deleteReflection(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Подтверждение'),
        content: const Text('Вы уверены, что хотите удалить эту рефлексию?'),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Отмена')),
          TextButton(
            onPressed: () {
              _store.deleteReflection(id);
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
        title: const Text("Дневник рефлексий"),
        actions: [
          IconButton(icon: const Icon(Icons.home), onPressed: () => context.push('/')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Поиск рефлексий',
                hintText: 'Введите запрос для поиска',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: Observer(
                builder: (_) => ReflectionListView(
                  reflections: _store.filteredReflections,
                  onDelete: (index) => _deleteReflection(context, _store.filteredReflections[index].id),
                  onTap: (index) => context.push('/reflection/edit/${_store.filteredReflections[index].id}',
                      extra: _store.filteredReflections[index]),
                  onRefresh: () {},
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/reflection/add'),
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}