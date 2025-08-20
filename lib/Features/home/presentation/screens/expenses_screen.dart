import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_state.dart';
import 'package:inovola_task/Features/home/presentation/widgets/expense_tile_widget.dart';
import 'package:inovola_task/core/di/dependency_injection.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:inovola_task/core/widgets/error_widget.dart';
import 'package:inovola_task/core/widgets/loader.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final ScrollController _scrollController = ScrollController();
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = getIt<HomeBloc>();
    _scrollController.addListener(_onScroll);

    // Load initial full expenses list for this screen
    _loadFullExpensesList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadFullExpensesList() {
    // Load full expenses list specifically for this screen
    _homeBloc.add(const LoadFullExpensesRequested());
  }

  void _onScroll() {
    if (_isBottom) {
      _homeBloc.add(const LoadMoreExpensesRequested());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9); // Trigger at 90% scroll
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: _homeBloc,
      child: Scaffold(
        backgroundColor: ColorsManager.background,
        appBar: AppBar(
          title: Text('All Expenses', style: TextStyles.font16MediumBlack),
          backgroundColor: ColorsManager.background,
          elevation: 0,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
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
              case ExpensesStatus.loadingMore:
                final expenses = state.expenses ?? [];

                if (expenses.isEmpty) {
                  return const Center(
                    child: Text(
                      'No expenses found',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: expenses.length + (state.hasMoreExpenses ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= expenses.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ExpenseTileWidget(expense: expenses[index]),
                    );
                  },
                );

              case ExpensesStatus.error:
                return CustomErrorWidget(
                  error: state.expensesError ?? 'Something went wrong',
                );
            }
          },
        ),
      ),
    );
  }
}
