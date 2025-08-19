// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_summary_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExpensesSummaryIsarCollection on Isar {
  IsarCollection<ExpensesSummaryIsar> get expensesSummaryIsars =>
      this.collection();
}

const ExpensesSummaryIsarSchema = CollectionSchema(
  name: r'ExpensesSummaryIsar',
  id: -8499544400796264048,
  properties: {
    r'totalBalance': PropertySchema(
      id: 0,
      name: r'totalBalance',
      type: IsarType.double,
    ),
    r'totalExpenses': PropertySchema(
      id: 1,
      name: r'totalExpenses',
      type: IsarType.double,
    ),
    r'totalIncome': PropertySchema(
      id: 2,
      name: r'totalIncome',
      type: IsarType.double,
    )
  },
  estimateSize: _expensesSummaryIsarEstimateSize,
  serialize: _expensesSummaryIsarSerialize,
  deserialize: _expensesSummaryIsarDeserialize,
  deserializeProp: _expensesSummaryIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _expensesSummaryIsarGetId,
  getLinks: _expensesSummaryIsarGetLinks,
  attach: _expensesSummaryIsarAttach,
  version: '3.1.0+1',
);

int _expensesSummaryIsarEstimateSize(
  ExpensesSummaryIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _expensesSummaryIsarSerialize(
  ExpensesSummaryIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.totalBalance);
  writer.writeDouble(offsets[1], object.totalExpenses);
  writer.writeDouble(offsets[2], object.totalIncome);
}

ExpensesSummaryIsar _expensesSummaryIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExpensesSummaryIsar();
  object.id = id;
  object.totalBalance = reader.readDouble(offsets[0]);
  object.totalExpenses = reader.readDouble(offsets[1]);
  object.totalIncome = reader.readDouble(offsets[2]);
  return object;
}

P _expensesSummaryIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _expensesSummaryIsarGetId(ExpensesSummaryIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _expensesSummaryIsarGetLinks(
    ExpensesSummaryIsar object) {
  return [];
}

void _expensesSummaryIsarAttach(
    IsarCollection<dynamic> col, Id id, ExpensesSummaryIsar object) {
  object.id = id;
}

extension ExpensesSummaryIsarQueryWhereSort
    on QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QWhere> {
  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExpensesSummaryIsarQueryWhere
    on QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QWhereClause> {
  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpensesSummaryIsarQueryFilter on QueryBuilder<ExpensesSummaryIsar,
    ExpensesSummaryIsar, QFilterCondition> {
  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalBalanceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalBalanceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalBalanceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalBalance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalBalanceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalBalance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalExpensesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalExpenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalExpensesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalExpenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalExpensesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalExpenses',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalExpensesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalExpenses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalIncomeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalIncomeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalIncomeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalIncome',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterFilterCondition>
      totalIncomeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalIncome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ExpensesSummaryIsarQueryObject on QueryBuilder<ExpensesSummaryIsar,
    ExpensesSummaryIsar, QFilterCondition> {}

extension ExpensesSummaryIsarQueryLinks on QueryBuilder<ExpensesSummaryIsar,
    ExpensesSummaryIsar, QFilterCondition> {}

extension ExpensesSummaryIsarQuerySortBy
    on QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QSortBy> {
  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      sortByTotalBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBalance', Sort.asc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      sortByTotalBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBalance', Sort.desc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      sortByTotalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.asc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      sortByTotalExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.desc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      sortByTotalIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.asc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      sortByTotalIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.desc);
    });
  }
}

extension ExpensesSummaryIsarQuerySortThenBy
    on QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QSortThenBy> {
  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenByTotalBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBalance', Sort.asc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenByTotalBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBalance', Sort.desc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenByTotalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.asc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenByTotalExpensesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalExpenses', Sort.desc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenByTotalIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.asc);
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QAfterSortBy>
      thenByTotalIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalIncome', Sort.desc);
    });
  }
}

extension ExpensesSummaryIsarQueryWhereDistinct
    on QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QDistinct> {
  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QDistinct>
      distinctByTotalBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalBalance');
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QDistinct>
      distinctByTotalExpenses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalExpenses');
    });
  }

  QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QDistinct>
      distinctByTotalIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalIncome');
    });
  }
}

extension ExpensesSummaryIsarQueryProperty
    on QueryBuilder<ExpensesSummaryIsar, ExpensesSummaryIsar, QQueryProperty> {
  QueryBuilder<ExpensesSummaryIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExpensesSummaryIsar, double, QQueryOperations>
      totalBalanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalBalance');
    });
  }

  QueryBuilder<ExpensesSummaryIsar, double, QQueryOperations>
      totalExpensesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalExpenses');
    });
  }

  QueryBuilder<ExpensesSummaryIsar, double, QQueryOperations>
      totalIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalIncome');
    });
  }
}
