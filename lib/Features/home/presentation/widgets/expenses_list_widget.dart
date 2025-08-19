import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_state.dart';
import 'package:inovola_task/Features/home/presentation/widgets/expense_tile_widget.dart';
import 'package:inovola_task/core/widgets/error_widget.dart';
import 'package:inovola_task/core/widgets/loader.dart';

class ExpensesListWidget extends StatelessWidget {
  const ExpensesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.expensesStatus != current.expensesStatus ||
          previous.expenses != current.expenses ||
          previous.hasMoreExpenses != current.hasMoreExpenses,
      builder: (context, state) {
        switch (state.expensesStatus) {
          case ExpensesStatus.initial:
          case ExpensesStatus.loading:
            return const Loader();

          case ExpensesStatus.loaded:
            final expenses = state.expenses!;
            if (expenses.isEmpty) {
              return const Center(child: Text('No expenses found'));
            }
            return Column(
              children: [
                ...expenses.map(
                  (expense) => ExpenseTileWidget(expense: expense),
                ),
              ],
            );

          case ExpensesStatus.loadingMore:
            return const SizedBox.shrink();

          case ExpensesStatus.error:
            return CustomErrorWidget(
              error: state.expensesError ?? 'Something went wrong',
            );
        }
      },
    );
  }
}
