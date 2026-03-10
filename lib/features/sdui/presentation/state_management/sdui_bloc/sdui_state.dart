part of 'sdui_bloc.dart';

abstract class SduiState {
  const SduiState();
}

class SduiInitial extends SduiState {
  const SduiInitial();
}

class SduiLoading extends SduiState {
  const SduiLoading();
}

class SduiLoaded extends SduiState {
  final ScreenEntity screen;
  const SduiLoaded(this.screen);
}

class SduiError extends SduiState {
  final String message;
  const SduiError(this.message);
}
