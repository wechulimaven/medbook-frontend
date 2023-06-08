import 'package:fimber/fimber.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:medbook_dev_frontend/utils/app_focus_helper.dart';
import 'package:medbook_dev_frontend/utils/bloc_observer.dart';

import 'core/bloc/signup/signup_cubit.dart';
import 'core/di/injector.dart';
import 'generated/l10n.dart';
import 'screens/signup_patient_screen.dart';
import 'shared/routers/app_router.dart';
import 'theme/themes.dart';

void _initBlocObserver() {
  BlocOverrides.runZoned(
    () {
      runApp(
        const RootApp(),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

void _initFimber() {
  Fimber.plantTree(DebugTree(useColors: true));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  _initFimber();
  _initBlocObserver();
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    // _appRouter ??= appRouter(data);
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupCubit>(create: (ctx) {
          return inject.get<SignupCubit>();
        }),
      ],
      child: GestureDetector(
          onTap: () {
            // Tap anywhere to dismiss soft keyboard.
            AppFocusHelper.instance.requestUnfocus();
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,

            routes: routes,
            navigatorKey: navigationKey,
            supportedLocales: Lang.delegate.supportedLocales,
            // supportedLocales: const [
            //   Locale('en', 'US'),
            // ],
            localizationsDelegates: const [
              Lang.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            // locale: provider.locale,
            initialRoute: LoginScreen.routeName,
            onGenerateTitle: (context) => Lang.of(context).appTitle,
            theme: AppThemeData.instance.light(),
            darkTheme: AppThemeData.instance.dark(),
            // themeMode: provider.themeMode,
            // locale: const Locale("en-US"),
          )),
    );
  }
}
