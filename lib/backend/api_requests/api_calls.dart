import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start VVP APIs Group Code

class VVPAPIsGroup {
  static String getBaseUrl() => 'http://3.27.239.33/api/';
  static Map<String, String> headers = {};
  static AudioByCategpryIDCall audioByCategpryIDCall = AudioByCategpryIDCall();
  static AudioByAudioIDCall audioByAudioIDCall = AudioByAudioIDCall();
  static PadaSevaCall padaSevaCall = PadaSevaCall();
  static GranthrajCategoriesCall granthrajCategoriesCall =
      GranthrajCategoriesCall();
  static GranthrajCall granthrajCall = GranthrajCall();
  static BooksCall booksCall = BooksCall();
  static YatraCall yatraCall = YatraCall();
  static VerseCall verseCall = VerseCall();
  static QuotesCall quotesCall = QuotesCall();
  static SearchCall searchCall = SearchCall();
  static PearlCall pearlCall = PearlCall();
  static GetCategoriesByParentCall getCategoriesByParentCall =
      GetCategoriesByParentCall();
  static AudioCategoriesCall audioCategoriesCall = AudioCategoriesCall();
  static PhotosCategoriesCall photosCategoriesCall = PhotosCategoriesCall();
  static PearlCategoriesCall pearlCategoriesCall = PearlCategoriesCall();
  static VyasaPujaCategoriesCall vyasaPujaCategoriesCall =
      VyasaPujaCategoriesCall();
  static PhotosCall photosCall = PhotosCall();
  static VyasaPujaCall vyasaPujaCall = VyasaPujaCall();
  static PearlsCall pearlsCall = PearlsCall();
  static PadaSevaCategoriesCall padaSevaCategoriesCall =
      PadaSevaCategoriesCall();
  static VyasaPujaCountriesCall vyasaPujaCountriesCall =
      VyasaPujaCountriesCall();
  static YoutubeUrlsCall youtubeUrlsCall = YoutubeUrlsCall();
}

class AudioByCategpryIDCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Audio by categpry ID',
      apiUrl: '${baseUrl}/audio?acf_format=standard&audio-categories=${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  dynamic listData(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class AudioByAudioIDCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Audio by audio ID',
      apiUrl: '${baseUrl}/audio/${id}?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic listData(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$.acf''',
      );
}

class PadaSevaCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pada Seva',
      apiUrl: '${baseUrl}/pada-seva?acf_format=standard&audio-categories=${id}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
}

class GranthrajCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Granthraj Categories',
      apiUrl: '${baseUrl}/granthraj',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  List? granthrajList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GranthrajCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Granthraj ',
      apiUrl: '${baseUrl}/granthraj/${id}?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  dynamic granthrajList(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class BooksCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Books',
      apiUrl: '${baseUrl}/pdf?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  List? listData(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class YatraCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Yatra',
      apiUrl: '${baseUrl}/yatra?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  List? listData(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class VerseCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Verse',
      apiUrl: '${baseUrl}/verse?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  List? listData(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class QuotesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Quotes',
      apiUrl: '${baseUrl}/quotes?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  List? listData(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class SearchCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? subtype = '',
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Search',
      apiUrl: '${baseUrl}/search?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'search': search,
        'subtype': subtype,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic acf(dynamic response) => getJsonField(
        response,
        r'''$[:].acf''',
      );
  List? listData(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  String? subtype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.subtype''',
      ));
}

class PearlCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pearl',
      apiUrl: '${baseUrl}/pearl/${id}?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.title''',
      ));
  dynamic pearlData(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  String? text(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.pearl_text''',
      ));
}

class GetCategoriesByParentCall {
  Future<ApiCallResponse> call({
    String? parent = '',
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Categories By Parent',
      apiUrl: '${baseUrl}/categories',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'parent': parent,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AudioCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Audio Categories',
      apiUrl: '${baseUrl}/audio-categories',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class PhotosCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Photos Categories',
      apiUrl: '${baseUrl}/gallery?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title.rendered''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PearlCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pearl Categories',
      apiUrl: '${baseUrl}/pearl?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title.rendered''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class VyasaPujaCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Vyasa Puja Categories',
      apiUrl: '${baseUrl}/vyasa-puja?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$[:].title.rendered''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].acf.country''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].acf.city''',
      ));
  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].acf.date''',
      ));
  String? poojaBy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].acf.vyas_puja_by''',
      ));
}

class PhotosCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Photos',
      apiUrl: '${baseUrl}/gallery/${id}?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  List? imagesList(dynamic response) => getJsonField(
        response,
        r'''$.acf.images''',
        true,
      ) as List?;
}

class VyasaPujaCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Vyasa Puja',
      apiUrl: '${baseUrl}/vyasa-puja/${id}?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  String? country(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.country''',
      ));
  String? city(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.city''',
      ));
  String? pujaBy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.vyas_puja_by''',
      ));
  String? puja(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.pooja_description''',
      ));
  String? date(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.date''',
      ));
}

class PearlsCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pearls',
      apiUrl: '${baseUrl}/pearl/${id}?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  String? title(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.title.rendered''',
      ));
  String? shortTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.title''',
      ));
  String? description(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.acf.pearl_text''',
      ));
}

class PadaSevaCategoriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pada Seva Categories',
      apiUrl: '${baseUrl}/pada-seva?acf_format=standard',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class VyasaPujaCountriesCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Vyasa Puja Countries',
      apiUrl: '${baseUrl}/vyasa-puja-location?parent=0',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic listData(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class YoutubeUrlsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = VVPAPIsGroup.getBaseUrl();
    return ApiManager.instance.makeApiCall(
      callName: 'Youtube URLs',
      apiUrl: '${baseUrl}youtube-urls',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? urlList(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  String? firstUrl(dynamic response) =>
      (getJsonField(response, r'$[0].url') as String?);
}

/// End VVP APIs Group Code

/// Start Laravel Group Code
///

class LaravelGroup {
  static String getBaseUrl() => 'http://3.27.239.33/api/';
  static Map<String, String> headers = {
    'Accept': 'application/json',
  };
  static CategoryListCall categoryListCall = CategoryListCall();
  static PostsListCall postsListCall = PostsListCall();
  static BannersCall bannersCall = BannersCall();
  static ProjectCall projectCall = ProjectCall();
  static PostCall postCall = PostCall();
  static UserCall userCall = UserCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
  static UserUpdateCall userUpdateCall = UserUpdateCall();
  static NotesListCall notesListCall = NotesListCall();
  static LikedPostsListCall likedPostsListCall = LikedPostsListCall();
  static SearchPostCall searchPostCall = SearchPostCall();
  static AllPlaylistCall allPlaylistCall = AllPlaylistCall();
  static TutorialsCall tutorialsCall = TutorialsCall();
  static PledgeDonationsCall pledgeDonationsCall = PledgeDonationsCall();
  static SubmitPledgeDonationCall submitPledgeDonationCall =
      SubmitPledgeDonationCall();
  static PlaylistItemsCall playlistItemsCall = PlaylistItemsCall();
  static CreatePlaylistCall createPlaylistCall = CreatePlaylistCall();
  static AddToPlaylistCall addToPlaylistCall = AddToPlaylistCall();
  static DeletePlaylistCall deletePlaylistCall = DeletePlaylistCall();
  static RemoveFromPlaylistCall removeFromPlaylistCall =
      RemoveFromPlaylistCall();
  static PostTypeListCall postTypeListCall = PostTypeListCall();
  static LoginCall loginCall = LoginCall();
  static RegisterCall registerCall = RegisterCall();
  static SocialLoginCall socialLoginCall = SocialLoginCall();
  static ResendOTPCall resendOTPCall = ResendOTPCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static ForgotPasswordVerifyOtpCall forgotPasswordVerifyOtpCall =
      ForgotPasswordVerifyOtpCall();
  static ForgotPasswordSetCall forgotPasswordSetCall = ForgotPasswordSetCall();
  static VerifyOTPCall verifyOTPCall = VerifyOTPCall();
  static LikePostCall likePostCall = LikePostCall();
  static NotePostCall notePostCall = NotePostCall();
  static UpdateNoteCall updateNoteCall = UpdateNoteCall();
  static DeleteNotePostCall deleteNotePostCall = DeleteNotePostCall();
  static GetNotePostCall getNotePostCall = GetNotePostCall();
  static UnlikePostCall unlikePostCall = UnlikePostCall();
  static InitiateChatCall initiateChatCall = InitiateChatCall();
  static MyChatsCall myChatsCall = MyChatsCall();
}

class CategoryListCall {
  Future<ApiCallResponse> call({
    String? postTypeId = '',
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Category List',
      apiUrl: '${baseUrl}categories',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'post_type_id': postTypeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? nameList(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PostsListCall {
  Future<ApiCallResponse> call({
    String? postTypeId = '',
    String? categoryId = '',
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Posts List ',
      apiUrl: '${baseUrl}posts',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'post_type_id': postTypeId,
        'category_id': categoryId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class BannersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Banners',
      apiUrl: '${baseUrl}banners',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ProjectCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Project',
      apiUrl: '${baseUrl}projects',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.pdf''',
        true,
      ) as List?;
}

class PostCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? postTypeId = '',
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Post ',
      apiUrl: '${baseUrl}posts/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'id': id,
        'post_type_id': postTypeId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class UserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User',
      apiUrl: '${baseUrl}me',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class DeleteAccountCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Account',
      apiUrl: '${baseUrl}me',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class UserUpdateCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? name = '',
    String? email = '',
    String? mobile = '',
    String? gender = '',
    String? dob = '',
    String? bio = '',
    String? isDisciple = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Update',
      apiUrl: '${baseUrl}me',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'name': name,
        'mobile': mobile,
        'email': email,
        'gender': gender,
        'dob': dob,
        'bio': bio,
        'is_disciple': isDisciple,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class NotesListCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Notes List',
      apiUrl: '${baseUrl}user/notes',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? notesList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class LikedPostsListCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Liked Posts List ',
      apiUrl: '${baseUrl}user/liked-posts',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class SearchPostCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? search = '',
    int? page,
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Search Post',
      apiUrl: '${baseUrl}search/posts',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'q': search,
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

class AllPlaylistCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'All Playlist',
      apiUrl: '${baseUrl}playlist',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class TutorialsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Tutorials',
      apiUrl: '${baseUrl}tutorials',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

class PledgeDonationsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Pledge Donations',
      apiUrl: '${baseUrl}donations',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

class SubmitPledgeDonationCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? name = '',
    String? description = '',
    String? mobile = '',
    String? email = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "description": "${description}",
  "mobile": "${mobile}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Submit Pledge Donation',
      apiUrl: '${baseUrl}donations',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class PlaylistItemsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Playlist Items',
      apiUrl: '${baseUrl}playlist/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data.audios''',
        true,
      ) as List?;
}

class CreatePlaylistCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? name = '',
    String? postTypeId = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${name}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Playlist',
      apiUrl: '${baseUrl}playlist',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class AddToPlaylistCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? postId = '',
    String? id = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Add to Playlist',
      apiUrl: '${baseUrl}playlist/${id}/add/${postId}',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class DeletePlaylistCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Playlist',
      apiUrl: '${baseUrl}playlist/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class RemoveFromPlaylistCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? postId = '',
    String? id = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Remove from Playlist',
      apiUrl: '${baseUrl}playlist/${id}/remove/${postId}',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class PostTypeListCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Post Type List',
      apiUrl: '${baseUrl}post-types',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
}

class RegisterCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? name = '',
    String? passwordConfirmation = '',
    String? mobile = '',
    int? isDisciple,
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${name}",
  "email": "${email}",
  "password": "${password}",
  "password_confirmation": "${passwordConfirmation}",
  "is_disciple": ${isDisciple},
  "mobile": "${mobile}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: '${baseUrl}auth/register',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
}

class SocialLoginCall {
  Future<ApiCallResponse> call({
    String? idToken = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id_token": "${idToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Social Login',
      apiUrl: '${baseUrl}auth/social-login',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
}

class ResendOTPCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Resend OTP',
      apiUrl: '${baseUrl}auth/resend-otp',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot Password',
      apiUrl: '${baseUrl}auth/change-password/send-otp',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
}

class ForgotPasswordVerifyOtpCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot password Verify Otp',
      apiUrl: '${baseUrl}auth/change-password/verify-otp',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ForgotPasswordSetCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
    String? password = '',
    String? passwordConfirmation = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "otp": "${otp}",
  "password": "${password}",
  "password_confirmation": "${passwordConfirmation}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forgot password Set',
      apiUrl: '${baseUrl}auth/change-password/set',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class VerifyOTPCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? otp = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "otp": "${otp}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verify OTP ',
      apiUrl: '${baseUrl}auth/verify-otp',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
}

class LikePostCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Like Post',
      apiUrl: '${baseUrl}posts/${id}/like',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotePostCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    String? note = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Note Post ',
      apiUrl: '${baseUrl}posts/${id}/notes',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'note': note,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateNoteCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    String? note = '',
    String? noteId = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Update Note',
      apiUrl: '${baseUrl}posts/${id}/notes/${noteId}',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'note': note,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteNotePostCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    String? noteId = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Note Post ',
      apiUrl: '${baseUrl}posts/${id}/notes/${noteId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNotePostCall {
  Future<ApiCallResponse> call({
    String? postId = '',
    String? token = '',
    String? noteId = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Note Post ',
      apiUrl: '${baseUrl}posts/${postId}/notes/${noteId}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnlikePostCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Unlike Post',
      apiUrl: '${baseUrl}posts/${id}/unlike',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InitiateChatCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Initiate Chat',
      apiUrl: '${baseUrl}initiate-chat',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic chatRecord(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class MyChatsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = LaravelGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'My Chats',
      apiUrl: '${baseUrl}my-chats',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? chatList(dynamic response) => getJsonField(
        response,
        r'''$.data.data''',
        true,
      ) as List?;
}

/// End Laravel Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
