import 'package:bloc_blog/presentation/pages/home/home.dart';
import 'package:bloc_blog/presentation/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginPage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
      ],
    ),
  ],
);

GoRouter get GoMainRouter => _router;
