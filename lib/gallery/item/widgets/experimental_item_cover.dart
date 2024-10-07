import 'package:flutter/material.dart';

final defaultArtColors = ArtColors(
  accentColor: Colors.black,
  backgroundColor: Colors.grey.shade100,
  filColor1: Colors.grey.shade300,
  filColor2: Colors.grey.shade400,
);

class ArtColors {
  const ArtColors({
    required this.accentColor,
    required this.backgroundColor,
    required this.filColor1,
    required this.filColor2,
  });

  final Color accentColor;
  final Color backgroundColor;
  final Color filColor1;
  final Color filColor2;

  ArtColors copyWith({
    Color? accentColor,
    Color? backgroundColor,
    Color? filColor1,
    Color? filColor2,
  }) {
    return ArtColors(
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      filColor1: filColor1 ?? this.filColor1,
      filColor2: filColor2 ?? this.filColor2,
    );
  }
}

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
          WireframeArtAppBar1(
            color: colors.filColor1,
          ),
          WireframeArtGrid1By2(
            color: colors.filColor1,
          ),
        ],
      ),
    );
  }
}

const wireframeArtWindowHeight = 120.0;
const wireframeArtWindowWidth = 180.0;

const wireframeArtRadius1 = 10.0;
const wireframeArtRadius2 = wireframeArtRadius1 / 1.5;

final wireframeArtFillColor1 = Colors.grey.shade200;
final wireframeArtFillColor2 = Colors.grey.shade300;
final wireframeArtFillColor3 = Colors.grey.shade400;
final wireframeArtFillColor4 = Colors.grey.shade900;

class WireframeArtWindow extends StatelessWidget {
  const WireframeArtWindow({
    required this.child,
    this.padding,
    this.color,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(8),
      width: wireframeArtWindowWidth,
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
    this.height = wireframeArtHeightUnit * 31.5,
    this.width = wireframeArtWidthUnit * 5.45,
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
      padding: padding ?? const EdgeInsets.all(4),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          wireframeArtRadius1,
        ),
      ),
    );
  }
}

const wireframeArtWidthUnit = 14.0;
const wireframeArtHeightUnit = 2.5;

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
      padding: padding ?? const EdgeInsets.all(4),
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
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: wireframeArtHeightUnit,
      width: wireframeArtWidthUnit,
      color: color,
    );
  }
}

class WireframeArtAppBar1 extends StatelessWidget {
  const WireframeArtAppBar1({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          WireframeArtHomeIcon(
            color: color,
          ),
          const Spacer(),
          WireframeArtCircle(
            color: color,
          ),
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
        WireframeArtSquare(color: color),
        const SizedBox(width: 10),
        WireframeArtSquare(color: color),
      ],
    );
  }
}
