import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/app_launchpad.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/app/ui_wrappers.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/metadata.dart';
import 'package:my_flutter_gallery/clones/open_ai_ui/metadata.dart';
import 'package:my_flutter_gallery/clones/resonance/metadata.dart';
import 'package:my_flutter_gallery/home/site_top_bar.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:my_flutter_gallery/utils/is_mobile.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppRoutes {
  static const root = '/';
  static const gallery = '/gallery';
  static const galleryItem = '/gallery/:id';
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.root,
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.gallery,
      builder: (_, __) => const GalleryPage(),
    ),
    GoRoute(
      path: AppRoutes.galleryItem,
      builder: (_, __) => const GalleryItemHomePage(),
    ),
  ],
);

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
      routerConfig: _router,
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SiteTopBar(
            onGalleryTap: () {
              context.go(AppRoutes.gallery);
            },
            onHomeTap: () {},
          ),
          const Expanded(
            child: SiteBody(),
          ),
        ],
      ),
    );
  }
}

class SiteBody extends StatelessWidget {
  const SiteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final children = [
      Expanded(
        child: Center(
          child: Container(
            //color: Colors.blue,
            constraints: const BoxConstraints(maxWidth: 400),
            child: const AboutView(),
          ),
        ),
      ),
      Expanded(
        child: Center(
          child: Container(
            //color: Colors.red,
            constraints: const BoxConstraints(maxWidth: 400),
            child: const LatestGalleryItemsView(),
          ),
        ),
      ),
    ];

    if (isMobile(context)) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(40),
              child: AboutView(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
              child: LatestGalleryItemsView(),
            ),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final titleColor = ShadTheme.of(context).colorScheme.primary;
    final subtitleColor = ShadTheme.of(context).colorScheme.mutedForeground;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi, I'm Luis 👋",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer based in México 🇲🇽',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w100,
            color: subtitleColor,
          ),
        ),
        Text(
          'Lorem ipsum lorem ipsum lorem 🎯',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w100,
            color: subtitleColor,
          ),
        ),
      ],
    );
  }
}

class LatestGalleryItemsView extends StatelessWidget {
  const LatestGalleryItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final apps = state.items;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'LATEST BITS',
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            ShadButton.link(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        BetaGalleryItem(
          margin: EdgeInsets.zero,
          item: apps[0],
          onItemTap: (_) {},
          mode: BetaGalleryItemMode.preview,
        ),
        const SizedBox(height: 14),
        BetaGalleryItem(
          margin: EdgeInsets.zero,
          item: apps[1],
          onItemTap: (_) {},
          mode: BetaGalleryItemMode.preview,
        ),
        const SizedBox(height: 12),
      ],
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
