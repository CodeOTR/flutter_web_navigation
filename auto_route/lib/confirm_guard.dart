import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ConfirmGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    BuildContext? context = router.navigatorKey.currentContext;

    if (context == null) {
      resolver.next(true);
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Navigation'),
          content: const Text('Do you really want to enter this page?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                resolver.next(false); // Cancel navigation
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                resolver.next(true); // Confirm navigation
              },
            ),
          ],
        );
      },
    );
  }
}
