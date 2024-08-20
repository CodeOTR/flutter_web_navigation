import 'package:flutter/material.dart';
import 'package:flutter_web_navigation/main.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

Future<void> onPopState(dynamic event) async {
  if (router.routerDelegate.navigatorKey.currentContext == null) {
    return;
  }

  try {
    BuildContext context = router.routerDelegate.navigatorKey.currentContext!;
    debugPrint('popstate event: $event');
    window.history.pushState(null, document.title, window.location.href);
    debugPrint('window.location.href: ${window.location.href}');
    await showDialog(
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
                      onPressed: () async {
                        Navigator.of(context).pop();

                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        } else {
                          context.pop();
                        }
                      },
                      child: const Text('Yes, Start Over'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.pop();
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
    );
  } catch (e) {
    debugPrint('error: $e');
  }
}

class _ScreenTwoState extends State<ScreenTwo> {
  final Function(Event) _onPopState = onPopState;

  @override
  void dispose() {
    debugPrint('dispose');
    window.removeEventListener('popstate', _onPopState);
    super.dispose();
  }

  @override
  void initState() {
    debugPrint('initState');
    window.history.pushState(null, document.title, window.location.href);
    window.addEventListener('popstate', _onPopState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen_two'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
