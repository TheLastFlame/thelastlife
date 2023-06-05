import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../i18n/strings.g.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
            context.push('/game');
        }, child: Text(t.common.loading)),
      ),
    );
  }
}
