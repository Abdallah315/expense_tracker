import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inovola_task/Features/home/presentation/bloc/home_bloc.dart';
import 'package:inovola_task/Features/home/presentation/screens/expenses_screen.dart';
import 'package:inovola_task/Features/home/presentation/screens/home_screen.dart';
import 'package:inovola_task/Features/home/presentation/screens/add_expense_screen.dart';
import 'package:inovola_task/core/di/dependency_injection.dart';

enum AppRoutes { home, addExpense, expenses }

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.home.name,
        builder: (context, state) => BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>(),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/addExpense',
        name: AppRoutes.addExpense.name,
        builder: (context, state) => BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>(),
          child: const AddExpenseScreen(),
        ),
      ),
      GoRoute(
        path: '/expenses',
        name: AppRoutes.expenses.name,
        builder: (context, state) => BlocProvider<HomeBloc>(
          create: (context) => getIt<HomeBloc>(),
          child: const ExpensesScreen(),
        ),
      ),
    ],
  );
}
