import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:prack_10/ui/app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:prack_10/ui/features/settings/state/settings_store.dart';
import 'package:prack_10/ui/features/motivations/state/motivation_store.dart';
import 'package:prack_10/data/datasources/local/note_local_datasource.dart';
import 'package:prack_10/data/datasources/local/user_local_datasource.dart';
import 'package:prack_10/data/datasources/local/reflection_local_datasource.dart';
import 'package:prack_10/data/datasources/remote/api/dio_client.dart';
import 'package:prack_10/data/datasources/remote/api/supabase_auth_datasource.dart';
import 'package:prack_10/data/datasources/remote/api/zenquotes_api_client.dart';
import 'package:prack_10/data/datasources/remote/motivation_remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:prack_10/data/repositories/note_repository_impl.dart';
import 'package:prack_10/data/repositories/task_repository_impl.dart';
import 'package:prack_10/data/repositories/habit_repository_impl.dart';
import 'package:prack_10/data/repositories/user_repository_impl.dart';
import 'package:prack_10/data/repositories/reflection_repository_impl.dart';
import 'package:prack_10/data/repositories/settings_repository_impl.dart';
import 'package:prack_10/data/repositories/motivation_repository_impl.dart';
import 'package:prack_10/domain/repositories/note_repository.dart';
import 'package:prack_10/domain/repositories/task_repository.dart';
import 'package:prack_10/domain/repositories/habit_repository.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';
import 'package:prack_10/domain/repositories/reflection_repository.dart';
import 'package:prack_10/domain/repositories/settings_repository.dart';
import 'package:prack_10/domain/repositories/motivation_repository.dart';
import 'package:prack_10/domain/usecases/notes/notes_usecases.dart';
import 'package:prack_10/domain/usecases/tasks/tasks_usecases.dart';
import 'package:prack_10/domain/usecases/habits/habits_usecases.dart';
import 'package:prack_10/domain/usecases/users/users_usecases.dart';
import 'package:prack_10/domain/usecases/reflections/reflections_usecases.dart';
import 'package:prack_10/domain/usecases/settings/settings_usecases.dart';
import 'package:prack_10/domain/usecases/motivations/motivations_usecases.dart';

