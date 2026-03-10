import 'action_model.dart';
import 'package:server_driven_ui_flutter/features/sdui/domain/entities/widget_entity.dart';

class WidgetModel extends WidgetEntity {
  WidgetModel({required super.type, super.data, super.children, super.action});

  factory WidgetModel.fromJson(Map<String, dynamic> json) {
    return WidgetModel(
      type: json['type'] as String? ?? 'unkown',
      data: json['data'] != null
          ? Map<String, dynamic>.from(json['data'] as Map<String, dynamic>)
          : null,
      children: json['children'] != null
          ? (json['children'] as List<dynamic>)
                .map(
                  (child) => WidgetModel.fromJson(
                    Map<String, dynamic>.from(child as Map),
                  ),
                )
                .toList()
          : null,
      action: json['action'] != null
          ? ActionModel.fromJson(
              Map<String, dynamic>.from(json['action'] as Map),
            )
          : null,
    );
  }
}
