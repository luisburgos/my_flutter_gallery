import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roadie/roadie.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class RoadieMainPage extends StatelessWidget {
  /// @no-doc
  const RoadieMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = RoadieAppState.of(context);
    final roadmap = state.roadmap;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SelectedModuleWrapper(
          initialModule: roadmap.modules.first,
          builder: (selectedModule, setSelectedModule) {
            return Column(
              children: [
                RoadieTopBar(
                  userName: roadmap.user.name,
                ),
                ModulesCarouselView(
                  selectedItem: selectedModule,
                  modules: roadmap.modules,
                  onItemPressed: (module) {
                    setSelectedModule.call(module);
                  },
                ),
                Expanded(
                  child: ModuleLessonsCarouselView(
                    lessons: selectedModule.lessons,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// @no-doc
class SelectedModuleWrapper extends StatefulWidget {
  /// @no-doc
  const SelectedModuleWrapper({
    required this.initialModule,
    required this.builder,
    super.key,
  });

  /// @no-doc
  final Module initialModule;

  /// @no-doc
  final Widget Function(
    Module,
    void Function(Module),
  ) builder;

  @override
  State<SelectedModuleWrapper> createState() => _SelectedModuleWrapperState();
}

class _SelectedModuleWrapperState extends State<SelectedModuleWrapper> {
  late Module selectedModule;

  @override
  void initState() {
    selectedModule = widget.initialModule;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(
      selectedModule,
      (module) {
        setState(() {
          selectedModule = module;
        });
      },
    );
  }
}

/// @no-doc
class RoadieTopBar extends StatelessWidget {
  /// @no-doc
  const RoadieTopBar({
    required this.userName,
    super.key,
  });

  /// @no-doc
  final String userName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20,
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                ),
                children: [
                  const TextSpan(
                    text: 'Buen día, ',
                  ),
                  TextSpan(
                    text: userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const ShadButton.outline(
            decoration: ShadDecoration.none,
            icon: Icon(
              FontAwesomeIcons.bars,
            ),
          ),
        ],
      ),
    );
  }
}

/// @no-doc
class ModulesCarouselView extends StatelessWidget {
  /// @no-doc
  const ModulesCarouselView({
    required this.selectedItem,
    required this.modules,
    required this.onItemPressed,
    super.key,
  });

  /// @no-doc
  final Module selectedItem;

  /// @no-doc
  final List<Module> modules;

  /// @no-doc
  final void Function(Module) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.92,
        enableInfiniteScroll: false,
        height: 240,
        onPageChanged: (index, reason) {
          onItemPressed(modules[index]);
        },
      ),
      items: imageSliders,
    );
  }

  /// @no-doc
  int get completedCount => 1;

  /// @no-doc
  int get totalCount => 10;

  /// @no-doc
  List<Widget> get imageSliders => modules
      .map(
        (item) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: item.name == selectedItem.name
                ? Border.all(
                    color: Colors.grey.shade600,
                    width: 1.2,
                  )
                : null,
          ),
          //margin: const EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: ColoredBox(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.red,
                              Colors.deepOrange,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ShadBadge(
                      child: Text(
                        '$completedCount/$totalCount',
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
      .toList();
}

/// @no-doc
class ModuleLessonsCarouselView extends StatelessWidget {
  /// @no-doc
  const ModuleLessonsCarouselView({
    required this.lessons,
    super.key,
  });

  /// @no-doc
  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(
              'MEDITATIONS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final item = lessons[index];
              final itemConfigs = LessonItemViewConfigs(item);

              return Opacity(
                opacity: itemConfigs.opacity,
                child: Container(
                  decoration: BoxDecoration(
                    color: itemConfigs.backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: itemConfigs.border,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(item.name),
                    trailing: Icon(
                      itemConfigs.iconData,
                      size: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// @no-doc
class LessonItemViewConfigs {
  /// @no-doc
  const LessonItemViewConfigs(this.lesson);

  /// @no-doc
  final Lesson lesson;

  /// @no-doc
  double get opacity {
    final isLocked = lesson.availabilityStatus.isLocked;
    final isInitial = lesson.completionStatus.isInitial;
    return isInitial && isLocked ? 0.5 : 1.0;
  }

  /// @no-doc
  IconData get iconData {
    if (lesson.completionStatus.isDone) return FontAwesomeIcons.check;
    if (lesson.availabilityStatus.isLocked) return FontAwesomeIcons.lock;
    return FontAwesomeIcons.arrowRight;
  }

  /// @no-doc
  Color? get backgroundColor {
    return lesson.availabilityStatus.isLocked ? null : Colors.grey.shade100;
  }

  /// @no-doc
  Border get border {
    return lesson.availabilityStatus.isLocked
        ? Border.all(
            color: Colors.grey.shade200,
          )
        : Border.all(
            color: Colors.grey.shade400,
            width: 1.1,
          );
  }
}
