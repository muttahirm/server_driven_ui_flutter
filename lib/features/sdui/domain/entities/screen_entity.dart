import 'widget_entity.dart';

class ScreenEntity {
  final String id;
  final String title;
  final List<WidgetEntity> widgets;

  const ScreenEntity({
    required this.id,
    required this.title,
    required this.widgets,
  });
}
