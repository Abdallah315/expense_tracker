import 'package:inovola_task/core/helpers/icon_helper.dart';

class ExpenseValidator {
  static bool isValidAmount(String amount) {
    if (amount.isEmpty) return false;

    final parsed = double.tryParse(amount);
    if (parsed == null) return false;

    return parsed > 0;
  }

  static bool isValidCategory(String category) {
    return category.isNotEmpty;
  }

  static bool isValidCurrency(Map<String, num> currency) {
    return currency.isNotEmpty;
  }

  static bool isValidDate(DateTime? date) {
    return date != null;
  }

  static bool isValidIconData(CategoryIconData? iconData) {
    return iconData != null;
  }

  static bool isFormValid({
    required String amount,
    required String category,
    required Map<String, num> currency,
    required DateTime? date,
    required CategoryIconData? iconData,
  }) {
    return isValidAmount(amount) &&
        isValidCategory(category) &&
        isValidCurrency(currency) &&
        isValidDate(date) &&
        isValidIconData(iconData);
  }

  static Map<String, String?> getValidationErrors({
    required String amount,
    required String category,
    required Map<String, num> currency,
    required DateTime? date,
    required CategoryIconData? iconData,
  }) {
    return {
      'amount': _getAmountError(amount),
      'category': _getCategoryError(category),
      'currency': _getCurrencyError(currency),
      'date': _getDateError(date),
      'iconData': _getIconDataError(iconData),
    };
  }

  static String? _getAmountError(String amount) {
    if (amount.isEmpty) return 'Amount is required';
    if (double.tryParse(amount) == null) return 'Amount must be a valid number';
    if (double.parse(amount) <= 0) return 'Amount must be greater than 0';
    return null;
  }

  static String? _getCategoryError(String category) {
    if (category.isEmpty) return 'Category is required';
    return null;
  }

  static String? _getCurrencyError(Map<String, num> currency) {
    if (currency.isEmpty) return 'Currency is required';
    return null;
  }

  static String? _getDateError(DateTime? date) {
    if (date == null) return 'Date is required';
    return null;
  }

  static String? _getIconDataError(CategoryIconData? iconData) {
    if (iconData == null) return 'Icon is required';
    return null;
  }
}
