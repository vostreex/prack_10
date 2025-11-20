// app.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:prack_10/features/settings/state/settings_store.dart';
import 'app_router.dart';
import 'shared/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    final settingsStore = GetIt.I<SettingsStore>();

    return Observer(
      builder: (_) => MaterialApp.router(

        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        locale: settingsStore.locale,

        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: settingsStore.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      ),
    );
  }
}