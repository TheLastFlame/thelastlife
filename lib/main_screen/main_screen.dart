import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants.dart';
import '../controllers/audio/audio_contoller.dart';
import '../controllers/audio/sfx.dart';
import '../i18n/strings.g.dart';

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
                borderRadius: BorderRadius.all(Radius.circular(appRoundRadius)),
                color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
              ),
            ),
          ),
          // Buttons
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: appElevationButtonStyle,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(t.mainScreen.play)),
                  ),
                  onPressed: () {
                    AudioController.playSfx(SfxType.buttonClick);
                    context.push("/game");
                  },
                ),
                ElevatedButton(
                  style: appElevationButtonStyle,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(t.mainScreen.setting)),
                  ),
                  onPressed: () {
                    AudioController.playSfx(SfxType.buttonClick);
                    context.push("/mainMenu/settings");
                  },
                ),
                ElevatedButton(
                  style: appElevationButtonStyle,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(t.mainScreen.achievements)),
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
          const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Credits"),
                ],
              ))
        ],
      ),
    );
  }
}
