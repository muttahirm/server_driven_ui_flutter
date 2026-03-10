import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/action_entity.dart';

class ActionHandler {
  static void handle(BuildContext context, ActionEntity? action) {
    if (action == null) return;

    switch (action.type) {
      case 'navigate':
        final route = action.route;
        if (route != null && route.isNotEmpty) {
          context.push(route);
        }
        break;
      default:
        debugPrint('Unknown action type: ${action.type}');
    }
  }
}
