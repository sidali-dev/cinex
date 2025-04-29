import 'package:cinex/app/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/controllers/language_controller.dart';
import 'generated/l10n.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController = Get.find();
  final LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cinex',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
          themeController.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(languageController.getCurrentLanguage()),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
