import 'package:go_router/go_router.dart';
import 'package:inovola_task/Features/home/presentation/screens/expenses_screen.dart';
import 'package:inovola_task/Features/home/presentation/screens/home_screen.dart';
import 'package:inovola_task/Features/home/presentation/screens/add_expense_screen.dart';

enum AppRoutes { home, addExpense, expenses }

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/addExpense',
        name: AppRoutes.addExpense.name,
        builder: (context, state) => const AddExpenseScreen(),
      ),
      GoRoute(
        path: '/expenses',
        name: AppRoutes.expenses.name,
        builder: (context, state) => const ExpensesScreen(),
      ),
    ],
  );
}
