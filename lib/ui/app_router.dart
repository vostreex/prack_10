import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:prack_10/ui/features/auth/screens/login_screen.dart';
import 'package:prack_10/ui/features/auth/screens/register_screen.dart';
import 'package:prack_10/ui/features/habits/screens/habits_screen.dart';
import 'package:prack_10/ui/features/motivations/screens/motivation_screen.dart';
import 'package:prack_10/ui/features/notes/screens/notes_list_screen.dart';
import 'package:prack_10/ui/features/notes/screens/add_note_screen.dart';
import 'package:prack_10/ui/features/notes/screens/favorites_screen.dart';
import 'package:prack_10/ui/features/notes/screens/archive_screen.dart';
import 'package:prack_10/ui/features/settings/screen/settings_screen.dart';
import 'package:prack_10/ui/features/notes/screens/edit_note_screen.dart';
import 'package:prack_10/core/models/note.dart';
import 'package:prack_10/ui/features/main_screen.dart';
import 'package:prack_10/ui/features/settings/screen/profile_screen.dart';
import 'package:prack_10/core/models/habit.dart';
import 'package:prack_10/ui/features/habits/screens/add_habit_screen.dart';
import 'package:prack_10/ui/features/habits/screens/habit_details_screen.dart';
import 'package:prack_10/ui/features/onboarding/screens/onboarding_screen.dart';
import 'package:prack_10/core/models/reflection_entry.dart';
import 'package:prack_10/ui/features/reflection/screens/edit_reflections_screen.dart';
import 'package:prack_10/ui/features/reflection/screens/new_reflection_screen.dart';
import 'package:prack_10/ui/features/reflection/screens/reflection_list_screen.dart';
import 'package:prack_10/core/models/task.dart';
import 'package:prack_10/ui/features/taskmanager/screens/add_task_screen.dart';
import 'package:prack_10/ui/features/taskmanager/screens/task_details_screen.dart';
import 'package:prack_10/ui/features/taskmanager/screens/tasks_list_screen.dart';
import 'package:prack_10/domain/repositories/user_repository.dart';
import 'package:prack_10/domain/repositories/settings_repository.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: _redirect,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainMenuScreen(),
      ),

      GoRoute(
        path: '/notes',
        builder: (context, state) => NotesListScreen(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) =>  AddNoteScreen(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => FavoritesScreen(),
      ),
      GoRoute(
        path: '/archive',
        builder: (context, state) => ArchiveScreen(),
      ),
      GoRoute(
        path: '/edit/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final note = state.extra as Note;
          return EditNoteScreen(index: id, note: note);
        },
      ),

      GoRoute(
        path: '/tasks',
        builder: (context, state) => TasksListScreen(),
      ),
      GoRoute(
        path: '/tasks/add',
        builder: (context, state) => AddTaskScreen(),
      ),
      GoRoute(
        path: '/tasks/:id',
        builder: (context, state) {
          final task = state.extra as Task?;
          if (task == null) {
            return TasksListScreen();
          }
          return TaskDetailsScreen(task: task);
        },
      ),

      GoRoute(
        path: '/habits',
        builder: (context, state) => HabitsScreen(),
      ),
      GoRoute(
        path: '/habits/add',
        builder: (context, state) => AddHabitScreen(),
      ),
      GoRoute(
        path: '/habits/:id',
        builder: (context, state) => HabitDetailsScreen(
            habit: state.extra as Habit
        ),
      ),

      GoRoute(
        path: '/motivation',
        builder: (context, state) => MotivationScreen(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => RegisterScreen(),
      ),

      GoRoute(
        path: '/reflections',
        builder: (context, state) => ReflectionsListScreen(),
      ),
      GoRoute(
        path: '/reflection/add',
        builder: (context, state) => ReflectionAddScreen(),
      ),
      GoRoute(
        path: '/reflection/edit/:id',
        builder: (context, state) => ReflectionEditScreen(
          reflection: state.extra as ReflectionEntry,
        ),
      ),

      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingScreen(),
      ),

      GoRoute(
        path: '/settings',
        builder: (context, state) =>  SettingsScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => ProfileScreen(),
      ),
    ],
  );

  /// Проверка авторизации и onboarding при навигации
  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    final userRepository = GetIt.I<UserRepository>();
    final settingsRepository = GetIt.I<SettingsRepository>();
    
    final isLoggedIn = await userRepository.isLoggedIn();
    final onboardingCompleted = await settingsRepository.getOnboardingCompleted();
    
    final isOnboardingRoute = state.matchedLocation == '/onboarding';
    final isLoginRoute = state.matchedLocation == '/login' || state.matchedLocation == '/register';
    final isPublicRoute = isOnboardingRoute || isLoginRoute;

    // Если пользователь не прошел onboarding, перенаправляем на onboarding
    if (!onboardingCompleted && !isOnboardingRoute) {
      return '/onboarding';
    }

    // Если onboarding пройден, но пользователь не авторизован, перенаправляем на логин
    if (onboardingCompleted && !isLoggedIn && !isPublicRoute) {
      return '/login';
    }

    // Если пользователь авторизован и пытается зайти на логин/регистрацию, перенаправляем на главную
    if (isLoggedIn && isLoginRoute) {
      return '/';
    }

    // Если пользователь авторизован и прошел onboarding, разрешаем доступ
    if (isLoggedIn && onboardingCompleted) {
      return null;
    }

    return null;
  }
}
