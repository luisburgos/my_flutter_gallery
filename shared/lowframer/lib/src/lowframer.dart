import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// @no-doc
const wireframeArtWindowHeight = 120.0;

/// @no-doc
const wireframeArtWindowWidth = 160.0;

/// @no-doc
const wireframeArtRadius1 = 10.0;

/// @no-doc
const wireframeArtRadius2 = wireframeArtRadius1 / 1.5;

/// @no-doc
final wireframeArtFillColor1 = Colors.grey.shade200;

/// @no-doc
final wireframeArtFillColor2 = Colors.grey.shade300;

/// @no-doc
final wireframeArtFillColor3 = Colors.grey.shade400;

/// @no-doc
final wireframeArtFillColor4 = Colors.grey.shade900;

/// @no-doc
const wireframeArtWidthUnit = 14.0;

/// @no-doc
const wireframeArtHeightUnit = 2.5;

/// @no-doc
const wireframeArtPaddingUnit = 8.0;

/// @no-doc
class ArtColors {
  /// @no-doc
  const ArtColors({
    required this.accentColor,
    required this.backgroundColor,
    required this.filColor0,
    required this.filColor1,
    required this.filColor2,
    required this.borderColor,
  });

  /// @no-doc
  final Color accentColor;

  /// @no-doc
  final Color backgroundColor;

  /// @no-doc
  final Color filColor0;

  /// @no-doc
  final Color filColor1;

  /// @no-doc
  final Color filColor2;

  /// @no-doc
  final Color borderColor;

  /// @no-doc
  ArtColors copyWith({
    Color? accentColor,
    Color? backgroundColor,
    Color? filColor0,
    Color? filColor1,
    Color? filColor2,
    Color? borderColor,
  }) {
    return ArtColors(
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      filColor0: filColor0 ?? this.filColor0,
      filColor1: filColor1 ?? this.filColor1,
      filColor2: filColor2 ?? this.filColor2,
      borderColor: borderColor ?? this.borderColor,
    );
  }
}

/// @no-doc
final defaultArtColors = ArtColors(
  accentColor: Colors.black,
  backgroundColor: Colors.grey.shade100,
  filColor0: Colors.grey.shade200,
  filColor1: Colors.grey.shade300,
  filColor2: Colors.grey.shade400,
  borderColor: Colors.grey.shade300,
);

/// @no-doc
class WireframeArtWindow extends StatelessWidget {
  /// @no-doc
  const WireframeArtWindow({
    required this.colors,
    required this.child,
    this.padding,
    this.color,
    this.isMobile = false,
    this.isLandscape = false,
    super.key,
  });

  /// @no-doc
  final Widget child;

  /// @no-doc
  final EdgeInsetsGeometry? padding;

  /// @no-doc
  final Color? color;

  /// @no-doc
  final bool isMobile;

  /// @no-doc
  final bool isLandscape;

  /// @no-doc
  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    final width = wireframeArtWindowWidth / (isMobile ? 2 : 1);

    return Container(
      padding: padding ?? const EdgeInsets.all(wireframeArtPaddingUnit),
      width: isLandscape ? wireframeArtWindowHeight : width,
      height: isLandscape ? width : wireframeArtWindowHeight,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(
          color: colors.borderColor,
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

/// @no-doc
class WireframeArtHomeIcon extends StatelessWidget {
  /// @no-doc
  const WireframeArtHomeIcon({
    required this.color,
    super.key,
  });

  /// @no-doc
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

/// @no-doc
class WireframeArtSquare extends StatelessWidget {
  /// @no-doc
  const WireframeArtSquare({
    required this.color,
    this.height = double.infinity,
    this.width = double.infinity,
    this.padding,
    this.radius = wireframeArtRadius1,
    super.key,
  });

  /// @no-doc
  const WireframeArtSquare.small({
    required this.color,
    this.padding,
    super.key,
  })  : height = wireframeArtHeightUnit * 5,
        width = wireframeArtHeightUnit * 5,
        radius = wireframeArtRadius1 / 2.5;

  /// @no-doc
  final double height;

  /// @no-doc
  final double width;

  /// @no-doc
  final EdgeInsetsGeometry? padding;

  /// @no-doc
  final Color color;

  /// @no-doc
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

/// @no-doc
class WireframeArtCircle extends StatelessWidget {
  /// @no-doc
  const WireframeArtCircle({
    required this.color,
    this.height = wireframeArtWidthUnit,
    this.width = wireframeArtWidthUnit,
    this.padding,
    super.key,
  });

  /// @no-doc
  final double height;

  /// @no-doc
  final double width;

  /// @no-doc
  final EdgeInsetsGeometry? padding;

  /// @no-doc

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

/// @no-doc
class WireframeArtLine extends StatelessWidget {
  /// @no-doc
  const WireframeArtLine({
    required this.color,
    this.height = wireframeArtHeightUnit,
    this.width = wireframeArtWidthUnit,
    super.key,
  });

  /// @no-doc
  final Color color;

  /// @no-doc
  final double height;

  /// @no-doc
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

/// @no-doc
class WireframeArtTopBar1 extends StatelessWidget {
  /// @no-doc
  const WireframeArtTopBar1({
    required this.leading,
    required this.trailing,
    super.key,
  });

  /// @no-doc
  final Widget leading;

  /// @no-doc
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

/// @no-doc
class WireframeArtTopBarBase extends StatelessWidget {
  /// @no-doc
  const WireframeArtTopBarBase({
    required this.leading,
    required this.body,
    required this.trailing,
    super.key,
  });

  /// @no-doc
  final Widget leading;

  /// @no-doc
  final Widget body;

  /// @no-doc
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

/// @no-doc
class WireframeArtGrid1By2 extends StatelessWidget {
  /// @no-doc
  const WireframeArtGrid1By2({
    required this.color,
    super.key,
  });

  /// @no-doc
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

/// @no-doc
class WireframeArtCirclesGrid extends StatelessWidget {
  /// @no-doc
  const WireframeArtCirclesGrid({
    required this.colors,
    super.key,
  });

  /// @no-doc
  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    const columnsCount = 7;
    const rowsCount = 5;
    final items = List.generate(
      columnsCount * rowsCount,
      (item) {
        final useAccent = item == 19;
        return WireframeArtCircle(
          color: useAccent ? colors.accentColor : colors.filColor1,
        );
      },
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

/// @no-doc
class WireframeArtIconLeft extends StatelessWidget {
  /// @no-doc
  const WireframeArtIconLeft({
    required this.colors,
    super.key,
  });

  /// @no-doc
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

/// @no-doc
class WireframeArtIconRight extends StatelessWidget {
  /// @no-doc
  const WireframeArtIconRight({
    required this.colors,
    super.key,
  });

  /// @no-doc
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
