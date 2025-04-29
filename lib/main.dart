import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/language_controller.dart';
import 'app/controllers/theme_controller.dart';
import 'myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  await GetStorage.init();

  Get.put(LanguageController());
  Get.put(ThemeController());

  runApp(MyApp());
}
