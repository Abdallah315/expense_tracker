import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_state.dart';
import 'package:inovola_task/Features/home/presentation/widgets/expense_summary_item.dart';
import 'package:inovola_task/core/helpers/sizes.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:inovola_task/core/widgets/error_widget.dart';
import 'package:inovola_task/core/widgets/loader.dart';

class ExpenseSummaryWidget extends StatelessWidget {
  const ExpenseSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: pagePadding),
      child: Container(
        height: height * 0.2,
        decoration: BoxDecoration(
          color: ColorsManager.lightBlue,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.summaryStatus != current.summaryStatus ||
              previous.summary != current.summary,
          builder: (context, state) {
            switch (state.summaryStatus) {
              case ExpenseSummaryStatus.initial:
              case ExpenseSummaryStatus.loading:
                return const Loader();

              case ExpenseSummaryStatus.loaded:
                final summary = state.summary!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Balance', style: TextStyles.font16MediumWhite),
                    verticalSpace(4),
                    Text(
                      '\$${summary.totalBalance.toStringAsFixed(2)}',
                      style: TextStyles.font28BoldWhite,
                    ),
                    verticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ExpenseSummaryItem(
                          title: 'Income',
                          amount: '\$${summary.totalIncome.toStringAsFixed(2)}',
                          icon: Icons.arrow_circle_up_outlined,
                        ),
                        ExpenseSummaryItem(
                          title: 'Expenses',
                          amount:
                              '\$${summary.totalExpenses.toStringAsFixed(2)}',
                          icon: Icons.arrow_circle_down_outlined,
                        ),
                      ],
                    ),
                  ],
                );

              case ExpenseSummaryStatus.error:
                return CustomErrorWidget(
                  error: state.summaryError ?? 'Something went wrong',
                );
            }
          },
        ),
      ),
    );
  }
}
