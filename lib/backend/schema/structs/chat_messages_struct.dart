// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesStruct extends FFFirebaseStruct {
  ChatMessagesStruct({
    String? message,
    int? userId,
    DateTime? time,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _message = message,
        _userId = userId,
        _time = time,
        super(firestoreUtilData);

  // "Message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "UserId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  static ChatMessagesStruct fromMap(Map<String, dynamic> data) =>
      ChatMessagesStruct(
        message: data['Message'] as String?,
        userId: castToType<int>(data['UserId']),
        time: data['time'] as DateTime?,
      );

  static ChatMessagesStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessagesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Message': _message,
        'UserId': _userId,
        'time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Message': serializeParam(
          _message,
          ParamType.String,
        ),
        'UserId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ChatMessagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessagesStruct(
        message: deserializeParam(
          data['Message'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['UserId'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesStruct &&
        message == other.message &&
        userId == other.userId &&
        time == other.time;
  }

  @override
  int get hashCode => const ListEquality().hash([message, userId, time]);
}

ChatMessagesStruct createChatMessagesStruct({
  String? message,
  int? userId,
  DateTime? time,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMessagesStruct(
      message: message,
      userId: userId,
      time: time,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMessagesStruct? updateChatMessagesStruct(
  ChatMessagesStruct? chatMessages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMessages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMessagesStructData(
  Map<String, dynamic> firestoreData,
  ChatMessagesStruct? chatMessages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessages == null) {
    return;
  }
  if (chatMessages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMessages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessagesData =
      getChatMessagesFirestoreData(chatMessages, forFieldValue);
  final nestedData =
      chatMessagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMessages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMessagesFirestoreData(
  ChatMessagesStruct? chatMessages, [
  bool forFieldValue = false,
]) {
  if (chatMessages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMessages.toMap());

  // Add any Firestore field values
  chatMessages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessagesListFirestoreData(
  List<ChatMessagesStruct>? chatMessagess,
) =>
    chatMessagess?.map((e) => getChatMessagesFirestoreData(e, true)).toList() ??
    [];
