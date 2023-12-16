import 'package:beamshear/app/core/common/front_back_button.dart';
import 'package:flutter/material.dart';

class BottomPageNavigator extends StatelessWidget {
  final VoidCallback? onPressedBack;
  final VoidCallback? onPressedForwad;
  const BottomPageNavigator({
    required this.onPressedBack,
    required this.onPressedForwad,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FrontBackButton(
            icon: Icons.arrow_back,
            onPressed: onPressedBack,
          ),
          FrontBackButton(
            icon: Icons.arrow_forward,
            onPressed: onPressedForwad,
          ),
        ],
      ),
    );
  }
}
