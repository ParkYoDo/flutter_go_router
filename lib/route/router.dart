import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/screens/10_transition_screen_1.dart';
import 'package:go_router_project/screens/10_transition_screen_2.dart';
import 'package:go_router_project/screens/11_error_screen.dart';
import 'package:go_router_project/screens/1_basic_screen.dart';
import 'package:go_router_project/screens/2_named_screen.dart';
import 'package:go_router_project/screens/3_push_screen.dart';
import 'package:go_router_project/screens/4_pop_base_screen.dart';
import 'package:go_router_project/screens/5_pop_return_screen.dart';
import 'package:go_router_project/screens/6_path_param_screen.dart';
import 'package:go_router_project/screens/7_query_parameter.dart';
import 'package:go_router_project/screens/8_nested_child_screen.dart';
import 'package:go_router_project/screens/8_nested_screen.dart';
import 'package:go_router_project/screens/9_login_screen.dart';
import 'package:go_router_project/screens/9_private_screen.dart';
import 'package:go_router_project/screens/root_screen.dart';

// 로그인 여부
bool authState = false;

// "https://blog.codefactory.ai" => "/" : path
final router = GoRouter(
    redirect: (context, state) {
      // return String : 해당 라우트로 이동 (path)
      // return null : 원래 이동하려던 라우트로 이동
      if (state.uri.toString() == '/login/private' && !authState) {
        return '/login';
      }
      return null;
    },
    errorBuilder: (context, state) =>
        ErrorScreen(error: state.error.toString()),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return const RootScreen();
          },
          routes: [
            GoRoute(
              path: 'basic',
              builder: (context, state) => const BasicScreen(),
            ),
            GoRoute(
              path: 'named', // go
              name: 'named_screen', // goNamed
              builder: (context, state) => const NamedScreen(),
            ),
            GoRoute(
              path: 'push',
              builder: (context, state) => const PushScreen(),
            ),
            GoRoute(
                path: 'pop',
                builder: (context, state) => const PopBaseScreen(),
                routes: [
                  GoRoute(
                      path: 'return',
                      builder: (context, state) => const PopReturnScreen())
                ]),
            GoRoute(
                path: 'path_param/:id',
                builder: (context, state) => const PathParamScreen(),
                routes: [
                  GoRoute(
                    path: ':name',
                    builder: (context, state) => const PathParamScreen(),
                  ),
                ]),
            GoRoute(
              path: 'query_param',
              builder: (context, state) => const QueryParameterScreen(),
            ),
            // ShellRoute는 path가 없음
            ShellRoute(
                builder: (context, state, child) => NestedScreen(child: child),
                routes: [
                  // /nest/a
                  GoRoute(
                    path: 'nested/a',
                    builder: (_, state) =>
                        const NestedChildScreen(routeName: 'nested/a'),
                  ),
                  // /nest/b
                  GoRoute(
                    path: 'nested/b',
                    builder: (_, state) =>
                        const NestedChildScreen(routeName: 'nested/b'),
                  ),
                  // /nest/c
                  GoRoute(
                    path: 'nested/c',
                    builder: (_, state) =>
                        const NestedChildScreen(routeName: 'nested/c'),
                  ),
                ]),
            GoRoute(
                path: 'login',
                builder: (context, state) => const LoginScreen(),
                routes: [
                  GoRoute(
                      path: 'private',
                      builder: (context, state) => const PrivateScreen())
                ]),
            GoRoute(
                path: 'login2',
                builder: (context, state) => const LoginScreen(),
                routes: [
                  GoRoute(
                    path: 'private',
                    builder: (context, state) => const PrivateScreen(),
                    redirect: (context, state) {
                      if (!authState) {
                        return '/login2';
                      }
                      return null;
                    },
                  ),
                ]),
            GoRoute(
                path: 'transition',
                builder: (context, state) => const TransitionScreenOne(),
                routes: [
                  GoRoute(
                      path: 'detail',
                      // builder: (context, state) => const TransitionScreenTwo(),
                      pageBuilder: (_, state) => CustomTransitionPage(
                            transitionDuration: const Duration(seconds: 3),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );

                              // return ScaleTransition(
                              //   scale: animation,
                              //   child: child,
                              // );

                              // return RotationTransition(
                              //   turns: animation,
                              //   child: child,
                              // );
                            },
                            child: const TransitionScreenTwo(),
                          ))
                ]),
          ]),
    ]);
