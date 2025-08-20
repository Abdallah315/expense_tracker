import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/di/dependency_injection.dart';
import 'package:inovola_task/core/routing/app_router.dart';
import 'package:inovola_task/core/theming/app_theme.dart';
import 'package:inovola_task/core/utils/simple_bloc_observer.dart';
import 'package:inovola_task/core/database/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await AppDatabase.isar;
  setupGetIt();
  Bloc.observer = SimpleBlocObserver();
  runApp(const ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.getTheme(),
      ),
    );
  }
}
