import 'package:flutter/material.dart';

class MaterialContainer extends StatelessWidget {
  const MaterialContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        child: child,
      ),
    );
  }
}