import 'data/datasources/local/habit_local_datasource.dart';
import 'data/datasources/local/motivation_local_datasource.dart';
import 'data/datasources/local/settings_local_datasource.dart';
import 'data/datasources/local/task_local_datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru', null);
  await initializeDateFormatting('en', null);

  // Register data sources
  GetIt.I.registerLazySingleton<NoteLocalDataSource>(() => NoteLocalDataSource());
  GetIt.I.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSource());
  GetIt.I.registerLazySingleton<HabitLocalDataSource>(() => HabitLocalDataSource());
  GetIt.I.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource());
  GetIt.I.registerLazySingleton<ReflectionLocalDataSource>(() => ReflectionLocalDataSource());
  GetIt.I.registerLazySingleton<MotivationLocalDataSource>(() => MotivationLocalDataSource());
  GetIt.I.registerLazySingleton<SettingsLocalDataSource>(() => SettingsLocalDataSource());
  GetIt.I.registerLazySingleton<SupabaseDioClient>(() => SupabaseDioClient());
  GetIt.I.registerLazySingleton<SupabaseAuthDataSource>(
    () => SupabaseAuthDataSource(GetIt.I<SupabaseDioClient>()),
  );
  
  // Register ZenQuotes API client
  GetIt.I.registerLazySingleton<Dio>(() => Dio());
  GetIt.I.registerLazySingleton<ZenQuotesApiClient>(
    () => ZenQuotesApiClient(GetIt.I<Dio>()),
  );
  GetIt.I.registerLazySingleton<MotivationRemoteDataSource>(
    () => MotivationRemoteDataSource(GetIt.I<ZenQuotesApiClient>()),
  );

  // Register repositories
  final noteRepository = NoteRepositoryImpl(GetIt.I<NoteLocalDataSource>());
  final taskRepository = TaskRepositoryImpl(GetIt.I<TaskLocalDataSource>());
  final habitRepository = HabitRepositoryImpl(GetIt.I<HabitLocalDataSource>());
  final userRepository = UserRepositoryImpl(
    GetIt.I<UserLocalDataSource>(),
    GetIt.I<SupabaseAuthDataSource>(),
  );
  final reflectionRepository = ReflectionRepositoryImpl(GetIt.I<ReflectionLocalDataSource>());
  final settingsRepository = SettingsRepositoryImpl(GetIt.I<SettingsLocalDataSource>());
  final motivationRepository = MotivationRepositoryImpl(
    GetIt.I<MotivationLocalDataSource>(),
    GetIt.I<MotivationRemoteDataSource>(),
  );

  GetIt.I.registerLazySingleton<NoteRepository>(() => noteRepository);
  GetIt.I.registerLazySingleton<TaskRepository>(() => taskRepository);
  GetIt.I.registerLazySingleton<HabitRepository>(() => habitRepository);
  GetIt.I.registerLazySingleton<UserRepository>(() => userRepository);
  GetIt.I.registerLazySingleton<ReflectionRepository>(() => reflectionRepository);
  GetIt.I.registerLazySingleton<SettingsRepository>(() => settingsRepository);
  GetIt.I.registerLazySingleton<MotivationRepository>(() => motivationRepository);

  // Register use cases for Notes
  GetIt.I.registerLazySingleton<GetNotesUseCase>(() => GetNotesUseCase(noteRepository));
  GetIt.I.registerLazySingleton<GetNoteByIdUseCase>(() => GetNoteByIdUseCase(noteRepository));
  GetIt.I.registerLazySingleton<AddNoteUseCase>(() => AddNoteUseCase(noteRepository));
  GetIt.I.registerLazySingleton<UpdateNoteUseCase>(() => UpdateNoteUseCase(noteRepository));
  GetIt.I.registerLazySingleton<DeleteNoteUseCase>(() => DeleteNoteUseCase(noteRepository));
  GetIt.I.registerLazySingleton<ToggleFavoriteNoteUseCase>(() => ToggleFavoriteNoteUseCase(noteRepository));
  GetIt.I.registerLazySingleton<ToggleArchiveNoteUseCase>(() => ToggleArchiveNoteUseCase(noteRepository));
  GetIt.I.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(noteRepository));

  // Register use cases for Tasks
  GetIt.I.registerLazySingleton<GetTasksUseCase>(() => GetTasksUseCase(taskRepository));
  GetIt.I.registerLazySingleton<GetTaskByIdUseCase>(() => GetTaskByIdUseCase(taskRepository));
  GetIt.I.registerLazySingleton<AddTaskUseCase>(() => AddTaskUseCase(taskRepository));
  GetIt.I.registerLazySingleton<UpdateTaskUseCase>(() => UpdateTaskUseCase(taskRepository));
  GetIt.I.registerLazySingleton<DeleteTaskUseCase>(() => DeleteTaskUseCase(taskRepository));

  // Register use cases for Habits
  GetIt.I.registerLazySingleton<GetHabitsUseCase>(() => GetHabitsUseCase(habitRepository));
  GetIt.I.registerLazySingleton<GetHabitByIdUseCase>(() => GetHabitByIdUseCase(habitRepository));
  GetIt.I.registerLazySingleton<AddHabitUseCase>(() => AddHabitUseCase(habitRepository));
  GetIt.I.registerLazySingleton<UpdateHabitUseCase>(() => UpdateHabitUseCase(habitRepository));
  GetIt.I.registerLazySingleton<DeleteHabitUseCase>(() => DeleteHabitUseCase(habitRepository));
  GetIt.I.registerLazySingleton<ToggleTodayHabitUseCase>(() => ToggleTodayHabitUseCase(habitRepository));

  // Register use cases for Users
  GetIt.I.registerLazySingleton<GetUsersUseCase>(() => GetUsersUseCase(userRepository));
  GetIt.I.registerLazySingleton<GetUserByIdUseCase>(() => GetUserByIdUseCase(userRepository));
  GetIt.I.registerLazySingleton<GetUserByEmailUseCase>(() => GetUserByEmailUseCase(userRepository));
  GetIt.I.registerLazySingleton<AddUserUseCase>(() => AddUserUseCase(userRepository));
  GetIt.I.registerLazySingleton<UpdateUserUseCase>(() => UpdateUserUseCase(userRepository));
  GetIt.I.registerLazySingleton<DeleteUserUseCase>(() => DeleteUserUseCase(userRepository));

  // Register use cases for Reflections
  GetIt.I.registerLazySingleton<GetReflectionsUseCase>(() => GetReflectionsUseCase(reflectionRepository));
  GetIt.I.registerLazySingleton<GetReflectionByIdUseCase>(() => GetReflectionByIdUseCase(reflectionRepository));
  GetIt.I.registerLazySingleton<AddReflectionUseCase>(() => AddReflectionUseCase(reflectionRepository));
  GetIt.I.registerLazySingleton<UpdateReflectionUseCase>(() => UpdateReflectionUseCase(reflectionRepository));
  GetIt.I.registerLazySingleton<DeleteReflectionUseCase>(() => DeleteReflectionUseCase(reflectionRepository));
  GetIt.I.registerLazySingleton<GetQuestionsUseCase>(() => GetQuestionsUseCase(reflectionRepository));

  // Register use cases for Settings
  GetIt.I.registerLazySingleton<GetSettingsUseCase>(() => GetSettingsUseCase(settingsRepository));
  GetIt.I.registerLazySingleton<SaveSettingsUseCase>(() => SaveSettingsUseCase(settingsRepository));
  GetIt.I.registerLazySingleton<UpdateThemeUseCase>(() => UpdateThemeUseCase(settingsRepository));
  GetIt.I.registerLazySingleton<UpdateLanguageUseCase>(() => UpdateLanguageUseCase(settingsRepository));

  // Register use cases for Motivations
  GetIt.I.registerLazySingleton<GetQuotesUseCase>(() => GetQuotesUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<GetFactsUseCase>(() => GetFactsUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<GetQuotesByCategoryUseCase>(() => GetQuotesByCategoryUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<GetFactsByCategoryUseCase>(() => GetFactsByCategoryUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<GetMotivationCategoriesUseCase>(() => GetMotivationCategoriesUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<GetRandomQuoteUseCase>(() => GetRandomQuoteUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<GetQuoteOfTheDayUseCase>(() => GetQuoteOfTheDayUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<SearchQuotesUseCase>(() => SearchQuotesUseCase(motivationRepository));
  GetIt.I.registerLazySingleton<GetQuotesByAuthorUseCase>(() => GetQuotesByAuthorUseCase(motivationRepository));

  final settingsStore = SettingsStore();
  await settingsStore.init();   // <-- ОЧЕНЬ ВАЖНО!!!
  GetIt.I.registerSingleton<SettingsStore>(settingsStore);

  final motivationStore = MotivationStore();
  GetIt.I.registerSingleton<MotivationStore>(motivationStore);
  motivationStore.initialize();

  runApp(MyApp());
}
