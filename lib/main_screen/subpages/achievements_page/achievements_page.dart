import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AchievementsPage extends GetView<void> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dy > 10) {
          context.pop();
        }
      },
      child: Container(
        color: Colors.transparent,
        child: const Placeholder(),
      ),
    );
  }
}
