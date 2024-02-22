import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/app_launchpad.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/clones/clones.dart';
import 'package:my_flutter_gallery/clones/open_gpt_chat_ui/open_gpt_chat_ui_page.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyFlutterGalleryCubit(
        MyFlutterGalleryData(
          selectedItem: OpenGptChatUiAppData(),
          items: [
            InstagramAppData(),
            PerplexityAppData(),
            SupernotesAppData(),
            BrancherAiAppData(),
            OpenGptChatUiAppData(),
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

    if (selectedApp?.id == InstagramAppData().id) {
      return const InstagramPage();
    }
    if (selectedApp?.id == PerplexityAppData().id) {
      return const PerplexityPage();
    }
    if (selectedApp?.id == SupernotesAppData().id) {
      return const SuperNotesPage();
    }
    if (selectedApp?.id == BrancherAiAppData().id) {
      return const BrancherAiAppPage();
    }
    if (selectedApp?.id == OpenGptChatUiAppData().id) {
      return const OpenGptChatUiPage();
    }
    // TODO(unassigned): change for UnimplementedAppHome();
    return const Placeholder();
  }
}
