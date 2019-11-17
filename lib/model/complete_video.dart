import 'package:json_annotation/json_annotation.dart';
import 'package:otube/model/adaptive_format.dart';
import 'package:otube/model/complete_video_caption.dart';
import 'package:otube/model/complete_video_recommended.dart';

import 'author_thumbnail.dart';
import 'format_stream.dart';

part 'complete_video.g.dart';

@JsonSerializable(nullable: false)
class CompleteVideo {
  final String title;
  final String videoId;
  final String description;
  final String descriptionHtml;
  final List<String> keywords;
  final int likeCount;
  final int dislikeCount;
  final String genre;
  final String genreUrl;
  final bool isFamilyFriendly;
  final bool paid;
  final bool premium;
  final List<String> allowedRegions;
  final int published;
  final String publishedText;

  final String author;
  final String authorId;
  final String authorUrl;
  final List<AuthorThumbnail> authorThumbnails;

  final List<AdaptiveFormat> adaptiveFormats;
  final List<FormatStream> formatStreams;
  final List<CompleteVideoCaption> captions;
  final List<CompleteVideoRecommended> recommendedVideos;

  final String subCountText;
  final int lengthSeconds;
  final bool allowRatings;
  final double rating;
  final bool isListed;
  final bool liveNow;
  final bool isUpComing;
  final int premiereTimeStamp;

  CompleteVideo(
      {this.author,
      this.authorId,
      this.authorUrl,
      this.authorThumbnails,
      this.formatStreams,
      this.title,
      this.videoId,
      this.description,
      this.keywords,
      this.likeCount,
      this.dislikeCount,
      this.genre,
      this.captions,
      this.recommendedVideos,
      this.adaptiveFormats,
      this.descriptionHtml,
      this.genreUrl,
      this.isFamilyFriendly,
      this.paid,
      this.premium,
      this.allowedRegions,
      this.published,
      this.publishedText,
      this.subCountText,
      this.lengthSeconds,
      this.allowRatings,
      this.rating,
      this.isListed,
      this.liveNow,
      this.isUpComing,
      this.premiereTimeStamp});

  factory CompleteVideo.fromJson(Map<String, dynamic> json) =>
      _$CompleteVideoFromJson(json);
}
