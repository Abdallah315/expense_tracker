class CurrencyCalculator {
  static double convertToUSD(double amount, double exchangeRate) {
    if (exchangeRate <= 0) {
      throw ArgumentError('Exchange rate must be greater than 0');
    }
    return amount / exchangeRate;
  }

  static double convertFromUSD(double amountUSD, double exchangeRate) {
    if (exchangeRate <= 0) {
      throw ArgumentError('Exchange rate must be greater than 0');
    }
    return amountUSD * exchangeRate;
  }
}
