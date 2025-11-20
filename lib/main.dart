import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/taskmanager/models/task.dart';
import 'app.dart';
import 'features/auth/model/user.dart';
import 'features/habits/models/habit.dart';
import 'features/habits/state/habits_store.dart';
import 'features/notes/models/note.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  GetIt.I.registerSingleton<ObservableList<Note>>(ObservableList<Note>());
  GetIt.I.registerSingleton<ObservableList<Task>>(ObservableList<Task>());
  GetIt.I.registerSingleton<ObservableList<Habit>>(ObservableList<Habit>());
  GetIt.I.registerSingleton<ObservableList<User>>(ObservableList<User>());
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru', null);
  runApp(MyApp());
}