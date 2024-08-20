import 'package:flutter/material.dart';
import 'package:flutter_web_navigation/screen_one.dart';
import 'package:flutter_web_navigation/screen_two.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

void main() {
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(const MainApp());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/screen_one',
      builder: (context, state) => const ScreenOne(),
      onExit: (context, state) async {
        bool confirm = await showDialog<bool>(
              context: context,
              builder: (context) {
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: Dialog(
                      backgroundColor: Colors.blue.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Center(
                              child: Text(
                                'Go Back?',
                                style: TextStyle(
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text('Yes, Start Over'),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('No, Cancel'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ) ??
            false;

        return confirm;
      },
    ),
    GoRoute(
      path: '/screen_two',
      builder: (context, state) => const ScreenTwo(),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

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
                  context.push('/screen_one');
                },
                child: const Text('Screen One'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  context.push('/screen_two');
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
