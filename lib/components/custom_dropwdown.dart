import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    required this.label,
    required this.builder,
    super.key,
  });

  final String label;
  final Widget Function({double? width}) builder;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  final _link = LayerLink();

  /// width of the button after the widget rendered
  double? _buttonWidth;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: widget.builder(width: _buttonWidth),
            ),
          );
        },
        child: CustomDropdownButton(
          onTap: onTap,
          child: Text(widget.label),
        ),
      ),
    );
  }

  void onTap() {
    _buttonWidth = context.size?.width;
    _tooltipController.toggle();
  }
}

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    this.height = 48,
    this.width,
    this.onTap,
    this.child,
  });

  final double? height;
  final double? width;

  final VoidCallback? onTap;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: child ?? const SizedBox(),
                ),
                const Icon(Icons.arrow_drop_down_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpgradePlanButton extends StatelessWidget {
  const UpgradePlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Upgrade to Plus'),
    );
  }
}
