import 'package:audio_service/audio_service.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class MediaItemConverter {
  static Future<MediaItem> mapToMediaItem(Map song,
      {bool addedByAutoplay = false,
      bool autoplay = true,
      String? playlistBox}) async {
    String url = song['url'].toString();
    String imageUrl = getImageUrl(song['image'].toString());
    // If YouTube, get thumbnail
    if (url.contains('youtube.com') || url.contains('youtu.be')) {
      try {
        var yt = YoutubeExplode();
        var video = await yt.videos.get(url);
        imageUrl = video.thumbnails.highResUrl;
        yt.close();
      } catch (e) {
        print('Error getting YouTube thumbnail: $e');
      }
    }
    return MediaItem(
      id: song['id'].toString(),
      album: song['album'].toString(),
      artist: song['artist'].toString(),
      duration: Duration(
        seconds: int.parse(
          (song['duration'] == null ||
                  song['duration'] == 'null' ||
                  song['duration'] == '')
              ? '180'
              : song['duration'].toString(),
        ),
      ),
      title: song['title'].toString(),
      artUri: Uri.parse(imageUrl),
      genre: song['language'].toString(),
      extras: {
        'json': song['extra']['json'],
        'user_id': song['user_id'],
        'url': song['url'],
        'album_id': song['album_id'],
        'addedByAutoplay': addedByAutoplay,
        'autoplay': autoplay,
        'playlistBox': playlistBox,
        'date': DateTime.parse(song['extra']['date']).year.toString(),
        'country': song['extra']['country'],
        'city': song['extra']['city'],
      },
    );
  }
}

String getImageUrl(String? imageUrl, {String quality = 'high'}) {
  if (imageUrl == null) return '';
  switch (quality) {
    case 'high':
      return imageUrl
          .trim()
          .replaceAll("http:", "https:")
          .replaceAll("50x50", "500x500")
          .replaceAll("150x150", "500x500");
    case 'medium':
      return imageUrl
          .trim()
          .replaceAll("http:", "https:")
          .replaceAll("50x50", "150x150")
          .replaceAll("500x500", "150x150");
    case 'low':
      return imageUrl
          .trim()
          .replaceAll("http:", "https:")
          .replaceAll("150x150", "50x50")
          .replaceAll("500x500", "50x50");
    default:
      return imageUrl
          .trim()
          .replaceAll("http:", "https:")
          .replaceAll("50x50", "500x500")
          .replaceAll("150x150", "500x500");
  }
}

Future<String?> getYouTubeAudioStreamUrl(String youtubeUrl) async {
  var yt = YoutubeExplode();
  try {
    var video = await yt.videos.get(youtubeUrl);
    var manifest = await yt.videos.streamsClient.getManifest(video.id);
    var audioStreamInfo = manifest.audioOnly.withHighestBitrate();
    return audioStreamInfo?.url.toString();
  } catch (e) {
    print('Error extracting YouTube audio: $e');
    return null;
  } finally {
    yt.close();
  }
}
