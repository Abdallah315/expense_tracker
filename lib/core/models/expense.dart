// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:inovola_task/core/entities/expense_entity.dart';
import 'package:inovola_task/core/helpers/enums.dart';
import 'package:inovola_task/core/helpers/icon_helper.dart';

class Expense {
  final int id;
  final String type;
  final CategoryIconData? iconData;
  final CategoriesEnum category;
  final double amount;
  final String currency;
  final double amountInUSD;
  final double exchangeRate;
  final DateTime date;

  Expense({
    required this.id,
    required this.type,
    this.iconData,
    required this.category,
    required this.amount,
    required this.currency,
    required this.amountInUSD,
    required this.exchangeRate,
    required this.date,
  });

  Expense copyWith({
    int? id,
    String? type,
    CategoryIconData? iconData,
    CategoriesEnum? category,
    double? amount,
    String? currency,
    double? amountInUSD,
    double? exchangeRate,
    DateTime? date,
  }) {
    return Expense(
      id: id ?? this.id,
      type: type ?? this.type,
      iconData: iconData ?? this.iconData,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      amountInUSD: amountInUSD ?? this.amountInUSD,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'category': category.name,
      'amount': amount,
      'currency': currency,
      'amountInUSD': amountInUSD,
      'exchangeRate': exchangeRate,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int,
      type: map['type'] as String,
      category: CategoriesEnum.values.firstWhere(
        (element) => element.name == map['category'] as String,
      ),
      amount: map['amount'] as double,
      currency: map['currency'] as String,
      amountInUSD: map['amountInUSD'] as double,
      exchangeRate: map['exchangeRate'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) =>
      Expense.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Expense(id: $id, type: $type, iconData: $iconData, category: $category, amount: $amount, currency: $currency, amountInUSD: $amountInUSD, exchangeRate: $exchangeRate, date: $date)';
  }

  @override
  bool operator ==(covariant Expense other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.category == category &&
        other.amount == amount &&
        other.currency == currency &&
        other.amountInUSD == amountInUSD &&
        other.exchangeRate == exchangeRate &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        category.hashCode ^
        amount.hashCode ^
        currency.hashCode ^
        amountInUSD.hashCode ^
        exchangeRate.hashCode ^
        date.hashCode;
  }

  ExpenseEntity toEntity() => ExpenseEntity(
    id: id,
    type: type,
    iconData:
        iconData ??
        CategoryIconData(iconCodePoint: 0, colorValue: 0, category: category),
    category: category,
    amount: amount,
    currency: currency,
    amountInUSD: amountInUSD,
    exchangeRate: exchangeRate,
    date: date,
  );

  static Expense fromEntity(ExpenseEntity entity) => Expense(
    id: entity.id,
    type: entity.type,
    iconData: entity.iconData,
    category: entity.category,
    amount: entity.amount,
    currency: entity.currency,
    amountInUSD: entity.amountInUSD,
    exchangeRate: entity.exchangeRate,
    date: entity.date,
  );
}
