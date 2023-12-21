import 'package:flutter/material.dart';

import '../styles/colors_app.dart';

class FrontBackButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const FrontBackButton({required this.icon, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: ColorsApp.i.primary,
        foregroundColor: ColorsApp.i.primaryDark,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
