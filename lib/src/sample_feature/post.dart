import '../profile/profile.dart';

/// A placeholder class that represents an entity or model.
class Post {
  const Post(
      {required this.id,
      required this.imageAssetLocation,
      required this.title,
      required this.profile,
      this.time,
      this.servings,
      this.description,
      this.tags});

  final int id;
  final String imageAssetLocation;
  final String title;
  final Profile profile;
  final int? time;
  final String? servings;
  final String? description;
  final List<String>? tags;
}
//TODO: create getter for all icon related items in list if not null (time and servings)
