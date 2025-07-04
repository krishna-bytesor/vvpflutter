// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PostItemStruct extends FFFirebaseStruct {
  PostItemStruct({
    int? id,
    String? title,
    String? content,
    String? content2,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _content = content,
        _content2 = content2,
        _language = language,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "content_2" field.
  String? _content2;
  String get content2 => _content2 ?? '';
  set content2(String? val) => _content2 = val;

  bool hasContent2() => _content2 != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  static PostItemStruct fromMap(Map<String, dynamic> data) => PostItemStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        content: data['content'] as String?,
        content2: data['content_2'] as String?,
        language: data['language'] as String?,
      );

  static PostItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'content': _content,
        'content_2': _content2,
        'language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'content_2': serializeParam(
          _content2,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        content2: deserializeParam(
          data['content_2'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostItemStruct &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        content2 == other.content2 &&
        language == other.language;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, title, content, content2, language]);
}

PostItemStruct createPostItemStruct({
  int? id,
  String? title,
  String? content,
  String? content2,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostItemStruct(
      id: id,
      title: title,
      content: content,
      content2: content2,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostItemStruct? updatePostItemStruct(
  PostItemStruct? postItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostItemStructData(
  Map<String, dynamic> firestoreData,
  PostItemStruct? postItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postItem == null) {
    return;
  }
  if (postItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postItemData = getPostItemFirestoreData(postItem, forFieldValue);
  final nestedData = postItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostItemFirestoreData(
  PostItemStruct? postItem, [
  bool forFieldValue = false,
]) {
  if (postItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postItem.toMap());

  // Add any Firestore field values
  postItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostItemListFirestoreData(
  List<PostItemStruct>? postItems,
) =>
    postItems?.map((e) => getPostItemFirestoreData(e, true)).toList() ?? [];
