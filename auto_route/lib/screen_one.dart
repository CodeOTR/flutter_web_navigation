import 'package:auto_route/auto_route.dart';
import 'package:auto_route_navigation/router.dart';
import 'package:auto_route_navigation/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScreenOneView extends StatefulWidget {
  const ScreenOneView({super.key});

  @override
  State<ScreenOneView> createState() => _ScreenOneViewState();
}

class _ScreenOneViewState extends State<ScreenOneView> {
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
              router.pushAll([
                ScreenTwoRoute(),
              ]);
            },
            child: const Text('Screen Two'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              if (router.canPop()) {
                router.maybePop();
              } else {
                router.navigate(const HomeRoute());
              }
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
