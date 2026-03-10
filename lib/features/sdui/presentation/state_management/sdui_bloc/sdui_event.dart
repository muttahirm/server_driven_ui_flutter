part of 'sdui_bloc.dart';

abstract class SduiEvent {
  const SduiEvent();
}

class LoadScreenEvent extends SduiEvent {
  final String screenName;
  const LoadScreenEvent(this.screenName);
}
