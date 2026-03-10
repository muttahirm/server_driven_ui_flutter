import 'action_entity.dart';

class WidgetEntity {
  final String type;
  final Map<String, dynamic>? data;
  final List<WidgetEntity>? children;
  final ActionEntity? action;

  WidgetEntity({required this.type, this.data, this.children, this.action});
}
