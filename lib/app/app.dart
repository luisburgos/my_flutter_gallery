import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_gallery/app/app_cubit.dart';
import 'package:my_flutter_gallery/app/app_data.dart';
import 'package:my_flutter_gallery/app/app_launchpad.dart';
import 'package:my_flutter_gallery/app/globals.dart';
import 'package:my_flutter_gallery/clones/llm_model_selector/metadata.dart';
import 'package:my_flutter_gallery/clones/open_ai_ui/metadata.dart';
import 'package:my_flutter_gallery/clones/resonance/metadata.dart';
import 'package:my_flutter_gallery/l10n/l10n.dart';
import 'package:my_flutter_gallery/shared/colors_extended.dart';
import 'package:my_flutter_gallery/shared/global_shortcuts_handler.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

const betaGallery = true;

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
          seedColor: ColorsExtended.neoPrimary,
          surface: ColorsExtended.neoBackground,
          tertiary: ColorsExtended.neoTertiary,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      routes: {
        '/launchpad': (_) => const GlobalShortcutsHandler(
              child: LaunchpadPage(),
            ),
        '/': (_) => betaGallery
            ? const BetaGallery()
            : const GlobalShortcutsHandler(
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

const items = [
  {
    'name': 'Popcorn Flavor Picker',
    'type': 'sample',
  },
  {
    'name': 'Weekly Habit Tracker',
    'type': 'sample',
  },
  {
    'name': 'AI Apps Builder',
    'type': 'sample',
  },
  {
    'name': 'App Shell One',
    'type': 'sample',
  },
  {
    'name': 'Countdown Timer Button',
    'type': 'sample',
  },
  {
    'name': 'Expense Splitter',
    'type': 'sample',
  },
];

class BetaGallery extends StatelessWidget {
  const BetaGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsExtended.neoBackground,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const NeoText(
                      'My ',
                      fontSize: 22,
                    ),
                    NeoText(
                      'Flutter',
                      color: ColorsExtended.neoTertiary,
                      fontSize: 22,
                    ),
                    const NeoText(
                      ' Gallery',
                      fontSize: 22,
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
          const NeoDivider(),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 840),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return BetaGalleryItem(item: item);
                    },
                  ),
                ),
              ),
            ),
          ),
          const NeoDivider(),
          const Row(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: SupportButton(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BetaGalleryItem extends StatelessWidget {
  const BetaGalleryItem({
    required this.item,
    super.key,
  });

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: NeuContainer(
        borderWidth: 2,
        color: Colors.white,
        offset: Offset(3, 3),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: ColorsExtended.neoPrimary,
                  height: 128,
                  width: 270,
                  child: const Center(
                    child: Icon(
                      Icons.terminal,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: NeoText(
                    item['name']!,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Positioned(
              right: -2,
              bottom: 0,
              //top: 0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: NeoPlayIconButton(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NeoPlayIconButton extends StatelessWidget {
  const NeoPlayIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return NeuIconButton(
      borderRadius: BorderRadius.circular(20),
      buttonColor: ColorsExtended.neoPrimary,
      buttonHeight: 40,
      buttonWidth: 40,
      borderWidth: 2,
      shadowColor: Colors.transparent,
      enableAnimation: true,
      icon: const Icon(
        Icons.play_arrow_sharp,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return NeuTextButton(
      buttonColor: ColorsExtended.neoPrimary,
      buttonHeight: 40,
      buttonWidth: 200,
      borderWidth: 2,
      //shadowColor: Colors.transparent,
      //offset: Offset(1, 1),
      enableAnimation: true,
      text: const NeoText(
        "Support me",
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}

class NeoText extends Text {
  const NeoText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
  }) : super('');

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class NeoDivider extends StatelessWidget {
  const NeoDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 2,
      color: Colors.black,
    );
  }
}
