import 'package:flutter/material.dart';
import 'package:my_flutter_gallery/legacy/clones/open_gpt_chat_ui/dialogs/dialogs.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    required this.label,
    required this.builder,
    super.key,
  });

  final String label;
  final Widget Function(
    OverlayPortalController controller,
    double? width,
  ) builder;

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
              child: CustomDropdownBodyContainer(
                child: widget.builder(
                  _tooltipController,
                  _buttonWidth,
                ),
              ),
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

class CustomDropdownBodyContainer extends StatelessWidget {
  const CustomDropdownBodyContainer({
    required this.child,
    this.width,
    this.margin = const EdgeInsets.only(top: 8),
    super.key,
  });

  final double? width;
  final Widget child;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width ?? 200,
      height: 270,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.5,
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}

class UpgradePlanButton extends StatelessWidget {
  const UpgradePlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        openDialog(
          context,
          child: const UpgradeYourPlanDialog(),
        );
      },
      child: const Text('Upgrade to Plus'),
    );
  }
}
