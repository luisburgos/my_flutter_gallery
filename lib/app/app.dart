import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/app_launchpad.dart';
import 'package:my_flutter_gallery/clones/instagram_page.dart';
import 'package:my_flutter_gallery/clones/perplexity_page.dart';
import 'package:my_flutter_gallery/clones/supernotes_page.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyFlutterGalleryCubit(
        MyFlutterGalleryData(
          selectedItem: _instagramApp,
          items: [
            _instagramApp,
            _perplexityApp,
            _supernotesApp,
          ],
        ),
      ),
      child: const MyFlutterGalleryApp(),
    );
  }
}

class MyFlutterGalleryApp extends StatelessWidget {
  const MyFlutterGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final selectedApp = state.selectedItem;

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
    final selectedApp = state.selectedItem;

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

// Example: Color(0xFF00ff00)
final _instagramApp = GalleryItemData(
  id: _instagramAppId,
  name: 'Instagram',
  seedColor: ColorsExtended.instaOrange,
);
const _perplexityApp = GalleryItemData(
  id: _perplexityAppId,
  name: 'Perplexity',
  seedColor: Colors.cyan,
);
const _supernotesApp = GalleryItemData(
  id: _supernotesAppId,
  name: 'Supernotes',
  seedColor: Colors.pinkAccent,
);
