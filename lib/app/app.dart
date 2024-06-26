import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/app_launchpad.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/metadata.dart';
import 'package:my_flutter_gallery/clones/open_ai_ui/metadata.dart';
import 'package:my_flutter_gallery/clones/resonance/metadata.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:my_flutter_gallery/shared/global_shortcuts_handler.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MyFlutterGalleryCubit(
            MyFlutterGalleryData(
              selectedItem: OpenAiUiData(),
              items: [
                InstagramAppData(),
                PerplexityAppData(),
                SupernotesAppData(),
                BrancherAiAppData(),
                OpenGptChatUiAppData(),
                PopcornFlavorPickerData(),
                HabitsData(),
                ResonanceAppData(),
                LLMSelectorAppData(),
                OpenAiUiData(),
              ],
            ),
          ),
        ),
      ],
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
        '/launchpad': (_) => const GlobalShortcutsHandler(
              child: LaunchpadPage(),
            ),
        '/': (_) => const GlobalShortcutsHandler(
              child: AppHomeBuilderSelector(),
            ),
      },
    );
  }
}

class AppHomeBuilderSelector extends StatelessWidget {
  const AppHomeBuilderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final selectedItem = state.selectedItem;
    if (selectedItem != null) {
      return selectedItem.pageBuilder(context);
    }
    return const UnimplementedGalleryItemPage();
  }
}
