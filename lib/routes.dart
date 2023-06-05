import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thelastlife/pages/game/main.dart';
import 'package:thelastlife/pages/home.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'pages/main_menu/main_menu.dart';
import 'pages/achievements_page/achievements_page.dart';
import 'pages/settings_page/settings_page.dart';
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
            child: LifePage(),
          ), 
        )
      
      ],
    ),
  ],
);
