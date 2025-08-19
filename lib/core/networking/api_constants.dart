class ApiConstants {
  static const String apiBaseUrl = "";
  static const String expensesSummary = "expenses-summary";
  static const String expenses = "expenses";
  static String exchangeRates(String base) =>
      "https://open.er-api.com/v6/latest/$base";
}
