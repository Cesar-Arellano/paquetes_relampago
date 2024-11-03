import 'package:flutter/material.dart';

class ClassicLoadingIndicator extends StatelessWidget {
  const ClassicLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.white),
    );
  }
}