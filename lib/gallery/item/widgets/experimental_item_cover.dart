import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_gallery/components/my_flutter_gallery/model.dart';

const wireframeArtWindowHeight = 120.0;
const wireframeArtWindowWidth = 160.0;

const wireframeArtRadius1 = 10.0;
const wireframeArtRadius2 = wireframeArtRadius1 / 1.5;

final wireframeArtFillColor1 = Colors.grey.shade200;
final wireframeArtFillColor2 = Colors.grey.shade300;
final wireframeArtFillColor3 = Colors.grey.shade400;
final wireframeArtFillColor4 = Colors.grey.shade900;
const wireframeArtWidthUnit = 14.0;
const wireframeArtHeightUnit = 2.5;

const wireframeArtPaddingUnit = 8.0;

final defaultArtColors = ArtColors(
  accentColor: Colors.black,
  backgroundColor: Colors.grey.shade100,
  filColor0: Colors.grey.shade200,
  filColor1: Colors.grey.shade300,
  filColor2: Colors.grey.shade400,
);

class ExperimentalItemCover extends StatelessWidget {
  const ExperimentalItemCover({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      child: Column(
        children: [
          WireframeArtTopBar1(
            leading: WireframeArtHomeIcon(
              color: colors.filColor1,
            ),
            trailing: WireframeArtCircle(
              color: colors.filColor1,
            ),
          ),
          Expanded(
            child: WireframeArtGrid1By2(
              color: colors.filColor1,
            ),
          ),
        ],
      ),
    );
  }
}

