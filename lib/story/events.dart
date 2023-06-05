

import 'package:thelastlife/story/actions.dart';

import '../controllers/game.dart';

var allEvents = [
      Event(id: 1, name: 'test', description:  'hi', actions: [
        allActions.firstWhere((element) => element.id == 0),
        allActions.firstWhere((element) => element.id == 1),
        allActions.firstWhere((element) => element.id == 2)
      ], )
];
