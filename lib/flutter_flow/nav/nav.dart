import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SplashScreenWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SplashScreenWidget()
              : OnboardingWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: BooksPageWidget.routeName,
          path: BooksPageWidget.routePath,
          builder: (context, params) => BooksPageWidget(),
        ),
        FFRoute(
          name: GranthrajListNOTUSEDWidget.routeName,
          path: GranthrajListNOTUSEDWidget.routePath,
          builder: (context, params) => GranthrajListNOTUSEDWidget(),
        ),
        FFRoute(
          name: NowPlayingPageWidget.routeName,
          path: NowPlayingPageWidget.routePath,
          builder: (context, params) => NowPlayingPageWidget(
            currentAudio: params.getParam(
              'currentAudio',
              ParamType.JSON,
            ),
            chapters: params.getParam<dynamic>(
              'chapters',
              ParamType.JSON,
              isList: true,
            ),
            currentAudioIndex: params.getParam(
              'currentAudioIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AudioCategoryPageWidget.routeName,
          path: AudioCategoryPageWidget.routePath,
          builder: (context, params) => AudioCategoryPageWidget(),
        ),
        FFRoute(
          name: AudioListWidget.routeName,
          path: AudioListWidget.routePath,
          builder: (context, params) => AudioListWidget(
            categoryItem: params.getParam(
              'categoryItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: PhotosPageWidget.routeName,
          path: PhotosPageWidget.routePath,
          builder: (context, params) => PhotosPageWidget(),
        ),
        FFRoute(
          name: PhotoAlbumWidget.routeName,
          path: PhotoAlbumWidget.routePath,
          builder: (context, params) => PhotoAlbumWidget(
            postList: params.getParam<dynamic>(
              'postList',
              ParamType.JSON,
              isList: true,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VideosCategoryPageWidget.routeName,
          path: VideosCategoryPageWidget.routePath,
          builder: (context, params) => VideosCategoryPageWidget(),
        ),
        FFRoute(
          name: SplashScreenWidget.routeName,
          path: SplashScreenWidget.routePath,
          builder: (context, params) => SplashScreenWidget(),
        ),
        FFRoute(
          name: PadaSevaCategoriesNOTUSEDWidget.routeName,
          path: PadaSevaCategoriesNOTUSEDWidget.routePath,
          builder: (context, params) => PadaSevaCategoriesNOTUSEDWidget(),
        ),
        FFRoute(
          name: SettingPageNOTUSEDWidget.routeName,
          path: SettingPageNOTUSEDWidget.routePath,
          builder: (context, params) => SettingPageNOTUSEDWidget(),
        ),
        FFRoute(
          name: GranthrajPageWidget.routeName,
          path: GranthrajPageWidget.routePath,
          builder: (context, params) => GranthrajPageWidget(
            granthItem: params.getParam(
              'granthItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: PearlPageWidget.routeName,
          path: PearlPageWidget.routePath,
          builder: (context, params) => PearlPageWidget(),
        ),
        FFRoute(
          name: IskonBkkWidget.routeName,
          path: IskonBkkWidget.routePath,
          builder: (context, params) => IskonBkkWidget(),
        ),
        FFRoute(
          name: YatrasInfoWidget.routeName,
          path: YatrasInfoWidget.routePath,
          builder: (context, params) => YatrasInfoWidget(
            yatraItem: params.getParam(
              'yatraItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: PadaSevaListNOTUSEDWidget.routeName,
          path: PadaSevaListNOTUSEDWidget.routePath,
          builder: (context, params) => PadaSevaListNOTUSEDWidget(
            category: params.getParam(
              'category',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: AudioTextOnlyWidget.routeName,
          path: AudioTextOnlyWidget.routePath,
          builder: (context, params) => AudioTextOnlyWidget(
            audio: params.getParam(
              'audio',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: VyasaPujaWidget.routeName,
          path: VyasaPujaWidget.routePath,
          builder: (context, params) => VyasaPujaWidget(
            vyasaPuja: params.getParam(
              'vyasaPuja',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: SignInPageWidget.routeName,
          path: SignInPageWidget.routePath,
          builder: (context, params) => SignInPageWidget(),
        ),
        FFRoute(
          name: SignUpPageWidget.routeName,
          path: SignUpPageWidget.routePath,
          builder: (context, params) => SignUpPageWidget(),
        ),
        FFRoute(
          name: PledgePageWidget.routeName,
          path: PledgePageWidget.routePath,
          builder: (context, params) => PledgePageWidget(),
        ),
        FFRoute(
          name: AboutPageWidget.routeName,
          path: AboutPageWidget.routePath,
          builder: (context, params) => AboutPageWidget(),
        ),
        FFRoute(
          name: ComingSoonWidget.routeName,
          path: ComingSoonWidget.routePath,
          builder: (context, params) => ComingSoonWidget(
            pageTitle: params.getParam(
              'pageTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AudioTesterDonotDeleteWidget.routeName,
          path: AudioTesterDonotDeleteWidget.routePath,
          builder: (context, params) => AudioTesterDonotDeleteWidget(),
        ),
        FFRoute(
          name: VideoListWidget.routeName,
          path: VideoListWidget.routePath,
          builder: (context, params) => VideoListWidget(
            categoryItem: params.getParam(
              'categoryItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: VideoPostWidget.routeName,
          path: VideoPostWidget.routePath,
          builder: (context, params) => VideoPostWidget(
            videoItem: params.getParam(
              'videoItem',
              ParamType.JSON,
            ),
            categoryItem: params.getParam(
              'categoryItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: VyasPoojaCategoryPageWidget.routeName,
          path: VyasPoojaCategoryPageWidget.routePath,
          builder: (context, params) => VyasPoojaCategoryPageWidget(),
        ),
        FFRoute(
          name: VyasPujaPdfViewerWidget.routeName,
          path: VyasPujaPdfViewerWidget.routePath,
          builder: (context, params) => VyasPujaPdfViewerWidget(
            vyasPuja: params.getParam(
              'vyasPuja',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: LibraryWidget.routeName,
          path: LibraryWidget.routePath,
          builder: (context, params) => LibraryWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: BookPostPageWidget.routeName,
          path: BookPostPageWidget.routePath,
          builder: (context, params) => BookPostPageWidget(
            bookItem: params.getParam(
              'bookItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: FavoriteListWidget.routeName,
          path: FavoriteListWidget.routePath,
          builder: (context, params) => FavoriteListWidget(),
        ),
        FFRoute(
          name: PlaylistPageWidget.routeName,
          path: PlaylistPageWidget.routePath,
          builder: (context, params) => PlaylistPageWidget(),
        ),
        FFRoute(
          name: VerifyCodeWidget.routeName,
          path: VerifyCodeWidget.routePath,
          builder: (context, params) => VerifyCodeWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            isReset: params.getParam(
              'isReset',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: PlaylistWidget.routeName,
          path: PlaylistWidget.routePath,
          builder: (context, params) => PlaylistWidget(
            playlistItem: params.getParam(
              'playlistItem',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: ForgotPasswordWidget.routeName,
          path: ForgotPasswordWidget.routePath,
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: SetNewPasswordWidget.routeName,
          path: SetNewPasswordWidget.routePath,
          builder: (context, params) => SetNewPasswordWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            otp: params.getParam(
              'otp',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: PrabhupadaCategoryPageWidget.routeName,
          path: PrabhupadaCategoryPageWidget.routePath,
          builder: (context, params) => PrabhupadaCategoryPageWidget(),
        ),
        FFRoute(
          name: PrabhupadaWidget.routeName,
          path: PrabhupadaWidget.routePath,
          builder: (context, params) => PrabhupadaWidget(),
        ),
        FFRoute(
          name: YatraWidget.routeName,
          path: YatraWidget.routePath,
          builder: (context, params) => YatraWidget(),
        ),
        FFRoute(
          name: NotesListWidget.routeName,
          path: NotesListWidget.routePath,
          builder: (context, params) => NotesListWidget(),
        ),
        FFRoute(
          name: RadioPageWidget.routeName,
          path: RadioPageWidget.routePath,
          builder: (context, params) => RadioPageWidget(
            isRadio: params.getParam(
              'isRadio',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: TutorialWidget.routeName,
          path: TutorialWidget.routePath,
          builder: (context, params) => TutorialWidget(),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: ContactWidget.routeName,
          path: ContactWidget.routePath,
          builder: (context, params) => ContactWidget(),
        ),
        FFRoute(
          name: PadaSevaWidget.routeName,
          path: PadaSevaWidget.routePath,
          builder: (context, params) => PadaSevaWidget(
            categoryJson: params.getParam(
              'categoryJson',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: LegalInformationWidget.routeName,
          path: LegalInformationWidget.routePath,
          builder: (context, params) => LegalInformationWidget(),
        ),
        FFRoute(
          name: AppInformationWidget.routeName,
          path: AppInformationWidget.routePath,
          builder: (context, params) => AppInformationWidget(),
        ),
        FFRoute(
          name: BlogWidget.routeName,
          path: BlogWidget.routePath,
          builder: (context, params) => BlogWidget(),
        ),
        FFRoute(
          name: BlogPostWidget.routeName,
          path: BlogPostWidget.routePath,
          builder: (context, params) => BlogPostWidget(
            blogPost: params.getParam(
              'blogPost',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: PadaSevaCategoryWidget.routeName,
          path: PadaSevaCategoryWidget.routePath,
          builder: (context, params) => PadaSevaCategoryWidget(),
        ),
        FFRoute(
          name: DownloadsWidget.routeName,
          path: DownloadsWidget.routePath,
          builder: (context, params) => DownloadsWidget(),
        ),
        FFRoute(
          name: FeaturedVideosWidget.routeName,
          path: FeaturedVideosWidget.routePath,
          builder: (context, params) => FeaturedVideosWidget(),
        ),
        FFRoute(
          name: NewsWidget.routeName,
          path: NewsWidget.routePath,
          builder: (context, params) => NewsWidget(),
        ),
        FFRoute(
          name: InternetConnectionWidget.routeName,
          path: InternetConnectionWidget.routePath,
          builder: (context, params) => InternetConnectionWidget(),
        ),
        FFRoute(
          name: ChatWidget.routeName,
          path: ChatWidget.routePath,
          builder: (context, params) => ChatWidget(
            chat: params.getParam(
              'chat',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chat_messages'],
            ),
            ref: params.getParam(
              'ref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Users'],
            ),
            notification: params.getParam(
              'notification',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: MyChatsWidget.routeName,
          path: MyChatsWidget.routePath,
          builder: (context, params) => MyChatsWidget(),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Frame_(2).png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
