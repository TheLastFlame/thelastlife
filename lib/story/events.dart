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
  Event(
    id: 2,
    name: 'Пара',
    description: 'У вас сейчас проходит занятие',
    actions: [
      allActions.firstWhere((element) => element.id == 3),
      allActions.firstWhere((element) => element.id == 4),
    ],
  ),
  Event(
    id: 3,
    name: 'Свободное время',
    description: 'Хмм появилось свободное время',
    actions: [
      allActions.firstWhere((element) => element.id == 5),
      allActions.firstWhere((element) => element.id == 6),
    ],
  ),
  Event(
    id: 4,
    name: 'Домашнее задание',
    description: 'Кажется вас задали домашнее задание в универе',
    actions: [
      allActions.firstWhere((element) => element.id == 7),
      allActions.firstWhere((element) => element.id == 8),
    ],
  ),
  Event(
    id: 5,
    name: 'Контрольная работа',
    description: 'Скоро будет контрольная работа',
    actions: [
      allActions.firstWhere((element) => element.id == 9),
      allActions.firstWhere((element) => element.id == 10),
      allActions.firstWhere((element) => element.id == 11),
    ],
  ),
];
