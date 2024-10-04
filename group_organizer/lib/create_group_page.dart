// home_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Create group page',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
