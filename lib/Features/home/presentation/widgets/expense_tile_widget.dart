import 'package:flutter/material.dart';
import 'package:inovola_task/Features/home/domain/entities/expense_entity.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/helpers/extensions.dart';
import 'package:inovola_task/core/helpers/sizes.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';

class ExpenseTileWidget extends StatelessWidget {
  final ExpenseEntity expense;

  const ExpenseTileWidget({super.key, required this.expense});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(
        bottom: 12,
        left: pagePadding,
        right: pagePadding,
      ),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          categoriesIcons[expense.category]!,
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.category.name.toUpperCase(),
                  style: TextStyles.font16MediumBlack,
                ),
                Text(expense.type, style: TextStyles.font12RegularGray),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '- ${expense.currency}${expense.amountInUSD}',
                style: TextStyles.font16MediumBlack,
              ),
              Text(
                expense.date.isSameDay(DateTime.now())
                    ? 'Today ${expense.date.formattedTime}'
                    : expense.date.isYesterday(DateTime.now())
                    ? 'Yesterday ${expense.date.formattedTime}'
                    : expense.date.formattedDate,
                style: TextStyles.font12RegularGray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
