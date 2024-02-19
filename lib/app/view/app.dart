import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/clones/instagram_page.dart';
import 'package:my_flutter_gallery/clones/perplexity_page.dart';
import 'package:my_flutter_gallery/clones/supernotes_page.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:my_flutter_gallery/launchpad/launchpad_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00ff00),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (_) => const LaunchpadPage(),
        '/insta-clone': (_) => const InstagramPage(),
        '/plexity-clone': (_) => const PerplexityPage(),
        '/supernotes-clone': (_) => const SuperNotesPage(),
      },
    );
  }
}
