import 'package:flutter/material.dart';

const defaultHeight = 12.0;

class LinearAvailabilityIndicatorBarOptions {
  const LinearAvailabilityIndicatorBarOptions.config({
    this.height = defaultHeight,
    this.soldColor = Colors.greenAccent,
    this.reservedColor = Colors.yellowAccent,
    this.availableColor = Colors.grey,
    this.margin = const EdgeInsets.symmetric(vertical: 4),
    this.radius = 10,
  });

  static const LinearAvailabilityIndicatorBarOptions basic =
      LinearAvailabilityIndicatorBarOptions.config();

  final double height;
  final Color soldColor;
  final Color reservedColor;
  final Color availableColor;
  final EdgeInsets margin;
  final double radius;
}

class LinearAvailabilityIndicatorBarValues {
  LinearAvailabilityIndicatorBarValues({
    required this.total,
    required this.sold,
    required this.reserved,
  });

  final int total;
  final int sold;
  final int reserved;

  late double width;
  Future<void> setWidth(double width) async {
    this.width = width;
  }

  double get soldWidth => (sold * width) / total;
  double get reservedWidth => (reserved * width) / total;
  double get availableWidth => width - (soldWidth + reservedWidth);
}

class LinearAvailabilityIndicatorBar extends StatelessWidget {
  const LinearAvailabilityIndicatorBar({
    required this.values,
    super.key,
    this.options = LinearAvailabilityIndicatorBarOptions.basic,
  });

  final LinearAvailabilityIndicatorBarValues values;
  final LinearAvailabilityIndicatorBarOptions options;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      values.setWidth(width);
      return Column(
        children: [
          Row(
            children: [
              _AvailabilityIndicatorPart(
                value: 1,
                color: options.soldColor,
                width: values.soldWidth,
                height: options.height,
                margin: options.margin,
                radius: options.radius,
                withLeadingRoundedCorners: true,
              ),
              _AvailabilityIndicatorPart(
                value: 1,
                color: options.reservedColor,
                height: options.height,
                margin: options.margin,
                radius: options.radius,
                width: values.reservedWidth,
              ),
              _AvailabilityIndicatorPart(
                value: 1,
                color: options.availableColor,
                width: values.availableWidth,
                height: options.height,
                margin: options.margin,
                radius: options.radius,
                withTrailingRoundedCorners: true,
              )
            ],
          ),
        ],
      );
    });
  }
}

class _AvailabilityIndicatorPart extends StatelessWidget {
  const _AvailabilityIndicatorPart({
    super.key,
    required this.value,
    required this.width,
    required this.height,
    required this.color,
    // ignore: unused_element
    this.backgroundColor,
    this.withLeadingRoundedCorners = false,
    this.withTrailingRoundedCorners = false,
    required this.radius,
    required this.margin,
  });

  final double value;
  final double width;
  final double height;
  final Color color;
  final Color? backgroundColor;

  final bool withLeadingRoundedCorners;
  final bool withTrailingRoundedCorners;
  final double radius;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: _circularOrZero(withLeadingRoundedCorners),
          right: _circularOrZero(withTrailingRoundedCorners),
        ),
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation(color),
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }

  Radius _circularOrZero(bool flag) {
    return flag ? Radius.circular(radius) : Radius.zero;
  }
}
