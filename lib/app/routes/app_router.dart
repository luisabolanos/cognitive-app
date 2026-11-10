import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'route_names.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Login Page'))),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Register Page'))),
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Home Page'))),
      ),
      GoRoute(
        path: RouteNames.exercises,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Exercises Page'))),
      ),
      GoRoute(
        path: RouteNames.exerciseDetail,
        builder: (context, state) => Scaffold(body: Center(child: Text('Exercise Detail: ${state.pathParameters['id']}'))),
      ),
      GoRoute(
        path: RouteNames.game,
        builder: (context, state) => Scaffold(body: Center(child: Text('Game: ${state.pathParameters['id']}'))),
      ),
      GoRoute(
        path: RouteNames.profile,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Profile Page'))),
      ),
      GoRoute(
        path: RouteNames.progress,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Progress Page'))),
      ),
      GoRoute(
        path: RouteNames.ranking,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Ranking Page'))),
      ),
      GoRoute(
        path: RouteNames.settings,
        builder: (context, state) => const Scaffold(body: Center(child: Text('Settings Page'))),
      ),
    ],
  );
});
