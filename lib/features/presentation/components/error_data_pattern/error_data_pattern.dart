import 'package:flutter/material.dart';

class ErrorDataPattern extends StatelessWidget {
  const ErrorDataPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.width,
        width: 100,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: const Center(
            child: Text('Unable to load data'),
          ),
        ),
      ),
    ),

    );
  }
}
