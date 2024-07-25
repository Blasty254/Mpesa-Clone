import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tollo_on_flutter/Authenticate/loginScreen.dart';
import 'package:tollo_on_flutter/SplashActivity/Splashscreen.dart';
import 'package:tollo_on_flutter/UI/homePage.dart';
import 'package:tollo_on_flutter/UI/statements.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splashscreen',
  routes: [
    GoRoute(
      path: '/splashscreen',
      builder: (BuildContext context, GoRouterState state) {
        return const splashscreen();
      },
    ),
    GoRoute(
      path: '/homepage',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/statements',
      builder: (BuildContext context, GoRouterState state) {
        return const Statements();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
  ],
);
