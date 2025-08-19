import 'package:flutter/material.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';

class ExpenseSummaryItem extends StatelessWidget {
  const ExpenseSummaryItem({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });
  final String title;
  final String amount;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 4,
          children: [
            Icon(icon, color: ColorsManager.white, size: 16),
            Text(title, style: TextStyles.font16MediumWhite),
          ],
        ),
        Text(amount, style: TextStyles.font16MediumWhite),
      ],
    );
  }
}
