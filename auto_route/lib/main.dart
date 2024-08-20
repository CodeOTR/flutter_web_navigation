import 'package:auto_route/auto_route.dart';
import 'package:auto_route_navigation/router.dart';
import 'package:auto_route_navigation/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(
          navigatorObservers: () => [
                AutoRouteObserver(),
                // MyObserver(),
              ]),
    );
  }
}

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pushRoute(const ScreenOneRoute());
                },
                child: const Text('Screen One'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.pushRoute(const ScreenTwoRoute());
                },
                child: const Text('Screen Two'),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class MyObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}
