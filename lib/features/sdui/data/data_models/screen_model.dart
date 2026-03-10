import '../../domain/entities/screen_entity.dart';
import 'widget_model.dart';

class ScreenModel extends ScreenEntity {
  const ScreenModel({
    required super.id,
    required super.title,
    required super.widgets,
  });

  factory ScreenModel.fromJson(Map<String, dynamic> json) {
    return ScreenModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      widgets: (json['widgets'] as List? ?? [])
          .map((e) => WidgetModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );
  }
}
