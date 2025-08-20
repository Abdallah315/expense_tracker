import 'package:flutter/material.dart';
import 'package:inovola_task/Features/home/enums/home_enums.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';

class ExpenseFilterDropdown extends StatelessWidget {
  final DateFilter currentFilter;
  final Function(DateFilter) onFilterChanged;

  const ExpenseFilterDropdown({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorsManager.gray.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DateFilter>(
          value: currentFilter,
          icon: Icon(Icons.keyboard_arrow_down, color: ColorsManager.gray),
          style: TextStyles.font14RegularBlack,
          dropdownColor: ColorsManager.white,
          borderRadius: BorderRadius.circular(8),
          items: [
            _buildDropdownItem(DateFilter.all, 'All Time', Icons.all_inclusive),
            _buildDropdownItem(
              DateFilter.thisMonth,
              'This Month',
              Icons.calendar_month,
            ),
            _buildDropdownItem(
              DateFilter.lastSevenDays,
              'Last 7 Days',
              Icons.today,
            ),
          ],
          onChanged: (DateFilter? newValue) {
            if (newValue != null) {
              onFilterChanged(newValue);
            }
          },
        ),
      ),
    );
  }

  DropdownMenuItem<DateFilter> _buildDropdownItem(
    DateFilter filter,
    String label,
    IconData icon,
  ) {
    return DropdownMenuItem<DateFilter>(
      value: filter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: ColorsManager.gray),
          const SizedBox(width: 8),
          Text(label, style: TextStyles.font14RegularBlack),
        ],
      ),
    );
  }
}
