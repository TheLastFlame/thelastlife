import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:thelastlife/constants.dart';
import 'package:thelastlife/pages/achievements_page/widgets/achievement_card.dart';

import '../../i18n/strings.g.dart';

class AchievementsPage extends GetView<void> {
  final ScrollController achievementsListScrollController = ScrollController();

  

  @override
  Widget build(BuildContext context) {
      
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 10) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: buildTitle(context),
        body: Padding(
          padding: const EdgeInsets.only(left: appPadding , right: appPadding),
          child: ListView(
            physics: ClampingScrollPhysics(),
            controller: achievementsListScrollController,
            children: [
              AchievementCard(),
              AchievementCard(),
              AchievementCard(),
              AchievementCard(),
              AchievementCard(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildTitle(BuildContext context) {
    return AppBar(
      title: Text(
        t.achievmentsPage.title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
