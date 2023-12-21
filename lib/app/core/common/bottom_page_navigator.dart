import 'package:beamshear/app/core/common/front_back_button.dart';
import 'package:flutter/material.dart';

import 'logo.dart';

class BottomPageNavigator extends StatelessWidget {
  final VoidCallback? onPressedBack;
  final VoidCallback? onPressedForwad;
  const BottomPageNavigator({
    required this.onPressedBack,
    this.onPressedForwad,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FrontBackButton(
            icon: Icons.arrow_back,
            onPressed: onPressedBack,
          ),
          const Logo(),
          onPressedForwad != null
              ? FrontBackButton(
                  icon: Icons.arrow_forward,
                  onPressed: onPressedForwad,
                )
              : Container(
                  width: 50,
                ),
        ],
      ),
    );
  }
}
