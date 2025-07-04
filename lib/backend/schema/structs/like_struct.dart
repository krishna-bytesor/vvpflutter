// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LikeStruct extends FFFirebaseStruct {
  LikeStruct({
    String? category,
    int? id,
    bool? like,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _id = id,
        _like = like,
        super(firestoreUtilData);

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "like" field.
  bool? _like;
  bool get like => _like ?? false;
  set like(bool? val) => _like = val;

  bool hasLike() => _like != null;

  static LikeStruct fromMap(Map<String, dynamic> data) => LikeStruct(
        category: data['category'] as String?,
        id: castToType<int>(data['id']),
        like: data['like'] as bool?,
      );

  static LikeStruct? maybeFromMap(dynamic data) =>
      data is Map ? LikeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'id': _id,
        'like': _like,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'like': serializeParam(
          _like,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LikeStruct fromSerializableMap(Map<String, dynamic> data) =>
      LikeStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        like: deserializeParam(
          data['like'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'LikeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LikeStruct &&
        category == other.category &&
        id == other.id &&
        like == other.like;
  }

  @override
  int get hashCode => const ListEquality().hash([category, id, like]);
}

LikeStruct createLikeStruct({
  String? category,
  int? id,
  bool? like,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LikeStruct(
      category: category,
      id: id,
      like: like,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LikeStruct? updateLikeStruct(
  LikeStruct? likeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    likeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLikeStructData(
  Map<String, dynamic> firestoreData,
  LikeStruct? likeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (likeStruct == null) {
    return;
  }
  if (likeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && likeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final likeStructData = getLikeFirestoreData(likeStruct, forFieldValue);
  final nestedData = likeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = likeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLikeFirestoreData(
  LikeStruct? likeStruct, [
  bool forFieldValue = false,
]) {
  if (likeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(likeStruct.toMap());

  // Add any Firestore field values
  likeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLikeListFirestoreData(
  List<LikeStruct>? likeStructs,
) =>
    likeStructs?.map((e) => getLikeFirestoreData(e, true)).toList() ?? [];
