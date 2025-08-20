import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/widgets/header_widget.dart';
import 'package:inovola_task/Features/home/presentation/widgets/expenses_list_widget.dart';
import 'package:inovola_task/core/helpers/sizes.dart';
import 'package:inovola_task/core/routing/app_router.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:inovola_task/core/theming/styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    context.read<HomeBloc>().add(const LoadHomeDataRequested());
  }

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return Scaffold(
      backgroundColor: ColorsManager.background,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoutes.addExpense.name);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            verticalSpace(height * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: pagePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Expenses', style: TextStyles.font16MediumBlack),
                  GestureDetector(
                    onTap: () => context.pushNamed(AppRoutes.expenses.name),
                    child: Text(
                      'see all',
                      style: TextStyle(color: ColorsManager.black),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(12),
            const ExpensesListWidget(),
          ],
        ),
      ),
    );
  }
}
