import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_review.freezed.dart';

part 'restaurant_review.g.dart';

@freezed
class RestaurantReview with _$RestaurantReview {
  static const String collectionName = 'reviews';

  const factory RestaurantReview({
    required String userId,
    required String title,
    required String subtitle,
    required String comments,
    required String rating,
    required String restaurant,
  }) = _RestaurantReview;

  factory RestaurantReview.fromJson(Map<String, Object?> json) =>
      _$RestaurantReviewFromJson(json);
}
