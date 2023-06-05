import 'package:thelastlife/story/actions.dart';

import '../controllers/game.dart';

var allEvents = [
  Event(
    id: 0,
    name: 'Вы родились!',
    description:
        'О дивный новый мир... Прекрасное место, чтобы поспать. Не правда ли?',
    actions: [
      allActions.firstWhere((element) => element.id == 0),
      allActions.firstWhere((element) => element.id == 1),
      allActions.firstWhere((element) => element.id == 2)
    ],
  ),
  Event(
    id: 1,
    name: 'Слайд 2!',
    description:
        'ня',
    actions: [
      allActions.firstWhere((element) => element.id == 0),
      allActions.firstWhere((element) => element.id == 1),
      allActions.firstWhere((element) => element.id == 2)
    ],
  ),
];
