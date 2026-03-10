import 'package:flutter/material.dart';

import '../../domain/entities/widget_entity.dart';
import 'action_handler.dart';

class WidgetRenderer {
  static Widget render(BuildContext context, WidgetEntity config) {
    switch (config.type) {
      case 'text':
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            config.data?['value']?.toString() ?? '',
            style: const TextStyle(fontSize: 18),
          ),
        );

      case 'button':
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () => ActionHandler.handle(context, config.action),
            child: Text(config.data?['label']?.toString() ?? 'Button'),
          ),
        );

      case 'column':
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (config.children ?? [])
                .map((child) => render(context, child))
                .toList(),
          ),
        );

      case 'card':
        return Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (config.children ?? [])
                  .map((child) => render(context, child))
                  .toList(),
            ),
          ),
        );

      case 'spacer':
        return SizedBox(
          height: (config.data?['height'] as num?)?.toDouble() ?? 12,
        );

      default:
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Unsupported widget: ${config.type}'),
        );
    }
  }
}
