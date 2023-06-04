import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../controllers/settings_controller.dart';
import '../../../i18n/strings.g.dart';
import 'widgets/languag_toogle.dart';

class SettingsPage extends GetView<SettingsContoller> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy < -10) {
          context.pop();
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(t.settings.volume),
            Obx(
              () => Slider(
                value: controller.volumeValue(),
                onChanged: (value) => {controller.volumeValue(value)},
              ),
            ),
            Text(t.settings.languag),
            SizedBox(
              height: 60,
              child: LanguagToggle(),
            )
          ],
        ),
      ),
    );
  }
}
