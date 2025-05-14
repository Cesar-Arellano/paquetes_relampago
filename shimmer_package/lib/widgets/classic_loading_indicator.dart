import 'package:flutter/material.dart';

class ClassicLoadingIndicator extends StatelessWidget {
  const ClassicLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 12),
      child: const CircularProgressIndicator(color: Colors.white));
  }
}