import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_state.dart';
import 'package:inovola_task/Features/home/presentation/widgets/expense_summary_widget.dart';
import 'package:inovola_task/Features/home/presentation/widgets/user_info_widget.dart';
import 'package:inovola_task/Features/expenses/presentation/widgets/expense_filter_dropdown.dart';
import 'package:inovola_task/core/helpers/sizes.dart';
import 'package:inovola_task/core/theming/colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: pagePadding),
          height: height * 0.3,
          decoration: BoxDecoration(
            color: ColorsManager.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [verticalSpace(height * 0.08), UserInfoWidget()],
          ),
        ),
        Positioned(
          bottom: -50,
          left: 0,
          right: 0,
          child: Center(child: ExpenseSummaryWidget()),
        ),
      ],
    );
  }
}
