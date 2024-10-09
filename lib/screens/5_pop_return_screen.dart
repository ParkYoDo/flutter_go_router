import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/layout/default_layout.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(
      children: [
        ElevatedButton(
            onPressed: () {
              context.pop('code factory');
            },
            child: const Text('pop'))
      ],
    ));
  }
}
