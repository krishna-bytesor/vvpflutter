import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessagesRecord extends FirestoreRecord {
  ChatMessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "userid" field.
  int? _userid;
  int get userid => _userid ?? 0;
  bool hasUserid() => _userid != null;

  // "chatid" field.
  int? _chatid;
  int get chatid => _chatid ?? 0;
  bool hasChatid() => _chatid != null;

  // "discipleRef" field.
  DocumentReference? _discipleRef;
  DocumentReference? get discipleRef => _discipleRef;
  bool hasDiscipleRef() => _discipleRef != null;

  // "notification" field.
  bool? _notification;
  bool get notification => _notification ?? false;
  bool hasNotification() => _notification != null;

  // "messages" field.
  List<ChatMessagesStruct>? _messages;
  List<ChatMessagesStruct> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "swamiNotification" field.
  bool? _swamiNotification;
  bool get swamiNotification => _swamiNotification ?? false;
  bool hasSwamiNotification() => _swamiNotification != null;

  // "swamiRef" field.
  DocumentReference? _swamiRef;
  DocumentReference? get swamiRef => _swamiRef;
  bool hasSwamiRef() => _swamiRef != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userUM" field.
  int? _userUM;
  int get userUM => _userUM ?? 0;
  bool hasUserUM() => _userUM != null;

  // "swamiUM" field.
  int? _swamiUM;
  int get swamiUM => _swamiUM ?? 0;
  bool hasSwamiUM() => _swamiUM != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _userid = castToType<int>(snapshotData['userid']);
    _chatid = castToType<int>(snapshotData['chatid']);
    _discipleRef = snapshotData['discipleRef'] as DocumentReference?;
    _notification = snapshotData['notification'] as bool?;
    _messages = getStructList(
      snapshotData['messages'],
      ChatMessagesStruct.fromMap,
    );
    _swamiNotification = snapshotData['swamiNotification'] as bool?;
    _swamiRef = snapshotData['swamiRef'] as DocumentReference?;
    _userName = snapshotData['UserName'] as String?;
    _userUM = castToType<int>(snapshotData['userUM']);
    _swamiUM = castToType<int>(snapshotData['swamiUM']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat_messages');

  static Stream<ChatMessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessagesRecord.fromSnapshot(s));

  static Future<ChatMessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessagesRecord.fromSnapshot(s));

  static ChatMessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatMessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessagesRecordData({
  String? text,
  DateTime? timestamp,
  int? userid,
  int? chatid,
  DocumentReference? discipleRef,
  bool? notification,
  bool? swamiNotification,
  DocumentReference? swamiRef,
  String? userName,
  int? userUM,
  int? swamiUM,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'timestamp': timestamp,
      'userid': userid,
      'chatid': chatid,
      'discipleRef': discipleRef,
      'notification': notification,
      'swamiNotification': swamiNotification,
      'swamiRef': swamiRef,
      'UserName': userName,
      'userUM': userUM,
      'swamiUM': swamiUM,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessagesRecordDocumentEquality
    implements Equality<ChatMessagesRecord> {
  const ChatMessagesRecordDocumentEquality();

  @override
  bool equals(ChatMessagesRecord? e1, ChatMessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.text == e2?.text &&
        e1?.timestamp == e2?.timestamp &&
        e1?.userid == e2?.userid &&
        e1?.chatid == e2?.chatid &&
        e1?.discipleRef == e2?.discipleRef &&
        e1?.notification == e2?.notification &&
        listEquality.equals(e1?.messages, e2?.messages) &&
        e1?.swamiNotification == e2?.swamiNotification &&
        e1?.swamiRef == e2?.swamiRef &&
        e1?.userName == e2?.userName &&
        e1?.userUM == e2?.userUM &&
        e1?.swamiUM == e2?.swamiUM;
  }

  @override
  int hash(ChatMessagesRecord? e) => const ListEquality().hash([
        e?.text,
        e?.timestamp,
        e?.userid,
        e?.chatid,
        e?.discipleRef,
        e?.notification,
        e?.messages,
        e?.swamiNotification,
        e?.swamiRef,
        e?.userName,
        e?.userUM,
        e?.swamiUM
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessagesRecord;
}
