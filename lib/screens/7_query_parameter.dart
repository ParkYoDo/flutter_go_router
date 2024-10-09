import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/layout/default_layout.dart';

class QueryParameterScreen extends StatelessWidget {
  const QueryParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        Text(GoRouterState.of(context).uri.queryParameters.toString()),
        ElevatedButton(
            onPressed: () {
              context.push(Uri(
                  path: '/query_param',
                  queryParameters: {'name': 'tex', "AGE": "AGE"}).toString());
            },
            child: const Text("Query Paramter"))
      ],
    ));
  }
}
