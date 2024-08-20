import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('screen_one'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.push('/screen_two');
            },
            child: const Text('Screen Two'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/');
              }
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
