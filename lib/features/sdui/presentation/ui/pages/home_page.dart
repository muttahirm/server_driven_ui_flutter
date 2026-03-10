import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_driven_ui_flutter/features/sdui/presentation/renderer/widget_renderer.dart';
import 'package:server_driven_ui_flutter/features/sdui/presentation/state_management/sdui_bloc/sdui_bloc.dart';

class HomePage extends StatelessWidget {
  final String screenName;

  const HomePage({super.key, required this.screenName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          context.read<SduiBloc>()..add(LoadScreenEvent(screenName)),
      child: Scaffold(
        appBar: AppBar(title: Text(screenName)),
        body: BlocBuilder<SduiBloc, SduiState>(
          builder: (context, state) {
            if (state is SduiLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SduiError) {
              return Center(child: Text(state.message));
            }

            if (state is SduiLoaded) {
              return ListView(
                padding: const EdgeInsets.all(8),
                children: state.screen.widgets
                    .map((widget) => WidgetRenderer.render(context, widget))
                    .toList(),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
