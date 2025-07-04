// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AudioStruct extends FFFirebaseStruct {
  AudioStruct({
    int? id,
    String? audioFile,
    String? audioLabel,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _audioFile = audioFile,
        _audioLabel = audioLabel,
        _image = image,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "audio_file" field.
  String? _audioFile;
  String get audioFile => _audioFile ?? '';
  set audioFile(String? val) => _audioFile = val;

  bool hasAudioFile() => _audioFile != null;

  // "audio_label" field.
  String? _audioLabel;
  String get audioLabel => _audioLabel ?? '';
  set audioLabel(String? val) => _audioLabel = val;

  bool hasAudioLabel() => _audioLabel != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static AudioStruct fromMap(Map<String, dynamic> data) => AudioStruct(
        id: castToType<int>(data['id']),
        audioFile: data['audio_file'] as String?,
        audioLabel: data['audio_label'] as String?,
        image: data['image'] as String?,
      );

  static AudioStruct? maybeFromMap(dynamic data) =>
      data is Map ? AudioStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'audio_file': _audioFile,
        'audio_label': _audioLabel,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'audio_file': serializeParam(
          _audioFile,
          ParamType.String,
        ),
        'audio_label': serializeParam(
          _audioLabel,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static AudioStruct fromSerializableMap(Map<String, dynamic> data) =>
      AudioStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        audioFile: deserializeParam(
          data['audio_file'],
          ParamType.String,
          false,
        ),
        audioLabel: deserializeParam(
          data['audio_label'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AudioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AudioStruct &&
        id == other.id &&
        audioFile == other.audioFile &&
        audioLabel == other.audioLabel &&
        image == other.image;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, audioFile, audioLabel, image]);
}

AudioStruct createAudioStruct({
  int? id,
  String? audioFile,
  String? audioLabel,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AudioStruct(
      id: id,
      audioFile: audioFile,
      audioLabel: audioLabel,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AudioStruct? updateAudioStruct(
  AudioStruct? audio, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    audio
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAudioStructData(
  Map<String, dynamic> firestoreData,
  AudioStruct? audio,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (audio == null) {
    return;
  }
  if (audio.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && audio.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final audioData = getAudioFirestoreData(audio, forFieldValue);
  final nestedData = audioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = audio.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAudioFirestoreData(
  AudioStruct? audio, [
  bool forFieldValue = false,
]) {
  if (audio == null) {
    return {};
  }
  final firestoreData = mapToFirestore(audio.toMap());

  // Add any Firestore field values
  audio.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAudioListFirestoreData(
  List<AudioStruct>? audios,
) =>
    audios?.map((e) => getAudioFirestoreData(e, true)).toList() ?? [];
