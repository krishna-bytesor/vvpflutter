// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FilterStruct extends FFFirebaseStruct {
  FilterStruct({
    String? festival,
    String? place,
    String? year,
    String? language,
    String? shloka,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _festival = festival,
        _place = place,
        _year = year,
        _language = language,
        _shloka = shloka,
        super(firestoreUtilData);

  // "festival" field.
  String? _festival;
  String get festival => _festival ?? '';
  set festival(String? val) => _festival = val;

  bool hasFestival() => _festival != null;

  // "Place" field.
  String? _place;
  String get place => _place ?? '';
  set place(String? val) => _place = val;

  bool hasPlace() => _place != null;

  // "Year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;

  bool hasYear() => _year != null;

  // "Language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  // "shloka" field.
  String? _shloka;
  String get shloka => _shloka ?? '';
  set shloka(String? val) => _shloka = val;

  bool hasShloka() => _shloka != null;

  static FilterStruct fromMap(Map<String, dynamic> data) => FilterStruct(
        festival: data['festival'] as String?,
        place: data['Place'] as String?,
        year: data['Year'] as String?,
        language: data['Language'] as String?,
        shloka: data['shloka'] as String?,
      );

  static FilterStruct? maybeFromMap(dynamic data) =>
      data is Map ? FilterStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'festival': _festival,
        'Place': _place,
        'Year': _year,
        'Language': _language,
        'shloka': _shloka,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'festival': serializeParam(
          _festival,
          ParamType.String,
        ),
        'Place': serializeParam(
          _place,
          ParamType.String,
        ),
        'Year': serializeParam(
          _year,
          ParamType.String,
        ),
        'Language': serializeParam(
          _language,
          ParamType.String,
        ),
        'shloka': serializeParam(
          _shloka,
          ParamType.String,
        ),
      }.withoutNulls;

  static FilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterStruct(
        festival: deserializeParam(
          data['festival'],
          ParamType.String,
          false,
        ),
        place: deserializeParam(
          data['Place'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['Year'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['Language'],
          ParamType.String,
          false,
        ),
        shloka: deserializeParam(
          data['shloka'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterStruct &&
        festival == other.festival &&
        place == other.place &&
        year == other.year &&
        language == other.language &&
        shloka == other.shloka;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([festival, place, year, language, shloka]);
}

FilterStruct createFilterStruct({
  String? festival,
  String? place,
  String? year,
  String? language,
  String? shloka,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterStruct(
      festival: festival,
      place: place,
      year: year,
      language: language,
      shloka: shloka,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilterStruct? updateFilterStruct(
  FilterStruct? filter, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filter
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilterStructData(
  Map<String, dynamic> firestoreData,
  FilterStruct? filter,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filter == null) {
    return;
  }
  if (filter.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filter.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterData = getFilterFirestoreData(filter, forFieldValue);
  final nestedData = filterData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filter.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilterFirestoreData(
  FilterStruct? filter, [
  bool forFieldValue = false,
]) {
  if (filter == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filter.toMap());

  // Add any Firestore field values
  filter.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterListFirestoreData(
  List<FilterStruct>? filters,
) =>
    filters?.map((e) => getFilterFirestoreData(e, true)).toList() ?? [];
