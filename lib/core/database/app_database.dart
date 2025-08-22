import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:inovola_task/Features/home/data/models/expenses_summary_isar.dart';
import 'package:inovola_task/Features/expenses/data/models/expense_isar.dart';

class AppDatabase {
  AppDatabase._();

  static Isar? _isar;

  static Future<Isar> get isar async {
    if (_isar != null) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ExpensesSummaryIsarSchema, ExpenseIsarSchema],
      directory: dir.path,
      inspector: false,
    );
    return _isar!;
  }
}
