import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thelastlife/pages/home.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return NoTransitionPage<void>(
          key: state.pageKey,
          child: const Homepage(),
        );
      },
      routes: [],
    ),
  ],
);
