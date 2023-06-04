import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thelastlife/controllers/audio/songs.dart';
import 'package:thelastlife/controllers/settings_controller.dart';
import 'package:thelastlife/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

import 'controllers/audio/audio_contoller.dart';
import 'i18n/strings.g.dart';

Future<void> main() async {
  await GetStorage.init('settings');

  var settings = Get.put(SettingsContoller());

  await AudioController.init();

  usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  settings.locale() == null
      ? LocaleSettings.useDeviceLocale()
      : LocaleSettings.setLocale(AppLocale.values
          .singleWhere((element) => element.languageCode == settings.locale()));

  settingUpSystemUIOverlay();

  runApp(TranslationProvider(child: const MyApp()));
}

void settingUpSystemUIOverlay() {
// Setting SysemUIOverlay
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemStatusBarContrastEnforced: false,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent));
// Setting SystmeUIMode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
}

class MyApp extends GetView<SettingsContoller> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp.router(
        locale:
            TranslationProvider.of(context).flutterLocale, // use provideraQ  8
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,

        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),

        themeMode: controller.theme(),

        routerConfig: router,
      ),
    );
  }
}
