import 'package:inovola_task/Features/home/data/models/expense.dart';
import 'package:inovola_task/Features/home/domain/entities/expense_entity.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';
import 'package:isar/isar.dart';

part 'expense_isar.g.dart';

@collection
class ExpenseIsar {
  Id id = Isar.autoIncrement;
  late String type;
  late String iconDataJson;
  @enumerated
  late CategoriesEnum category;
  late double amount;
  late String currency;
  late double amountInUSD;
  late double exchangeRate;
  late DateTime date;

  ExpenseEntity toEntity() => ExpenseEntity(
    id: id,
    type: type,
    iconData: CategoryIconHelper.getIconForCategory(category),
    category: category,
    amount: amount,
    currency: currency,
    amountInUSD: amountInUSD,
    exchangeRate: exchangeRate,
    date: date,
  );

  static ExpenseIsar fromModel(Expense e) {
    return ExpenseIsar()
      ..type = e.type
      ..iconDataJson = e.iconData.toString()
      ..category = e.category
      ..amount = e.amount
      ..currency = e.currency
      ..amountInUSD = e.amountInUSD
      ..exchangeRate = e.exchangeRate
      ..date = e.date;
  }
}
