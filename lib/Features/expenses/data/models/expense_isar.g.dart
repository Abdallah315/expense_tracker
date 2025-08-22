// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExpenseIsarCollection on Isar {
  IsarCollection<ExpenseIsar> get expenseIsars => this.collection();
}

const ExpenseIsarSchema = CollectionSchema(
  name: r'ExpenseIsar',
  id: -7634676410498585483,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'amountInUSD': PropertySchema(
      id: 1,
      name: r'amountInUSD',
      type: IsarType.double,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.byte,
      enumMap: _ExpenseIsarcategoryEnumValueMap,
    ),
    r'currency': PropertySchema(
      id: 3,
      name: r'currency',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 4,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'exchangeRate': PropertySchema(
      id: 5,
      name: r'exchangeRate',
      type: IsarType.double,
    ),
    r'iconDataJson': PropertySchema(
      id: 6,
      name: r'iconDataJson',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 7,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _expenseIsarEstimateSize,
  serialize: _expenseIsarSerialize,
  deserialize: _expenseIsarDeserialize,
  deserializeProp: _expenseIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _expenseIsarGetId,
  getLinks: _expenseIsarGetLinks,
  attach: _expenseIsarAttach,
  version: '3.1.0+1',
);

int _expenseIsarEstimateSize(
  ExpenseIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.currency.length * 3;
  bytesCount += 3 + object.iconDataJson.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _expenseIsarSerialize(
  ExpenseIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeDouble(offsets[1], object.amountInUSD);
  writer.writeByte(offsets[2], object.category.index);
  writer.writeString(offsets[3], object.currency);
  writer.writeDateTime(offsets[4], object.date);
  writer.writeDouble(offsets[5], object.exchangeRate);
  writer.writeString(offsets[6], object.iconDataJson);
  writer.writeString(offsets[7], object.type);
}

ExpenseIsar _expenseIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExpenseIsar();
  object.amount = reader.readDouble(offsets[0]);
  object.amountInUSD = reader.readDouble(offsets[1]);
  object.category =
      _ExpenseIsarcategoryValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          CategoriesEnum.groceries;
  object.currency = reader.readString(offsets[3]);
  object.date = reader.readDateTime(offsets[4]);
  object.exchangeRate = reader.readDouble(offsets[5]);
  object.iconDataJson = reader.readString(offsets[6]);
  object.id = id;
  object.type = reader.readString(offsets[7]);
  return object;
}

P _expenseIsarDeserializeProp<P>(
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
      return (_ExpenseIsarcategoryValueEnumMap[reader.readByteOrNull(offset)] ??
          CategoriesEnum.groceries) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ExpenseIsarcategoryEnumValueMap = {
  'groceries': 0,
  'shopping': 1,
  'entertainment': 2,
  'gas': 3,
  'transport': 4,
  'newsPaper': 5,
  'rent': 6,
  'other': 7,
};
const _ExpenseIsarcategoryValueEnumMap = {
  0: CategoriesEnum.groceries,
  1: CategoriesEnum.shopping,
  2: CategoriesEnum.entertainment,
  3: CategoriesEnum.gas,
  4: CategoriesEnum.transport,
  5: CategoriesEnum.newsPaper,
  6: CategoriesEnum.rent,
  7: CategoriesEnum.other,
};

Id _expenseIsarGetId(ExpenseIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _expenseIsarGetLinks(ExpenseIsar object) {
  return [];
}

void _expenseIsarAttach(
    IsarCollection<dynamic> col, Id id, ExpenseIsar object) {
  object.id = id;
}

extension ExpenseIsarQueryWhereSort
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QWhere> {
  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExpenseIsarQueryWhere
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QWhereClause> {
  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterWhereClause> idBetween(
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

extension ExpenseIsarQueryFilter
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QFilterCondition> {
  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> amountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      amountInUSDEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amountInUSD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      amountInUSDGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amountInUSD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      amountInUSDLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amountInUSD',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      amountInUSDBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amountInUSD',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> categoryEqualTo(
      CategoriesEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      categoryGreaterThan(
    CategoriesEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      categoryLessThan(
    CategoriesEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> categoryBetween(
    CategoriesEnum lower,
    CategoriesEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> currencyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      currencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      currencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> currencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currency',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      currencyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      currencyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      currencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currency',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> currencyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currency',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currency',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      exchangeRateEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exchangeRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      exchangeRateGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exchangeRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      exchangeRateLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exchangeRate',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      exchangeRateBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exchangeRate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconDataJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconDataJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconDataJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconDataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      iconDataJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconDataJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ExpenseIsarQueryObject
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QFilterCondition> {}

extension ExpenseIsarQueryLinks
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QFilterCondition> {}

extension ExpenseIsarQuerySortBy
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QSortBy> {
  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByAmountInUSD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountInUSD', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByAmountInUSDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountInUSD', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByExchangeRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeRate', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy>
      sortByExchangeRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeRate', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByIconDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconDataJson', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy>
      sortByIconDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconDataJson', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ExpenseIsarQuerySortThenBy
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QSortThenBy> {
  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByAmountInUSD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountInUSD', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByAmountInUSDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amountInUSD', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByExchangeRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeRate', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy>
      thenByExchangeRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'exchangeRate', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByIconDataJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconDataJson', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy>
      thenByIconDataJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconDataJson', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ExpenseIsarQueryWhereDistinct
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> {
  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByAmountInUSD() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amountInUSD');
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByCurrency(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByExchangeRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exchangeRate');
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByIconDataJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconDataJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ExpenseIsar, ExpenseIsar, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ExpenseIsarQueryProperty
    on QueryBuilder<ExpenseIsar, ExpenseIsar, QQueryProperty> {
  QueryBuilder<ExpenseIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExpenseIsar, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<ExpenseIsar, double, QQueryOperations> amountInUSDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amountInUSD');
    });
  }

  QueryBuilder<ExpenseIsar, CategoriesEnum, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<ExpenseIsar, String, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<ExpenseIsar, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ExpenseIsar, double, QQueryOperations> exchangeRateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exchangeRate');
    });
  }

  QueryBuilder<ExpenseIsar, String, QQueryOperations> iconDataJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconDataJson');
    });
  }

  QueryBuilder<ExpenseIsar, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
