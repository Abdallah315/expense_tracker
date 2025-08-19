import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_event.dart';
import 'package:inovola_task/Features/home/presentation/widgets/header_widget.dart';
import 'package:inovola_task/Features/home/presentation/widgets/expenses_list_widget.dart';
import 'package:inovola_task/core/di/dependency_injection.dart';
import 'package:inovola_task/core/helpers/sizes.dart';
import 'package:inovola_task/core/routing/app_router.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:inovola_task/core/theming/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = getHeight(context);
    return BlocProvider<HomeBloc>(
      create: (_) => getIt<HomeBloc>()..add(const LoadHomeDataRequested()),
      child: Scaffold(
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
                    Text(
                      'Recent Expenses',
                      style: TextStyles.font16MediumBlack,
                    ),
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
      ),
    );
  }
}
