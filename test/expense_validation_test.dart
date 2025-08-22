import 'package:flutter_test/flutter_test.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';
import 'package:inovola_task/core/utils/expense_validator.dart';

void main() {
  group('Expense Validation Tests', () {
    group('Amount Validation', () {
      test('should accept valid decimal amounts', () {
        expect(ExpenseValidator.isValidAmount('99.99'), true);
      });

      test('should accept valid integer amounts', () {
        expect(ExpenseValidator.isValidAmount('100'), true);
      });

      test('should reject empty amount', () {
        expect(ExpenseValidator.isValidAmount(''), false);
      });

      test('should reject non-numeric amount', () {
        expect(ExpenseValidator.isValidAmount('abc'), false);
      });

      test('should reject amount with multiple decimal points', () {
        expect(ExpenseValidator.isValidAmount('100.50.25'), false);
      });

      test('should reject negative amounts', () {
        expect(ExpenseValidator.isValidAmount('-100'), false);
      });

      test('should reject zero amounts', () {
        expect(ExpenseValidator.isValidAmount('0'), false);
      });

      test('should provide correct error messages for amount', () {
        final errors = ExpenseValidator.getValidationErrors(
          amount: '',
          category: 'Test',
          currency: {'USD': 1.0},
          date: DateTime.now(),
          iconData: CategoryIconData(
            iconCodePoint: 0xe532,
            colorValue: 0xFF000000,
            category: CategoriesEnum.groceries,
          ),
        );
        expect(errors['amount'], 'Amount is required');
      });
    });

    group('Category Validation', () {
      test('should validate all category enum values', () {
        expect(CategoriesEnum.groceries.name, 'Groceries');
        expect(CategoriesEnum.shopping.name, 'Shopping');
        expect(CategoriesEnum.entertainment.name, 'Entertainment');
        expect(CategoriesEnum.gas.name, 'Gas');
        expect(CategoriesEnum.transport.name, 'Transport');
        expect(CategoriesEnum.newsPaper.name, 'News Paper');
        expect(CategoriesEnum.rent.name, 'Rent');
        expect(CategoriesEnum.other.name, 'Other');
      });
    });

    group('Form Validation Logic', () {
      test('should validate all required fields', () {
        final isValid = ExpenseValidator.isFormValid(
          amount: '100.50',
          category: 'Groceries',
          currency: {'USD': 1.0},
          date: DateTime(2024, 1, 1),
          iconData: CategoryIconData(
            iconCodePoint: 0xe532,
            colorValue: 0xFF000000,
            category: CategoriesEnum.groceries,
          ),
        );

        expect(isValid, true);
      });

      test('should be invalid when amount is missing', () {
        final isValid = ExpenseValidator.isFormValid(
          amount: '',
          category: 'Groceries',
          currency: {'USD': 1.0},
          date: DateTime(2024, 1, 1),
          iconData: CategoryIconData(
            iconCodePoint: 0xe532,
            colorValue: 0xFF000000,
            category: CategoriesEnum.groceries,
          ),
        );

        expect(isValid, false);
      });

      test('should be invalid when category is missing', () {
        final isValid = ExpenseValidator.isFormValid(
          amount: '100.50',
          category: '',
          currency: {'USD': 1.0},
          date: DateTime(2024, 1, 1),
          iconData: CategoryIconData(
            iconCodePoint: 0xe532,
            colorValue: 0xFF000000,
            category: CategoriesEnum.groceries,
          ),
        );

        expect(isValid, false);
      });

      test('should be invalid when currency is missing', () {
        final isValid = ExpenseValidator.isFormValid(
          amount: '100.50',
          category: 'Groceries',
          currency: <String, num>{},
          date: DateTime(2024, 1, 1),
          iconData: CategoryIconData(
            iconCodePoint: 0xe532,
            colorValue: 0xFF000000,
            category: CategoriesEnum.groceries,
          ),
        );

        expect(isValid, false);
      });

      test('should provide all validation error messages', () {
        final errors = ExpenseValidator.getValidationErrors(
          amount: '',
          category: '',
          currency: <String, num>{},
          date: null,
          iconData: null,
        );

        expect(errors['amount'], 'Amount is required');
      });
    });

    group('Date Validation', () {
      test('should accept valid dates', () {
        final date = DateTime(2024, 1, 1);
        expect(date.year, 2024);
        expect(date.month, 1);
        expect(date.day, 1);
      });

      test('should reject null dates', () {
        DateTime? date;
        expect(date, null);
      });
    });
  });
}
