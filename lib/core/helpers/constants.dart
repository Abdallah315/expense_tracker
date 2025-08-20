
const kExpensesSummaryBox = 'expenses_summary_box';
const bool kUseFakeApi = true;

// const int kFakeExpensesTotal = 1000;

// List<Expense> getExpenses({int page = 1, int pageSize = 10}) {
//   if (page < 1 || pageSize < 1) return const [];

//   final int startIndex = (page - 1) * pageSize;
//   if (startIndex >= kFakeExpensesTotal) return const [];

//   final int endExclusive = (startIndex + pageSize) > kFakeExpensesTotal
//       ? kFakeExpensesTotal
//       : (startIndex + pageSize);

//   final categories = CategoriesEnum.values;

//   return List<Expense>.generate(endExclusive - startIndex, (int i) {
//     final int index = startIndex + i;
//     final int id = index + 1;
//     final category = categories[index % categories.length];
//     final currency = '\$';
//     final double amount = ((index % 9) + 1) * 100.0;
//     final double exchangeRate = 1.0;
//     final double amountInUSD = currency == '\$'
//         ? amount
//         : amount / exchangeRate;
//     final DateTime date = DateTime.now().subtract(Duration(days: index));

//     return Expense(
//       id: id,
//       type: 'Expense $id',
//       iconData: CategoryIconHelper.getIconForCategory(category),
//       category: category,
//       amount: amount,
//       currency: currency,
//       amountInUSD: amountInUSD,
//       exchangeRate: exchangeRate,
//       date: date,
//     );
//   });
// }
