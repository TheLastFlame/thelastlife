import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thelastlife/pages/game/widgets/card.dart';

class LifePage extends StatelessWidget {
  const LifePage({super.key});

  @override
  Widget build(BuildContext context) {
    var horizontalCardScroll = 10000.0.obs;
    var verticalCardScroll = 0.0.obs;
    var horizontalCardControl = CarouselController();
    var eventCardKey = GlobalKey();
    var eventTextKey = GlobalKey();

    return SafeArea(
      child: Container(
        color: context.theme.colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              color: context.theme.colorScheme.primaryContainer,
              child: SizedBox(
                height: 80,
                child: Row(),
              ),
            ),
            Center(child: EventText(key: eventTextKey)),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                    height: context.height * 0.55,
                    child: EventCard(
                      key: eventCardKey,
                    ),
                  ),
                  CarouselSlider.builder(
                      itemCount: 10,
                      options: CarouselOptions(
                          // viewportFraction: 0.5,
                          onScrolled: (value) => horizontalCardScroll(value),
                          height: context.height * 1.1),
                      itemBuilder: (context, index, realIndex) {
                        return CarouselSlider(
                          disableGesture: true,
                          options: CarouselOptions(
                              onScrolled: (value) => verticalCardScroll(value),
                              padEnds: false,
                              viewportFraction: 0.75,
                              enableInfiniteScroll: false,
                              scrollDirection: Axis.vertical),
                          items: [
                            SizedBox(
                              height: context.height * 0.55,
                            ),
                            OverflowBox(
                              maxHeight: context.width * 0.8 / 2 * 3,
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  Obx(() => Padding(
                                    padding: EdgeInsets.only(top: 32 * (realIndex-horizontalCardScroll()).abs(),),
                                    child: Card(
                                          color: Colors.red,
                                          child: Container(
                                            width: lerp(context.width, context.height * 0.55 / 3 * 2, verticalCardScroll()),
                                            height: lerp(
                                                context.width * 0.8 / 2 * 3,
                                                context.height * 0.55,
                                                verticalCardScroll()),
                                          ),
                                        ),
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
        color: Colors.indigo,
      ),
    );
  }
}
