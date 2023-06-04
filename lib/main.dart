import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thelastlife/routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

import 'i18n/strings.g.dart';

Future<void> main() async {
  usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  // settingsData!.lang == null
  //     ? LocaleSettings.useDeviceLocale()
  //     : LocaleSettings.setLocale(AppLocale.values.singleWhere(
  //         (element) => element.languageCode == settingsData?.lang));
  LocaleSettings.useDeviceLocale();

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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale:
            TranslationProvider.of(context).flutterLocale, // use provideraQ  8
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,

      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routerConfig: router,
    );
  }
}
