import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thelastlife/controllers/game.dart';

var horizontalCardScroll = 10000.0.obs;
var verticalCardScroll = 0.0.obs;
var eventCardKey = GlobalKey();
var eventTextKey = GlobalKey();

class LifePage extends StatelessWidget {
  const LifePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GameSession());

    return SafeArea(
      child: Container(
        color: context.theme.colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: context.theme.colorScheme.secondaryContainer,
              child: SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.menu_book_rounded),
                            Text(controller.intelligence.toString()),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.monitor_heart_outlined),
                            Text(controller.health.toString()),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.smart_toy_sharp),
                            Text(controller.mental.toString()),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(child: EventText(key: eventTextKey)),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    height: context.height * 0.5,
                    child: EventCard(
                      key: eventCardKey,
                    ),
                  ),
                  CarouselSlider.builder(
                      itemCount: controller.events.length,
                      options: CarouselOptions(
                          // viewportFraction: 0.5,
                          enableInfiniteScroll: false,
                          onScrolled: (value) => horizontalCardScroll(value),
                          height: context.height * 1.1),
                      itemBuilder: (context, index, realIndex) {
                        return CarouselSlider(
                          disableGesture: true,
                          options: CarouselOptions(
                              onScrolled: (value) => verticalCardScroll(value),
                              padEnds: false,
                              // viewportFraction: 0.75,
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.vertical),
                          items: [
                            SizedBox(
                              height: context.height * 0.5,
                            ),
                            OverflowBox(
                              maxHeight: context.width * 0.8 / 2 * 3,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Obx(() => Padding(
                                        padding: EdgeInsets.only(
                                          top: 32 *
                                              (realIndex -
                                                      horizontalCardScroll())
                                                  .abs(),
                                        ),
                                        child: ActionCard(index),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.55,
                            ),
                          ],
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double lerp(double start, double end, double progress) {
  return start + (end - start) * progress;
}

class EventText extends StatelessWidget {
  const EventText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Тут какое-то очень длинное описание карточки',
          style: context.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Card(
        color: context.theme.colorScheme.secondaryContainer,
        child: Card(
          elevation: 0,
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final int index;
  const ActionCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      transform: Matrix4.rotationZ( (index - horizontalCardScroll()) * 0.3),
      child: Card(
            elevation: 4,
            color: context.theme.colorScheme.secondaryContainer,
            child: SizedBox(
              width: lerp(context.width, context.height * 0.5 / 3 * 2,
                  verticalCardScroll()),
              height: lerp(context.width * 0.8 / 2 * 3, context.height * 0.5,
                  verticalCardScroll()),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'А тут что-то вроде действий xD',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
    ));
  }
}
