import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../controllers/settings_controller.dart';
import '../../i18n/strings.g.dart';
import 'widgets/languag_toogle.dart';
import 'widgets/theme_toogle.dart';

class SettingsPage extends GetView<SettingsContoller> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < -10) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: buildTitle(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(t.settings.volume ,  style: Theme.of(context).textTheme.headlineMedium,),
                Obx(
                  () => Slider(
                    value: controller.volumeValue(),
                    divisions: 10,
                    onChanged: (value) => {controller.setVolume(value)},
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(t.settings.theme_mode ,  style: Theme.of(context).textTheme.headlineMedium,),
                const ThemeToggle(),
              ],
            ),
            Column(
              children: [
                Text(
                  t.settings.languag,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 80,
                  child: LanguagToggle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildTitle(BuildContext context) {
    return AppBar(
      title: Text(
        t.settings.title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
