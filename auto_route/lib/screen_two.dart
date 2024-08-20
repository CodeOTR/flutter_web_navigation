import 'package:auto_route/auto_route.dart';
import 'package:auto_route_navigation/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ScreenTwoView extends StatefulWidget {
  const ScreenTwoView({super.key});

  @override
  State<ScreenTwoView> createState() => _ScreenTwoViewState();
}

class _ScreenTwoViewState extends State<ScreenTwoView> with AutoRouteAwareStateMixin<ScreenTwoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('screen_two'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.pushRoute(const ScreenOneRoute());
            },
            child: const Text('Screen One'),
          ),
        ],
      ),
    );
  }

  @override
  void didPush() {
    debugPrint('ScreenTwoView didPush');
    super.didPush();
  }

  @override
  void didPop() {
    debugPrint('ScreenTwoView didPop');
    super.didPop();
  }

  @override
  void didPushNext() {
    debugPrint('ScreenTwoView didPushNext');
    super.didPushNext();
  }

  @override
  void didPopNext() {
    debugPrint('ScreenTwoView didPopNext');
    super.didPopNext();
  }
}
