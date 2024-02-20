import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/clones/instagram_page.dart';
import 'package:my_flutter_gallery/clones/perplexity_page.dart';
import 'package:my_flutter_gallery/clones/supernotes_page.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:my_flutter_gallery/launchpad/launchpad_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyFlutterGalleryCubit(
        const MyFlutterGalleryData(
          selectedApp: _instagramApp,
          apps: [
            _instagramApp,
            _perplexityApp,
            _supernotesApp,
          ],
        ),
      ),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final selectedApp = state.selectedApp;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: selectedApp!.seedColor,
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
        '/launchpad': (_) => const LaunchpadPage(),
        '/': (_) => const AppHomeBuilderSelector(),
      },
    );
  }
}

class AppHomeBuilderSelector extends StatelessWidget {
  const AppHomeBuilderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final selectedApp = state.selectedApp;

    if (selectedApp?.id == _instagramAppId) {
      return const InstagramPage();
    }
    if (selectedApp?.id == _perplexityAppId) {
      return const PerplexityPage();
    }
    if (selectedApp?.id == _supernotesAppId) {
      return const SuperNotesPage();
    }
    // TODO(unassigned): change for UnimplementedAppHome();
    return const Placeholder();
  }
}

const _instagramAppId = 'INST-00';
const _perplexityAppId = 'PERP-00';
const _supernotesAppId = 'SUPN-00';

const _instagramApp = AppData(
  id: _instagramAppId,
  name: 'Instagram',
  seedColor: Color(0xFF00ff00),
);
const _perplexityApp = AppData(
  id: _perplexityAppId,
  name: 'Perplexity',
  seedColor: Color(0xFF00ff00),
);
const _supernotesApp = AppData(
  id: _supernotesAppId,
  name: 'Supernotes',
  seedColor: Color(0xFF00ff00),
);
