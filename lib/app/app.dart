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
import 'package:my_flutter_gallery/l10n/l10n.dart';
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

    return ShadApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
            child: Row(
              children: [
                Expanded(
                  child: AboutView(),
                ),
                Expanded(
                  child: LatestGalleryItemsView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hi, I'm Luis 👋",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Software Engineer based in México 🇲🇽',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w100,
              color: Colors.white60,
            ),
          ),
          Text(
            'Lorem ipsum lorem ipsum lorem 🎯',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w100,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

class LatestGalleryItemsView extends StatelessWidget {
  const LatestGalleryItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MyFlutterGalleryCubit>().state;
    final apps = state.items;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('LATEST BITS'),
          const SizedBox(height: 12),
          BetaGalleryItem(
            margin: EdgeInsets.zero,
            item: apps[0],
            onItemTap: (_) {},
          ),
          const SizedBox(height: 14),
          BetaGalleryItem(
            margin: EdgeInsets.zero,
            item: apps[1],
            onItemTap: (_) {},
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('View all'),
            ),
          ),
        ],
      ),
    );
  }
}

class SiteTopBar extends StatelessWidget {
  const SiteTopBar({
    required this.onHomeTap,
    required this.onGalleryTap,
    this.selectedIndex = 0,
    super.key,
  });

  final int selectedIndex;
  final VoidCallback onHomeTap;
  final VoidCallback onGalleryTap;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onHomeTap,
            icon: Icon(
              Icons.home_filled,
              size: 18,
              color: selectedIndex == 0 ? primaryColor : secondaryColor,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: onGalleryTap,
            icon: Icon(
              Icons.terminal,
              size: 18,
              color: selectedIndex == 1 ? primaryColor : secondaryColor,
            ),
          ),
        ],
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
