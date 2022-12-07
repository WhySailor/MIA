import 'package:flutter/material.dart';
import 'package:mia/screens/tabs_screen.dart';
import 'package:mia/services/app_router.dart';
import 'package:mia/services/dark_theme.dart';
import './blocs/blocs.dart';

import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TasksBloc()),
          BlocProvider(create: (context) => ThemeSwitchBloc()),
          BlocProvider(create: (context) => MiaBloc()),
          BlocProvider(create: (context) => AnimsBloc()),
        ],
        child: BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Bloc Pattern - Todo',
              theme: state.switchValue
                  ? AppThemes.appThemeData[AppTheme.darkTheme]
                  : AppThemes.appThemeData[AppTheme.lightTheme],
              home: const TabsScreen(),
              onGenerateRoute: appRouter.onGenerateRoute,
            );
          },
        ));
  }
}
