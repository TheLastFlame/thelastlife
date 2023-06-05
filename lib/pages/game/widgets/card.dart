import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameCard extends StatelessWidget {
  const GameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // width: context.width * 0.5,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Card(
            elevation: 5,
            // padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
