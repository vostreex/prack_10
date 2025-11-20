import 'package:flutter/material.dart';

class TaskCategoryDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;
  final bool includeAll;

  const TaskCategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.includeAll = false,
  });

  @override
  Widget build(BuildContext context) {
    final items = <DropdownMenuItem<String>>[
      if (includeAll)
        const DropdownMenuItem(value: 'Все категории', child: Text('Все категории')),
      const DropdownMenuItem(value: 'Без категории', child: Text('Без категории')),
      const DropdownMenuItem(value: 'Работа', child: Text('Работа')),
      const DropdownMenuItem(value: 'Личное', child: Text('Личное')),
      const DropdownMenuItem(value: 'Учёба', child: Text('Учёба')),
    ];

    return DropdownButtonFormField<String>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Категория',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}