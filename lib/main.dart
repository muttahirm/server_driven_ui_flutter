import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_driven_ui_flutter/features/sdui/presentation/state_management/sdui_bloc/sdui_bloc.dart';

import 'core/router/app_router.dart';
import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: Injection.repository,
      child: BlocProvider<SduiBloc>.value(
        value: Injection.sduiBloc,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Server Driven UI',
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
