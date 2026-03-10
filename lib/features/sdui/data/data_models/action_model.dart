import 'package:server_driven_ui_flutter/features/sdui/domain/entities/action_entity.dart';

class ActionModel extends ActionEntity {
  const ActionModel({required super.type, String? route, String? url});

  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
      type: json['type'] as String,
      route: json['route'] as String?,
      url: json['url'] as String?,
    );
  }
}
