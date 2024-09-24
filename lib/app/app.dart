import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/metadata.dart';
import 'package:my_flutter_gallery/clones/open_ai_ui/metadata.dart';
import 'package:my_flutter_gallery/clones/resonance/metadata.dart';
import 'package:my_flutter_gallery/gallery/page.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
    //final state = context.watch<MyFlutterGalleryCubit>().state;
    //final selectedApp = state.selectedItem;

    const colorSchemeName = 'stone';
    return ShadApp.router(
      routerConfig: defaultAppRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: ThemeMode.light,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
          brightness: Brightness.dark,
        ),
      ),
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
        ),
      ),
    );
  }
}

class GalleryItemHomePage extends StatelessWidget {
  const GalleryItemHomePage({super.key});

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