class HighlightsDailyReviewArt extends StatelessWidget {
  const HighlightsDailyReviewArt({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      isMobile: true,
      padding: const EdgeInsets.symmetric(
        horizontal: wireframeArtPaddingUnit / 2,
        vertical: wireframeArtPaddingUnit,
      ),
      child: Row(
        children: [
          WireframeArtIconLeft(colors: colors),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 8),
                WireframeArtSquare(
                  color: colors.filColor1,
                  padding: EdgeInsets.zero,
                  radius: wireframeArtRadius1 / 2,
                  height: wireframeArtHeightUnit * 30,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WireframeArtSquare.small(
                      color: colors.filColor1,
                    ),
                    WireframeArtSquare.small(
                      color: colors.filColor1,
                    ),
                    WireframeArtSquare.small(
                      color: colors.filColor1,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          WireframeArtIconRight(colors: colors),
        ],
      ),
    );
  }
}

class CinemaSnacksPickerArt extends StatelessWidget {
  const CinemaSnacksPickerArt({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      isMobile: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 2,
            width: 30,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              _buildItem(),
              const SizedBox(width: 4),
              _buildItem(),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 8),
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 2,
            width: 30,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              _buildItem(),
              const SizedBox(width: 4),
              _buildItem(),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              _buildItem(),
              const SizedBox(width: 4),
              _buildItem(),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem() => WireframeArtSquare(
        height: wireframeArtHeightUnit * 9,
        width: wireframeArtHeightUnit * 11.5,
        color: colors.filColor1,
        radius: 5,
      );
}

class BillSplitCalculatorArt extends StatelessWidget {
  const BillSplitCalculatorArt({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      isMobile: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 2,
            width: 30,
          ),
          const SizedBox(height: 4),
          WireframeArtLine(
            color: colors.filColor1,
            height: wireframeArtHeightUnit * 6,
            width: double.infinity,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WireframeArtSquare.small(
                color: colors.filColor1,
              ),
              WireframeArtSquare.small(
                color: colors.filColor1,
              ),
              WireframeArtSquare.small(
                color: colors.filColor1,
              ),
              WireframeArtSquare.small(
                color: colors.filColor1,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: WireframeArtSquare(
              color: colors.filColor1,
              radius: 4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem() => WireframeArtSquare(
        height: wireframeArtHeightUnit * 9,
        width: wireframeArtHeightUnit * 11.5,
        color: colors.filColor1,
        radius: 5,
      );
}

class WeeklyHabitsTrackerArt extends StatelessWidget {
  const WeeklyHabitsTrackerArt({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: wireframeArtPaddingUnit * 2,
        ),
        child: Column(
          children: [
            WireframeArtTopBarBase(
              leading: WireframeArtIconLeft(colors: colors),
              body: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: wireframeArtPaddingUnit * 4,
                  ),
                  child: WireframeArtSquare(
                    color: colors.filColor1,
                    height: wireframeArtHeightUnit * 4,
                    radius: wireframeArtRadius1 / 2,
                  ),
                ),
              ),
              trailing: WireframeArtIconRight(colors: colors),
            ),
            Expanded(
              child: WireframeArtCirclesGrid(
                color: colors.filColor1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AiPoweredAppBuilder extends StatelessWidget {
  const AiPoweredAppBuilder({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return WireframeArtWindow(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          WireframeArtSquare(
            color: colors.filColor0,
            width: 20,
            radius: wireframeArtRadius1 / 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: wireframeArtPaddingUnit * 1.4,
                vertical: wireframeArtPaddingUnit,
              ),
              child: Column(
                children: [
                  WireframeArtTopBar1(
                    leading: const SizedBox.shrink(),
                    trailing: Row(
                      children: [
                        WireframeArtCircle(
                          color: colors.filColor1,
                        ),
                        const SizedBox(width: 4),
                        WireframeArtCircle(
                          color: colors.filColor1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: WireframeArtGrid1By2(
                      color: colors.filColor1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WireframeArtWindow extends StatelessWidget {
  const WireframeArtWindow({
    required this.child,
    this.padding,
    this.color,
    this.isMobile = false,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(wireframeArtPaddingUnit),
      width: wireframeArtWindowWidth / (isMobile ? 2 : 1),
      height: wireframeArtWindowHeight,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(
          wireframeArtRadius2,
        ),
      ),
      child: child,
    );
  }
}

class WireframeArtHomeIcon extends StatelessWidget {
  const WireframeArtHomeIcon({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WireframeArtLine(
          color: color,
        ),
        const SizedBox(height: 1),
        WireframeArtLine(
          color: color,
        ),
        const SizedBox(height: 1),
        WireframeArtLine(
          color: color,
        ),
      ],
    );
  }
}

class WireframeArtSquare extends StatelessWidget {
  const WireframeArtSquare({
    required this.color,
    this.height = double.infinity,
    this.width = double.infinity,
    this.padding,
    this.radius = wireframeArtRadius1,
    super.key,
  });

  const WireframeArtSquare.small({
    required this.color,
    this.padding,
    super.key,
  })  : height = wireframeArtHeightUnit * 5,
        width = wireframeArtHeightUnit * 5,
        radius = wireframeArtRadius1 / 2.5;

  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(wireframeArtPaddingUnit / 2),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

class WireframeArtCircle extends StatelessWidget {
  const WireframeArtCircle({
    required this.color,
    this.height = wireframeArtWidthUnit,
    this.width = wireframeArtWidthUnit,
    this.padding,
    super.key,
  });

  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(wireframeArtPaddingUnit / 2),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(width / 2),
      ),
    );
  }
}

class WireframeArtLine extends StatelessWidget {
  const WireframeArtLine({
    required this.color,
    this.height = wireframeArtHeightUnit,
    this.width = wireframeArtWidthUnit,
    super.key,
  });

  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}

class WireframeArtTopBar1 extends StatelessWidget {
  const WireframeArtTopBar1({
    required this.leading,
    required this.trailing,
    super.key,
  });

  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return WireframeArtTopBarBase(
      leading: leading,
      body: const Spacer(),
      trailing: trailing,
    );
  }
}

class WireframeArtTopBarBase extends StatelessWidget {
  const WireframeArtTopBarBase({
    required this.leading,
    required this.body,
    required this.trailing,
    super.key,
  });

  final Widget leading;
  final Widget body;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: wireframeArtPaddingUnit),
      child: Row(
        children: [
          leading,
          body,
          trailing,
        ],
      ),
    );
  }
}

class WireframeArtGrid1By2 extends StatelessWidget {
  const WireframeArtGrid1By2({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WireframeArtSquare(color: color),
        ),
        const SizedBox(width: wireframeArtPaddingUnit),
        Expanded(
          child: WireframeArtSquare(color: color),
        ),
      ],
    );
  }
}

class WireframeArtCirclesGrid extends StatelessWidget {
  const WireframeArtCirclesGrid({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    const columnsCount = 7;
    const rowsCount = 5;
    final items = List.generate(
      columnsCount * rowsCount,
      (_) => WireframeArtCircle(color: color),
    );

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnsCount,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: items.length,
      itemBuilder: (_, index) {
        return items[index];
      },
    );
  }
}

class WireframeArtIconLeft extends StatelessWidget {
  const WireframeArtIconLeft({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.chevronLeft,
      size: 8,
      color: colors.filColor2,
    );
  }
}

class WireframeArtIconRight extends StatelessWidget {
  const WireframeArtIconRight({
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return Icon(
      FontAwesomeIcons.chevronRight,
      size: 8,
      color: colors.filColor2,
    );
  }
}
