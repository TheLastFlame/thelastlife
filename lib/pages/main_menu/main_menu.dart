import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';
import '../../controllers/audio/audio_contoller.dart';
import '../../controllers/audio/sfx.dart';
import '../../i18n/strings.g.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LOGO
          Expanded(
            flex: 5,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(
                    Radius.circular(appRoundRadius),
                  ),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.blue,
                      Colors.red,
                    ],
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/icons/logo.svg",
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
          ),
          // Buttons
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                ElevatedButton(
                  style: appElevationButtonStyle,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(t.mainMenu.play)),
                  ),
                  onPressed: () {
                    AudioController.playSfx(SfxType.buttonClick);
                    context.push("/game");
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  style: appElevationButtonStyle,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(t.mainMenu.setting)),
                  ),
                  onPressed: () {
                    AudioController.playSfx(SfxType.buttonClick);
                    context.push("/mainMenu/settings");
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  style: appElevationButtonStyle,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(t.mainMenu.achievements)),
                  ),
                  onPressed: () {
                    AudioController.playSfx(SfxType.buttonClick);
                    context.push("/mainMenu/achievements");
                  },
                ),
              ],
            ),
          ),
          // Credits
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Text(
                      "${t.mainMenu.nowPlaying}:  ${AudioController.nowPlayng()}")),
                ],
              ))
        ],
      ),
    );
  }
}
