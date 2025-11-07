import 'package:flutter/material.dart';
import 'package:my_learning_app/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'providers/locale_provider.dart';
import 'providers/xp_provider.dart';
import 'utils/galaxy_pink_theme.dart';
import 'l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => XPProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final lp = Provider.of<LocaleProvider>(context);
    final xp = Provider.of<XPProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Galaxy Flashcard',
      theme: GalaxyPinkTheme.getTheme(xp.palette),
      locale: lp.locale,
      supportedLocales: const [Locale('en'), Locale('vi')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const MainScreen(),
    );
  }
}
