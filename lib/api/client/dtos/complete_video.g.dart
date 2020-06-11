// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteVideo _$CompleteVideoFromJson(Map<String, dynamic> json) {
  return CompleteVideo(
    author: json['author'] as String,
    authorId: json['authorId'] as String,
    authorUrl: json['authorUrl'] as String,
    authorThumbnails: (json['authorThumbnails'] as List)
        .map((e) => AuthorThumbnail.fromJson(e as Map<String, dynamic>))
        .toList(),
    formatStreams: (json['formatStreams'] as List)
        .map((e) => FormatStream.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String,
    videoId: json['videoId'] as String,
    description: json['description'] as String,
    keywords: (json['keywords'] as List).map((e) => e as String).toList(),
    likeCount: json['likeCount'] as int,
    dislikeCount: json['dislikeCount'] as int,
    genre: json['genre'] as String,
    captions: (json['captions'] as List)
        .map((e) => CompleteVideoCaption.fromJson(e as Map<String, dynamic>))
        .toList(),
    recommendedVideos: (json['recommendedVideos'] as List)
        .map(
            (e) => CompleteVideoRecommended.fromJson(e as Map<String, dynamic>))
        .toList(),
    adaptiveFormats: (json['adaptiveFormats'] as List)
        .map((e) => AdaptiveFormat.fromJson(e as Map<String, dynamic>))
        .toList(),
    descriptionHtml: json['descriptionHtml'] as String,
    genreUrl: json['genreUrl'] as String,
    isFamilyFriendly: json['isFamilyFriendly'] as bool,
    paid: json['paid'] as bool,
    premium: json['premium'] as bool,
    allowedRegions:
        (json['allowedRegions'] as List).map((e) => e as String).toList(),
    published: json['published'] as int,
    publishedText: json['publishedText'] as String,
    subCountText: json['subCountText'] as String,
    lengthSeconds: json['lengthSeconds'] as int,
    allowRatings: json['allowRatings'] as bool,
    rating: (json['rating'] as num).toDouble(),
    isListed: json['isListed'] as bool,
    liveNow: json['liveNow'] as bool,
    isUpComing: json['isUpComing'] as bool,
    premiereTimeStamp: json['premiereTimeStamp'] as int,
  );
}

Map<String, dynamic> _$CompleteVideoToJson(CompleteVideo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'videoId': instance.videoId,
      'description': instance.description,
      'descriptionHtml': instance.descriptionHtml,
      'keywords': instance.keywords,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'genre': instance.genre,
      'genreUrl': instance.genreUrl,
      'isFamilyFriendly': instance.isFamilyFriendly,
      'paid': instance.paid,
      'premium': instance.premium,
      'allowedRegions': instance.allowedRegions,
      'published': instance.published,
      'publishedText': instance.publishedText,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'authorThumbnails': instance.authorThumbnails,
      'adaptiveFormats': instance.adaptiveFormats,
      'formatStreams': instance.formatStreams,
      'captions': instance.captions,
      'recommendedVideos': instance.recommendedVideos,
      'subCountText': instance.subCountText,
      'lengthSeconds': instance.lengthSeconds,
      'allowRatings': instance.allowRatings,
      'rating': instance.rating,
      'isListed': instance.isListed,
      'liveNow': instance.liveNow,
      'isUpComing': instance.isUpComing,
      'premiereTimeStamp': instance.premiereTimeStamp,
    };
