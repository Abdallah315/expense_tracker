// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:inovola_task/Features/home/domain/entities/expenses_summay_entity.dart';

class ExpensesSummary {
  final num totalBalance;
  final num totalExpenses;
  final num totalIncome;
  ExpensesSummary({
    required this.totalBalance,
    required this.totalExpenses,
    required this.totalIncome,
  });

  ExpensesSummary copyWith({
    num? totalBalance,
    num? totalExpenses,
    num? totalIncome,
  }) {
    return ExpensesSummary(
      totalBalance: totalBalance ?? this.totalBalance,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      totalIncome: totalIncome ?? this.totalIncome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalBalance': totalBalance,
      'totalExpenses': totalExpenses,
      'totalIncome': totalIncome,
    };
  }

  factory ExpensesSummary.fromMap(Map<String, dynamic> map) {
    return ExpensesSummary(
      totalBalance: map['totalBalance'] as num,
      totalExpenses: map['totalExpenses'] as num,
      totalIncome: map['totalIncome'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpensesSummary.fromJson(String source) =>
      ExpensesSummary.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ExpensesSummary(totalBalance: $totalBalance, totalExpenses: $totalExpenses, totalIncome: $totalIncome)';

  @override
  bool operator ==(covariant ExpensesSummary other) {
    if (identical(this, other)) return true;

    return other.totalBalance == totalBalance &&
        other.totalExpenses == totalExpenses &&
        other.totalIncome == totalIncome;
  }

  @override
  int get hashCode =>
      totalBalance.hashCode ^ totalExpenses.hashCode ^ totalIncome.hashCode;

  ExpensesSummaryEntity toEntity() {
    return ExpensesSummaryEntity(
      totalBalance: totalBalance,
      totalExpenses: totalExpenses,
      totalIncome: totalIncome,
    );
  }
}
