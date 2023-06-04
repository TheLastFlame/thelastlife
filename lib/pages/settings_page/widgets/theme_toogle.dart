import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thelastlife/controllers/settings_controller.dart';

import '../../../constants.dart';
import '../../../i18n/strings.g.dart';


class ThemeToggle extends GetView<SettingsContoller> {
  const ThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.setThemeMode(ThemeMode.system);
                    },
                    child: Obx(
                      () => Card(
                        color: (controller.theme() == ThemeMode.system
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(appRoundRadiusSmall)),
                        child: Icon(
                          Icons.android,
                          color: controller.theme() == ThemeMode.system
                              ? context.theme.colorScheme.onPrimary
                              : context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(t.settings.system_theme)
              ],
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.setThemeMode(ThemeMode.light);
                    },
                    child: Obx(
                      () => Card(
                        color: (controller.theme() == ThemeMode.light
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(appRoundRadiusSmall)),
                        child: Icon(
                          Icons.sunny,
                          color: controller.theme() == ThemeMode.light
                              ? context.theme.colorScheme.onPrimary
                              : context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(t.settings.light_theme)
              ],
            ),
          ),
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: InkResponse(
                    onTap: () {
                      controller.setThemeMode(ThemeMode.dark);
                    },
                    child: Obx(
                      () => Card(
                        color: (controller.theme() == ThemeMode.dark
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.background),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(appRoundRadiusSmall)),
                        child: Icon(
                          Icons.dark_mode,
                          color: controller.theme() == ThemeMode.dark
                              ? context.theme.colorScheme.onPrimary
                              : context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(t.settings.dark_theme)
              ],
            ),
          ),
        ),
      ],
    );
  }
}