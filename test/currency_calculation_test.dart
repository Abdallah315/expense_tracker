import 'package:flutter_test/flutter_test.dart';
import 'package:inovola_task/core/utils/currency_calculator.dart';

void main() {
  group('Currency Calculation Tests', () {
    group('Convert to USD', () {
      test('should convert EUR to USD correctly', () {
        final amount = 100.0;
        final exchangeRate = 1.16; // 1 EUR = 1.16 USD
        final expectedUSD = 86.21; // 100 / 1.16

        final result = CurrencyCalculator.convertToUSD(amount, exchangeRate);

        expect(result, closeTo(expectedUSD, 0.01));
      });

      test('should handle USD to USD conversion (exchange rate = 1)', () {
        final amount = 100.0;
        final exchangeRate = 1.0;

        final result = CurrencyCalculator.convertToUSD(amount, exchangeRate);

        expect(result, equals(100.0));
      });
    });

    group('Convert from USD', () {
      test('should convert USD to EUR correctly', () {
        final amountUSD = 100.0;
        final exchangeRate = 0.86; // 1 USD = 0.86 EUR
        final expectedEUR = 86.0; // 100 * 0.86

        final result = CurrencyCalculator.convertFromUSD(
          amountUSD,
          exchangeRate,
        );

        expect(result, closeTo(expectedEUR, 0.01));
      });

      test('should handle USD to USD conversion (exchange rate = 1)', () {
        final amountUSD = 100.0;
        final exchangeRate = 1.0;

        final result = CurrencyCalculator.convertFromUSD(
          amountUSD,
          exchangeRate,
        );

        expect(result, equals(100.0));
      });
    });
  });
}
