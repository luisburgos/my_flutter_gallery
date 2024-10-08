import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class ArtColors {
  const ArtColors({
    required this.accentColor,
    required this.backgroundColor,
    required this.filColor0,
    required this.filColor1,
    required this.filColor2,
    required this.borderColor,
  });

  final Color accentColor;
  final Color backgroundColor;
  final Color filColor0;
  final Color filColor1;
  final Color filColor2;
  final Color borderColor;

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

final defaultArtColors = ArtColors(
  accentColor: Colors.black,
  backgroundColor: Colors.grey.shade100,
  filColor0: Colors.grey.shade200,
  filColor1: Colors.grey.shade300,
  filColor2: Colors.grey.shade400,
  borderColor: Colors.grey.shade300,
);

class WireframeArtWindow extends StatelessWidget {
  const WireframeArtWindow({
    required this.colors,
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
  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(wireframeArtPaddingUnit),
      width: wireframeArtWindowWidth / (isMobile ? 2 : 1),
      height: wireframeArtWindowHeight,
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
    required this.colors,
    super.key,
  });

  final ArtColors colors;

  @override
  Widget build(BuildContext context) {
    const columnsCount = 7;
    const rowsCount = 5;
    final items = List.generate(
      columnsCount * rowsCount,
      (_) {
        final useAccent = _ == 19;
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
