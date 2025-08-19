import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inovola_task/core/di/dependency_injection.dart';
import 'package:inovola_task/core/routing/app_router.dart';
import 'package:inovola_task/core/theming/colors.dart';
import 'package:inovola_task/core/theming/styles.dart';
import 'package:inovola_task/core/utils/simple_bloc_observer.dart';
import 'package:inovola_task/core/database/app_database.dart';

void main() async {
  // Ensure Isar directory access is ready
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Open Isar once on startup
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
        theme: ThemeData(
          primaryColor: ColorsManager.primary,
          colorScheme: ColorScheme.fromSeed(seedColor: ColorsManager.primary),
          brightness: Brightness.light,
          scaffoldBackgroundColor: ColorsManager.background,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ColorsManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: ColorsManager.white,
            elevation: 0,
            titleTextStyle: TextStyles.font16MediumBlack,
            centerTitle: true,
            iconTheme: IconThemeData(color: ColorsManager.black),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: ColorsManager.primary,
            selectionColor: ColorsManager.primary.withAlpha(30),
            selectionHandleColor: ColorsManager.primary,
          ),
        ),
      ),
    );
  }
}
