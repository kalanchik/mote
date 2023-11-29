import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mote_app/firebase_options.dart';
import 'package:mote_app/models/register_user.dart';
import 'package:mote_app/router/router.dart';
import 'package:mote_app/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.I.registerSingleton(RegisterUser());
  GetIt.I.registerSingleton(Dio());
  runApp(const MoteApp());
}

class MoteApp extends StatefulWidget {
  const MoteApp({super.key});

  @override
  State<MoteApp> createState() => _MoteAppState();
}

class _MoteAppState extends State<MoteApp> {
  final AppRouter router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ru', 'RU'),
      ],
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router.config(),
    );
  }
}
