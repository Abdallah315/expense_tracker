import 'package:flutter/material.dart';
import 'package:inovola_task/core/theming/colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: ColorsManager.primary,
      ),
    );
  }
}
