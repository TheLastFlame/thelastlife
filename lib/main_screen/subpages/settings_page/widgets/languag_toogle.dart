import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class LanguagToggle extends GetView<void> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: AspectRatio(
              aspectRatio: 3 / 2,
              child: SvgPicture.asset(
                "assets/icons/flags/svg/ru.svg",
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
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
