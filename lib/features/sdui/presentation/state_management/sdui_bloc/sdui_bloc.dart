import 'package:bloc/bloc.dart';
import 'package:server_driven_ui_flutter/features/sdui/domain/entities/screen_entity.dart';
import 'package:server_driven_ui_flutter/features/sdui/domain/usercases/get_screen_usecase.dart';

part 'sdui_event.dart';
part 'sdui_state.dart';

class SduiBloc extends Bloc<SduiEvent, SduiState> {
  final GetScreenUseCase getScreenUseCase;

  SduiBloc(this.getScreenUseCase) : super(const SduiInitial()) {
    on<LoadScreenEvent>(_onLoadScreen);
  }

  Future<void> _onLoadScreen(
    LoadScreenEvent event,
    Emitter<SduiState> emit,
  ) async {
    emit(const SduiLoading());

    final result = await getScreenUseCase(event.screenName);

    result.fold(
      (failure) => emit(SduiError(failure.message)),
      (screen) => emit(SduiLoaded(screen)),
    );
  }
}
