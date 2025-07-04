import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Liked = prefs
              .getStringList('ff_Liked')
              ?.map((x) {
                try {
                  return LikeStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Liked;
    });
    _safeInit(() {
      _FavouriteList = prefs.getStringList('ff_FavouriteList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _FavouriteList;
    });
    _safeInit(() {
      _PostTypeList = prefs.getStringList('ff_PostTypeList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _PostTypeList;
    });
    _safeInit(() {
      _Token = prefs.getString('ff_Token') ?? _Token;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_User')) {
        try {
          _User = jsonDecode(prefs.getString('ff_User') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _version = prefs.getString('ff_version') ?? _version;
    });
    _safeInit(() {
      _LanguageSet = prefs.getBool('ff_LanguageSet') ?? _LanguageSet;
    });
    _safeInit(() {
      _PersonalPlaylist = prefs.getStringList('ff_PersonalPlaylist')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _PersonalPlaylist;
    });
    _safeInit(() {
      _DownloadedFiles = prefs.getStringList('ff_DownloadedFiles')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _DownloadedFiles;
    });
    _safeInit(() {
      _currentPosition =
          prefs.getDouble('ff_currentPosition') ?? _currentPosition;
    });
    _safeInit(() {
      _totalDuration = prefs.getDouble('ff_totalDuration') ?? _totalDuration;
    });
    _safeInit(() {
      _currentDisplayPosition = prefs.getString('ff_currentDisplayPosition') ??
          _currentDisplayPosition;
    });
    _safeInit(() {
      _totalDisplayPosition =
          prefs.getString('ff_totalDisplayPosition') ?? _totalDisplayPosition;
    });
    _safeInit(() {
      _isPlaying = prefs.getBool('ff_isPlaying') ?? _isPlaying;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_audioPlayer')) {
        try {
          _audioPlayer = jsonDecode(prefs.getString('ff_audioPlayer') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _language = prefs.getString('ff_language') ?? _language;
    });
    _safeInit(() {
      _CountryCode = prefs.getString('ff_CountryCode') ?? _CountryCode;
    });
    _safeInit(() {
      _Notes = prefs.getStringList('ff_Notes')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _Notes;
    });
    _safeInit(() {
      _NotificationBool =
          prefs.getBool('ff_NotificationBool') ?? _NotificationBool;
    });
    _safeInit(() {
      _PledgeSubmitted =
          prefs.getBool('ff_PledgeSubmitted') ?? _PledgeSubmitted;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<LikeStruct> _Liked = [];
  List<LikeStruct> get Liked => _Liked;
  set Liked(List<LikeStruct> value) {
    _Liked = value;
    prefs.setStringList('ff_Liked', value.map((x) => x.serialize()).toList());
  }

  void addToLiked(LikeStruct value) {
    Liked.add(value);
    prefs.setStringList('ff_Liked', _Liked.map((x) => x.serialize()).toList());
  }

  void removeFromLiked(LikeStruct value) {
    Liked.remove(value);
    prefs.setStringList('ff_Liked', _Liked.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromLiked(int index) {
    Liked.removeAt(index);
    prefs.setStringList('ff_Liked', _Liked.map((x) => x.serialize()).toList());
  }

  void updateLikedAtIndex(
    int index,
    LikeStruct Function(LikeStruct) updateFn,
  ) {
    Liked[index] = updateFn(_Liked[index]);
    prefs.setStringList('ff_Liked', _Liked.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInLiked(int index, LikeStruct value) {
    Liked.insert(index, value);
    prefs.setStringList('ff_Liked', _Liked.map((x) => x.serialize()).toList());
  }

  List<dynamic> _FavouriteList = [];
  List<dynamic> get FavouriteList => _FavouriteList;
  set FavouriteList(List<dynamic> value) {
    _FavouriteList = value;
    prefs.setStringList(
        'ff_FavouriteList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToFavouriteList(dynamic value) {
    FavouriteList.add(value);
    prefs.setStringList(
        'ff_FavouriteList', _FavouriteList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromFavouriteList(dynamic value) {
    FavouriteList.remove(value);
    prefs.setStringList(
        'ff_FavouriteList', _FavouriteList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromFavouriteList(int index) {
    FavouriteList.removeAt(index);
    prefs.setStringList(
        'ff_FavouriteList', _FavouriteList.map((x) => jsonEncode(x)).toList());
  }

  void updateFavouriteListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    FavouriteList[index] = updateFn(_FavouriteList[index]);
    prefs.setStringList(
        'ff_FavouriteList', _FavouriteList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInFavouriteList(int index, dynamic value) {
    FavouriteList.insert(index, value);
    prefs.setStringList(
        'ff_FavouriteList', _FavouriteList.map((x) => jsonEncode(x)).toList());
  }

  dynamic _currentAudioTrack;
  dynamic get currentAudioTrack => _currentAudioTrack;
  set currentAudioTrack(dynamic value) {
    _currentAudioTrack = value;
  }

  String _audioUrl = '';
  String get audioUrl => _audioUrl;
  set audioUrl(String value) {
    _audioUrl = value;
  }

  List<dynamic> _PostTypeList = [];
  List<dynamic> get PostTypeList => _PostTypeList;
  set PostTypeList(List<dynamic> value) {
    _PostTypeList = value;
    prefs.setStringList(
        'ff_PostTypeList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToPostTypeList(dynamic value) {
    PostTypeList.add(value);
    prefs.setStringList(
        'ff_PostTypeList', _PostTypeList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPostTypeList(dynamic value) {
    PostTypeList.remove(value);
    prefs.setStringList(
        'ff_PostTypeList', _PostTypeList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromPostTypeList(int index) {
    PostTypeList.removeAt(index);
    prefs.setStringList(
        'ff_PostTypeList', _PostTypeList.map((x) => jsonEncode(x)).toList());
  }

  void updatePostTypeListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    PostTypeList[index] = updateFn(_PostTypeList[index]);
    prefs.setStringList(
        'ff_PostTypeList', _PostTypeList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInPostTypeList(int index, dynamic value) {
    PostTypeList.insert(index, value);
    prefs.setStringList(
        'ff_PostTypeList', _PostTypeList.map((x) => jsonEncode(x)).toList());
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String value) {
    _Token = value;
    prefs.setString('ff_Token', value);
  }

  bool _showPlayList = false;
  bool get showPlayList => _showPlayList;
  set showPlayList(bool value) {
    _showPlayList = value;
  }

  dynamic _User;
  dynamic get User => _User;
  set User(dynamic value) {
    _User = value;
    prefs.setString('ff_User', jsonEncode(value));
  }

  String _version = '';
  String get version => _version;
  set version(String value) {
    _version = value;
    prefs.setString('ff_version', value);
  }

  bool _LanguageSet = false;
  bool get LanguageSet => _LanguageSet;
  set LanguageSet(bool value) {
    _LanguageSet = value;
    prefs.setBool('ff_LanguageSet', value);
  }

  List<dynamic> _PersonalPlaylist = [jsonDecode('{}')];
  List<dynamic> get PersonalPlaylist => _PersonalPlaylist;
  set PersonalPlaylist(List<dynamic> value) {
    _PersonalPlaylist = value;
    prefs.setStringList(
        'ff_PersonalPlaylist', value.map((x) => jsonEncode(x)).toList());
  }

  void addToPersonalPlaylist(dynamic value) {
    PersonalPlaylist.add(value);
    prefs.setStringList('ff_PersonalPlaylist',
        _PersonalPlaylist.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPersonalPlaylist(dynamic value) {
    PersonalPlaylist.remove(value);
    prefs.setStringList('ff_PersonalPlaylist',
        _PersonalPlaylist.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromPersonalPlaylist(int index) {
    PersonalPlaylist.removeAt(index);
    prefs.setStringList('ff_PersonalPlaylist',
        _PersonalPlaylist.map((x) => jsonEncode(x)).toList());
  }

  void updatePersonalPlaylistAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    PersonalPlaylist[index] = updateFn(_PersonalPlaylist[index]);
    prefs.setStringList('ff_PersonalPlaylist',
        _PersonalPlaylist.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInPersonalPlaylist(int index, dynamic value) {
    PersonalPlaylist.insert(index, value);
    prefs.setStringList('ff_PersonalPlaylist',
        _PersonalPlaylist.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _AudioPlayerList = [];
  List<dynamic> get AudioPlayerList => _AudioPlayerList;
  set AudioPlayerList(List<dynamic> value) {
    _AudioPlayerList = value;
  }

  void addToAudioPlayerList(dynamic value) {
    AudioPlayerList.add(value);
  }

  void removeFromAudioPlayerList(dynamic value) {
    AudioPlayerList.remove(value);
  }

  void removeAtIndexFromAudioPlayerList(int index) {
    AudioPlayerList.removeAt(index);
  }

  void updateAudioPlayerListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    AudioPlayerList[index] = updateFn(_AudioPlayerList[index]);
  }

  void insertAtIndexInAudioPlayerList(int index, dynamic value) {
    AudioPlayerList.insert(index, value);
  }

  int _AudioPlayerSongIndex = 0;
  int get AudioPlayerSongIndex => _AudioPlayerSongIndex;
  set AudioPlayerSongIndex(int value) {
    _AudioPlayerSongIndex = value;
  }

  List<dynamic> _DownloadedFiles = [];
  List<dynamic> get DownloadedFiles => _DownloadedFiles;
  set DownloadedFiles(List<dynamic> value) {
    _DownloadedFiles = value;
    prefs.setStringList(
        'ff_DownloadedFiles', value.map((x) => jsonEncode(x)).toList());
  }

  void addToDownloadedFiles(dynamic value) {
    DownloadedFiles.add(value);
    prefs.setStringList('ff_DownloadedFiles',
        _DownloadedFiles.map((x) => jsonEncode(x)).toList());
  }

  void removeFromDownloadedFiles(dynamic value) {
    DownloadedFiles.remove(value);
    prefs.setStringList('ff_DownloadedFiles',
        _DownloadedFiles.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromDownloadedFiles(int index) {
    DownloadedFiles.removeAt(index);
    prefs.setStringList('ff_DownloadedFiles',
        _DownloadedFiles.map((x) => jsonEncode(x)).toList());
  }

  void updateDownloadedFilesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    DownloadedFiles[index] = updateFn(_DownloadedFiles[index]);
    prefs.setStringList('ff_DownloadedFiles',
        _DownloadedFiles.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInDownloadedFiles(int index, dynamic value) {
    DownloadedFiles.insert(index, value);
    prefs.setStringList('ff_DownloadedFiles',
        _DownloadedFiles.map((x) => jsonEncode(x)).toList());
  }

  double _currentPosition = 0.0;
  double get currentPosition => _currentPosition;
  set currentPosition(double value) {
    _currentPosition = value;
    prefs.setDouble('ff_currentPosition', value);
  }

  double _totalDuration = 0.0;
  double get totalDuration => _totalDuration;
  set totalDuration(double value) {
    _totalDuration = value;
    prefs.setDouble('ff_totalDuration', value);
  }

  String _currentDisplayPosition = '';
  String get currentDisplayPosition => _currentDisplayPosition;
  set currentDisplayPosition(String value) {
    _currentDisplayPosition = value;
    prefs.setString('ff_currentDisplayPosition', value);
  }

  String _totalDisplayPosition = '';
  String get totalDisplayPosition => _totalDisplayPosition;
  set totalDisplayPosition(String value) {
    _totalDisplayPosition = value;
    prefs.setString('ff_totalDisplayPosition', value);
  }

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  set isPlaying(bool value) {
    _isPlaying = value;
    prefs.setBool('ff_isPlaying', value);
  }

  dynamic _audioPlayer;
  dynamic get audioPlayer => _audioPlayer;
  set audioPlayer(dynamic value) {
    _audioPlayer = value;
    prefs.setString('ff_audioPlayer', jsonEncode(value));
  }

  bool _Loader = false;
  bool get Loader => _Loader;
  set Loader(bool value) {
    _Loader = value;
  }

  String _language = '';
  String get language => _language;
  set language(String value) {
    _language = value;
    prefs.setString('ff_language', value);
  }

  String _CountryCode = '';
  String get CountryCode => _CountryCode;
  set CountryCode(String value) {
    _CountryCode = value;
    prefs.setString('ff_CountryCode', value);
  }

  List<dynamic> _Notes = [];
  List<dynamic> get Notes => _Notes;
  set Notes(List<dynamic> value) {
    _Notes = value;
    prefs.setStringList('ff_Notes', value.map((x) => jsonEncode(x)).toList());
  }

  void addToNotes(dynamic value) {
    Notes.add(value);
    prefs.setStringList('ff_Notes', _Notes.map((x) => jsonEncode(x)).toList());
  }

  void removeFromNotes(dynamic value) {
    Notes.remove(value);
    prefs.setStringList('ff_Notes', _Notes.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromNotes(int index) {
    Notes.removeAt(index);
    prefs.setStringList('ff_Notes', _Notes.map((x) => jsonEncode(x)).toList());
  }

  void updateNotesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    Notes[index] = updateFn(_Notes[index]);
    prefs.setStringList('ff_Notes', _Notes.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInNotes(int index, dynamic value) {
    Notes.insert(index, value);
    prefs.setStringList('ff_Notes', _Notes.map((x) => jsonEncode(x)).toList());
  }

  String _textFromHtmlEditor = '';
  String get textFromHtmlEditor => _textFromHtmlEditor;
  set textFromHtmlEditor(String value) {
    _textFromHtmlEditor = value;
  }

  List<dynamic> _RadioPlaylist = [];
  List<dynamic> get RadioPlaylist => _RadioPlaylist;
  set RadioPlaylist(List<dynamic> value) {
    _RadioPlaylist = value;
  }

  void addToRadioPlaylist(dynamic value) {
    RadioPlaylist.add(value);
  }

  void removeFromRadioPlaylist(dynamic value) {
    RadioPlaylist.remove(value);
  }

  void removeAtIndexFromRadioPlaylist(int index) {
    RadioPlaylist.removeAt(index);
  }

  void updateRadioPlaylistAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    RadioPlaylist[index] = updateFn(_RadioPlaylist[index]);
  }

  void insertAtIndexInRadioPlaylist(int index, dynamic value) {
    RadioPlaylist.insert(index, value);
  }

  bool _isDownloadingToLocal = false;
  bool get isDownloadingToLocal => _isDownloadingToLocal;
  set isDownloadingToLocal(bool value) {
    _isDownloadingToLocal = value;
  }

  bool _HasInternet = false;
  bool get HasInternet => _HasInternet;
  set HasInternet(bool value) {
    _HasInternet = value;
  }

  bool _isOnline = true;
  bool get isOnline => _isOnline;
  set isOnline(bool value) {
    _isOnline = value;
  }

  bool _NotificationBool = true;
  bool get NotificationBool => _NotificationBool;
  set NotificationBool(bool value) {
    _NotificationBool = value;
    prefs.setBool('ff_NotificationBool', value);
  }

  bool _PledgeSubmitted = false;
  bool get PledgeSubmitted => _PledgeSubmitted;
  set PledgeSubmitted(bool value) {
    _PledgeSubmitted = value;
    prefs.setBool('ff_PledgeSubmitted', value);
  }

  final _homePageVideoAPIManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> homePageVideoAPI({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _homePageVideoAPIManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearHomePageVideoAPICache() => _homePageVideoAPIManager.clear();
  void clearHomePageVideoAPICacheKey(String? uniqueKey) =>
      _homePageVideoAPIManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
