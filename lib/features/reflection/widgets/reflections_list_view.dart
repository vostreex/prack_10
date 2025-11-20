import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prack_10/features/reflection/models/reflection_entry.dart';

class ReflectionListView extends StatelessWidget {
  final List<ReflectionEntry> reflections;
  final Function(int) onDelete;
  final Function(int) onTap;
  final Function onRefresh;

  const ReflectionListView({
    super.key,
    required this.reflections,
    required this.onDelete,
    required this.onTap,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    if (reflections.isEmpty) {
      return const Center(child: Text('Нет дневников'));
    }

    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: reflections.length,
        itemBuilder: (context, index) {
          final reflection = reflections[index];
          final formattedDate = DateFormat('dd.MM.yyyy', 'ru').format(reflection.creationDate);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('Дневник за: $formattedDate'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => onDelete(index),
              ),
              onTap: () => onTap(index),
            ),
          );
        },
      ),
    );
  }
}