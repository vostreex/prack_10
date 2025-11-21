import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/features/taskmanager/models/task.dart';
import 'app.dart';
import 'features/auth/model/user.dart';
import 'features/habits/models/habit.dart';
import 'features/notes/models/note.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'features/reflection/models/reflection_entry.dart';
import 'features/settings/state/settings_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru', null);
  await initializeDateFormatting('en', null);

  GetIt.I.registerSingleton<SettingsStore>(SettingsStore());

  GetIt.I.registerLazySingleton<ObservableList<Note>>(() => ObservableList<Note>());
  GetIt.I.registerLazySingleton<ObservableList<Task>>(() => ObservableList<Task>());
  GetIt.I.registerLazySingleton<ObservableList<Habit>>(() => ObservableList<Habit>());
  GetIt.I.registerLazySingleton<ObservableList<User>>(() => ObservableList<User>());
  GetIt.I.registerLazySingleton<ObservableList<ReflectionEntry>>(() => ObservableList<ReflectionEntry>());

  runApp(MyApp());
}