import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tollo_on_flutter/Authenticate/loginScreen.dart';
import 'package:tollo_on_flutter/Providers/auth_provider.dart';
import 'package:tollo_on_flutter/SplashActivity/Splashscreen.dart';
import 'package:tollo_on_flutter/UI/SendMoney/selectContact.dart';
import 'package:tollo_on_flutter/UI/homePage.dart';
import 'package:tollo_on_flutter/UI/statements.dart';

final routerNotifierProvider =
    StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier(FirebaseAuth.instance);
});

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
    GoRoute(
      path: '/SelectContact',
      builder: (BuildContext context, GoRouterState state) {
        return const SelectContact();
      },
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) {
    final container = ProviderScope.containerOf(context);
    final user = container.read(authNotifierProvider);
    final isLoggedIn = user != null;
    final isLoggingIn = state.uri.toString() == '/login';
    final isSplashScreen = state.uri.toString() == '/splashscreen';

    if (!isLoggedIn && !isLoggingIn && !isSplashScreen) {
      return '/login';
    }

    if (isLoggedIn && (isLoggingIn || isSplashScreen)) {
      return '/homepage';
    }

    return null;
  },
);
