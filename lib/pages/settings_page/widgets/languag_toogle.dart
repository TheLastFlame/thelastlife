import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

import '../../../constants.dart';
import '../../../controllers/settings_controller.dart';
import '../../../i18n/strings.g.dart';

class LanguagToggle extends GetView<SettingsContoller> {
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Expanded(
    //       child: AspectRatio(
    //         aspectRatio: 5 / 4,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             AspectRatio(
    //               aspectRatio: 2 / 1,
    //               child: InkResponse(
    //                 // containedInkWell: true,
    //                 radius: 0,
    //                 onTap: () {
    //                   // controller.isStaticColor(false);
    //                 },
    //                 child: Obx(
    //                   () => Card(
    //                     color: (controller.locale() == "ru"
    //                         ? Theme.of(context).colorScheme.primary
    //                         : Theme.of(context).colorScheme.background),
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius:
    //                           BorderRadius.circular(appRoundRadiusSmall),
    //                     ),
    //                     child: SvgPicture.asset(
                            
    //                         "assets/icons/flags/svg/ru.svg",
                              
    //                       ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Text(t.settings.russian),
    //           ],
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       child: AspectRatio(
    //         aspectRatio: 5 / 4,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             AspectRatio(
    //               aspectRatio: 2 / 1,
    //               child: InkResponse(
    //                 radius: 0,
    //                 onTap: () {
    //                   // controller.isStaticColor(true);
    //                 },
    //                 child: Obx(
    //                   () => Card(
    //                     color: (controller.locale() == "en"
    //                         ? Theme.of(context).colorScheme.primary
    //                         : Theme.of(context).colorScheme.background),
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius:
    //                           BorderRadius.circular(appRoundRadiusSmall),
    //                     ),
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(appPadding),
    //                       child: SvgPicture.asset(
                            
    //                         "assets/icons/flags/svg/us.svg",
    //                           width: 40,
                          
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Text(t.settings.english),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );

    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.setLocale("ru");
              Restart.restartApp();
            },
            icon: AspectRatio(
              aspectRatio: 3 / 2,
              child: SvgPicture.asset(
                "assets/icons/flags/svg/ru.svg",
              ),
            ),
          ),
          IconButton(
            onPressed: () {
               controller.setLocale("en");
               Restart.restartApp();
            },
            icon: AspectRatio(
              aspectRatio: 3 / 2,
              child: SvgPicture.asset(
                "assets/icons/flags/svg/us.svg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
