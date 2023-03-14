import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onTap,
    required this.child,
    required this.borderRaduis,
    this.color,
  });

  final VoidCallback onTap;
  final Widget child;
  final BorderRadiusGeometry borderRaduis;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRaduis,
          color: color,
        ),
        child: child,
      ),
    );
  }
}
