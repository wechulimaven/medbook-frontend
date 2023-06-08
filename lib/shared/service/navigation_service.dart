import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  Future<Object?> navigateTo(String routeName,
      {bool clearBackStack = false}) async {
    Object? _pop;
    if (clearBackStack) {
      _pop = await navigatorKey.currentState
          ?.pushNamedAndRemoveUntil('routeName', (route) => false);
    } else {
      _pop = await navigatorKey.currentState?.pushNamed(routeName);
    }

    return _pop;
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}
