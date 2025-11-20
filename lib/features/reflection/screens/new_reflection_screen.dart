// ReflectionAddScreen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prack_10/features/reflection/state/reflection_form_store_for_new.dart';
import '../models/questions.dart';

class ReflectionAddScreen extends StatelessWidget {
  ReflectionAddScreen({super.key});

  final ReflectionFormStore store = ReflectionFormStore();
  late final List<TextEditingController> _answerControllers;
  late final TextEditingController _additionalController;

  void _initControllers() {
    _answerControllers = List.generate(
      reflectionQuestions.length,
          (i) {
        final controller = TextEditingController(text: store.answers[i]);
        controller.addListener(() => store.setAnswer(i, controller.text));
        return controller;
      },
    );
    _additionalController = TextEditingController(text: store.additionalNotes);
    _additionalController.addListener(() => store.setAdditionalNotes(_additionalController.text));
  }

  bool _isEmpty() {
    final allAnswersEmpty = store.answers.every((a) => a.trim().isEmpty);
    final additionalEmpty = store.additionalNotes.trim().isEmpty;
    return allAnswersEmpty && additionalEmpty;
  }

  void _saveReflection(BuildContext context) {
    if (_isEmpty()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните хотя бы одно поле')),
      );
      return;
    }

    store.save();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    _initControllers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая рефлексия'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ...reflectionQuestions.asMap().entries.map((entry) {
              final index = entry.key;
              final question = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: _answerControllers[index],
                  decoration: InputDecoration(
                    labelText: question,
                    border: const OutlineInputBorder(),
                  ),
                  maxLines: null,
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                controller: _additionalController,
                decoration: const InputDecoration(
                  labelText: 'Дополнительные мысли',
                  border: const OutlineInputBorder(),
                ),
                maxLines: null,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _saveReflection(context),
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}