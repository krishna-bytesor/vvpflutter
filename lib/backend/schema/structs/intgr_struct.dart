// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IntgrStruct extends FFFirebaseStruct {
  IntgrStruct({
    int? intId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _intId = intId,
        super(firestoreUtilData);

  // "intId" field.
  int? _intId;
  int get intId => _intId ?? 0;
  set intId(int? val) => _intId = val;

  void incrementIntId(int amount) => intId = intId + amount;

  bool hasIntId() => _intId != null;

  static IntgrStruct fromMap(Map<String, dynamic> data) => IntgrStruct(
        intId: castToType<int>(data['intId']),
      );

  static IntgrStruct? maybeFromMap(dynamic data) =>
      data is Map ? IntgrStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'intId': _intId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'intId': serializeParam(
          _intId,
          ParamType.int,
        ),
      }.withoutNulls;

  static IntgrStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntgrStruct(
        intId: deserializeParam(
          data['intId'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IntgrStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntgrStruct && intId == other.intId;
  }

  @override
  int get hashCode => const ListEquality().hash([intId]);
}

IntgrStruct createIntgrStruct({
  int? intId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IntgrStruct(
      intId: intId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IntgrStruct? updateIntgrStruct(
  IntgrStruct? intgr, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    intgr
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIntgrStructData(
  Map<String, dynamic> firestoreData,
  IntgrStruct? intgr,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (intgr == null) {
    return;
  }
  if (intgr.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && intgr.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final intgrData = getIntgrFirestoreData(intgr, forFieldValue);
  final nestedData = intgrData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = intgr.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIntgrFirestoreData(
  IntgrStruct? intgr, [
  bool forFieldValue = false,
]) {
  if (intgr == null) {
    return {};
  }
  final firestoreData = mapToFirestore(intgr.toMap());

  // Add any Firestore field values
  intgr.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIntgrListFirestoreData(
  List<IntgrStruct>? intgrs,
) =>
    intgrs?.map((e) => getIntgrFirestoreData(e, true)).toList() ?? [];
