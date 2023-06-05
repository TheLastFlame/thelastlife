import 'dart:math';

import 'package:get/get.dart';
import 'package:thelastlife/story/events.dart';

class GameSession extends GetxService {
  var intelligence = 0.obs, health = 0.obs, mental = 0.obs;
  var events = <Event>[].obs;
  var Conditions = <Condition>[].obs;

  @override
  void onInit() {
    intelligence.value = Random().nextInt(100);
    health.value = Random().nextInt(100);
    mental.value = Random().nextInt(100);

    events.add(allEvents[0]);

    super.onInit();
  }
}

class Event {
  late int id;
  var name = '', description = '';
  List<String>? conditions;
  var actions = <ActionModel>[];

  Event({
    required this.id,
    required this.name,
    required this.description,
    this.conditions,
    required this.actions,
  });
}

class ActionModel {
  int id;
  int addEventId;
  String name;
  String? description;
  List<String>? conditions;

  ActionModel({
    required this.id,
    required this.addEventId,
    required this.name,
    this.description,
    this.conditions,
  });
}

class Conditions {
  var intelligence = 0.obs, health = 0.obs, mental = 0.obs;
}
