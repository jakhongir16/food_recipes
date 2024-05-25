import 'package:flutter/material.dart';

class NotFoundEmpty extends StatelessWidget {
  const NotFoundEmpty({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
