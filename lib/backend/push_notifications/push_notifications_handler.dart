import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Frame_(2).png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'BooksPage': ParameterData.none(),
  'GranthrajListNOTUSED': ParameterData.none(),
  'NowPlayingPage': (data) async => ParameterData(
        allParams: {
          'currentAudioIndex': getParameter<int>(data, 'currentAudioIndex'),
        },
      ),
  'AudioCategoryPage': ParameterData.none(),
  'AudioList': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'PhotosPage': ParameterData.none(),
  'PhotoAlbum': (data) async => ParameterData(
        allParams: {
          'title': getParameter<String>(data, 'title'),
        },
      ),
  'VideosCategoryPage': ParameterData.none(),
  'SplashScreen': ParameterData.none(),
  'PadaSevaCategoriesNOTUSED': ParameterData.none(),
  'SettingPageNOTUSED': ParameterData.none(),
  'GranthrajPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'PearlPage': ParameterData.none(),
  'IskonBkk': ParameterData.none(),
  'YatrasInfo': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'PadaSevaListNOTUSED': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'AudioTextOnly': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'VyasaPuja': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'SignInPage': ParameterData.none(),
  'SignUpPage': ParameterData.none(),
  'PledgePage': ParameterData.none(),
  'AboutPage': ParameterData.none(),
  'ComingSoon': (data) async => ParameterData(
        allParams: {
          'pageTitle': getParameter<String>(data, 'pageTitle'),
        },
      ),
  'AudioTesterDonotDelete': ParameterData.none(),
  'VideoList': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'VideoPost': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'ProfilePage': ParameterData.none(),
  'VyasPoojaCategoryPage': ParameterData.none(),
  'VyasPujaPdfViewer': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'Library': ParameterData.none(),
  'Onboarding': ParameterData.none(),
  'BookPostPage': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'FavoriteList': ParameterData.none(),
  'PlaylistPage': ParameterData.none(),
  'VerifyCode': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
          'isReset': getParameter<bool>(data, 'isReset'),
        },
      ),
  'Playlist': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'ForgotPassword': ParameterData.none(),
  'SetNewPassword': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
          'otp': getParameter<String>(data, 'otp'),
        },
      ),
  'PrabhupadaCategoryPage': ParameterData.none(),
  'Prabhupada': ParameterData.none(),
  'Yatra': ParameterData.none(),
  'NotesList': ParameterData.none(),
  'RadioPage': (data) async => ParameterData(
        allParams: {
          'isRadio': getParameter<bool>(data, 'isRadio'),
        },
      ),
  'Tutorial': ParameterData.none(),
  'Settings': ParameterData.none(),
  'Contact': ParameterData.none(),
  'PadaSeva': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'LegalInformation': ParameterData.none(),
  'AppInformation': ParameterData.none(),
  'Blog': ParameterData.none(),
  'BlogPost': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'PadaSevaCategory': ParameterData.none(),
  'Downloads': ParameterData.none(),
  'FeaturedVideos': ParameterData.none(),
  'News': ParameterData.none(),
  'InternetConnection': ParameterData.none(),
  'Chat': (data) async => ParameterData(
        allParams: {
          'chat': getParameter<DocumentReference>(data, 'chat'),
          'ref': getParameter<DocumentReference>(data, 'ref'),
          'notification': getParameter<bool>(data, 'notification'),
        },
      ),
  'MyChats': ParameterData.none(),
  'Notification': ParameterData.none(),
  'SearchPage': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
