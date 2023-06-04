import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'main_screen/main_screen.dart';
import 'main_screen/subpages/achievements_page/achievements_page.dart';
import 'main_screen/subpages/settings_page/settings_page.dart';
import 'style/transion.dart';

final router = GoRouter(
  initialLocation: "/mainMenu",
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: SafeArea(child: child),
        );
      },
      routes: [
        GoRoute(
          path: "/mainMenu",
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: MainMenu(),
          ),
          routes: [
            GoRoute(
              path: "settings",
              pageBuilder: (context, state) => buildMyTransition<void>(
                key: state.pageKey,
                child: SettingsPage(),
                color: Theme.of(context).colorScheme.background,
              ),
            ),
            GoRoute(
              path: "achievements",
              pageBuilder: (context, state) => buildMyTransition<void>(
                key: state.pageKey,
                child: AchievementsPage(),
                color: Theme.of(context).colorScheme.background,
                direction: 1,
              ),
            ),
          ],
        ),

        GoRoute(path: "/game", 
        pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: Placeholder(),
          ), 
        )
      
      ],
    ),
  ],
);
