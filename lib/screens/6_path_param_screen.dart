import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/layout/default_layout.dart';

class PathParamScreen extends StatelessWidget {
  const PathParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        Text(GoRouterState.of(context).pathParameters.toString()),
        ElevatedButton(
            onPressed: () {
              context.go('/path_param/asdasd/kllll');
            },
            child: const Text('Path Param'))
      ],
    ));
  }
}
