import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/app/app_routes.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/provider.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyFlutterGallery(
      child: MyFlutterGalleryApp(),
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
        breakpoints: _getBreakpoints(),
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
          brightness: Brightness.dark,
        ),
      ),
      theme: ShadThemeData(
        breakpoints: _getBreakpoints(),
        brightness: Brightness.light,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
        ),
      ),
    );
  }

  ShadBreakpoints _getBreakpoints() {
    return ShadBreakpoints(
      sm: 480,
      md: 640,
    );
  }
}
