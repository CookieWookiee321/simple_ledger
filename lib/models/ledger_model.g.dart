// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetLedgerEntryCollection on Isar {
  IsarCollection<LedgerEntry> get ledgerEntrys => this.collection();
}

const LedgerEntrySchema = CollectionSchema(
  name: r'LedgerEntry',
  id: 3671908379858735046,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'transactions': PropertySchema(
      id: 1,
      name: r'transactions',
      type: IsarType.objectList,
      target: r'TransactionEntry',
    )
  },
  estimateSize: _ledgerEntryEstimateSize,
  serialize: _ledgerEntrySerialize,
  deserialize: _ledgerEntryDeserialize,
  deserializeProp: _ledgerEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'TransactionEntry': TransactionEntrySchema},
  getId: _ledgerEntryGetId,
  getLinks: _ledgerEntryGetLinks,
  attach: _ledgerEntryAttach,
  version: '3.0.2',
);

int _ledgerEntryEstimateSize(
  LedgerEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.transactions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[TransactionEntry]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              TransactionEntrySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _ledgerEntrySerialize(
  LedgerEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeObjectList<TransactionEntry>(
    offsets[1],
    allOffsets,
    TransactionEntrySchema.serialize,
    object.transactions,
  );
}

LedgerEntry _ledgerEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LedgerEntry();
  object.amount = reader.readDoubleOrNull(offsets[0]);
  object.id = id;
  object.transactions = reader.readObjectList<TransactionEntry>(
    offsets[1],
    TransactionEntrySchema.deserialize,
    allOffsets,
    TransactionEntry(),
  );
  return object;
}

P _ledgerEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<TransactionEntry>(
        offset,
        TransactionEntrySchema.deserialize,
        allOffsets,
        TransactionEntry(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ledgerEntryGetId(LedgerEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ledgerEntryGetLinks(LedgerEntry object) {
  return [];
}

void _ledgerEntryAttach(
    IsarCollection<dynamic> col, Id id, LedgerEntry object) {
  object.id = id;
}

extension LedgerEntryQueryWhereSort
    on QueryBuilder<LedgerEntry, LedgerEntry, QWhere> {
  QueryBuilder<LedgerEntry, LedgerEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension LedgerEntryQueryWhere
    on QueryBuilder<LedgerEntry, LedgerEntry, QWhereClause> {
  QueryBuilder<LedgerEntry, LedgerEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterWhereClause> idBetween(
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

extension LedgerEntryQueryFilter
    on QueryBuilder<LedgerEntry, LedgerEntry, QFilterCondition> {
  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> amountEqualTo(
    double? value, {
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      amountGreaterThan(
    double? value, {
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> amountLessThan(
    double? value, {
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> amountBetween(
    double? lower,
    double? upper, {
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactions',
      ));
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactions',
      ));
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'transactions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension LedgerEntryQueryObject
    on QueryBuilder<LedgerEntry, LedgerEntry, QFilterCondition> {
  QueryBuilder<LedgerEntry, LedgerEntry, QAfterFilterCondition>
      transactionsElement(FilterQuery<TransactionEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'transactions');
    });
  }
}

extension LedgerEntryQueryLinks
    on QueryBuilder<LedgerEntry, LedgerEntry, QFilterCondition> {}

extension LedgerEntryQuerySortBy
    on QueryBuilder<LedgerEntry, LedgerEntry, QSortBy> {
  QueryBuilder<LedgerEntry, LedgerEntry, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }
}

extension LedgerEntryQuerySortThenBy
    on QueryBuilder<LedgerEntry, LedgerEntry, QSortThenBy> {
  QueryBuilder<LedgerEntry, LedgerEntry, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LedgerEntry, LedgerEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension LedgerEntryQueryWhereDistinct
    on QueryBuilder<LedgerEntry, LedgerEntry, QDistinct> {
  QueryBuilder<LedgerEntry, LedgerEntry, QDistinct> distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }
}

extension LedgerEntryQueryProperty
    on QueryBuilder<LedgerEntry, LedgerEntry, QQueryProperty> {
  QueryBuilder<LedgerEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LedgerEntry, double?, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<LedgerEntry, List<TransactionEntry>?, QQueryOperations>
      transactionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactions');
    });
  }
}
