import '../profile/profile.dart';

/// A placeholder class that represents an entity or model.
class Post {
  final int id;
  final String imageAssetLocation;
  final String title;
  final Profile profile;
  // TODO: change this datatype for rich text
  final String? blog;

  const Post({
    required this.id,
    required this.imageAssetLocation,
    required this.title,
    required this.profile,
    // TODO: give blog a class and allow it to have a title and rich text with sections of its own
    this.blog,
  });
}
//TODO: create getter for all icon related items in list if not null (time and servings)

class RecipePost extends Post {
  // TODO: add optional nutrition facts
  // TODO: require hours and minutes
  final int time;
  final String servings;
  final String description;
  final List<String> tags;
  // TODO: create ingredient class
  // need rich text for measurments
  final List<String> ingredients;
  // TODO: creat direction class
  final List<String> directions;
  final String? notes;

  RecipePost({
    required super.id,
    required super.imageAssetLocation,
    required super.title,
    required super.profile,
    required this.time,
    required this.servings,
    required this.description,
    required this.tags,
    required this.directions,
    required this.ingredients,
    super.blog,
    // FIXME: Parent class for notes and blog to abstract off of?
    this.notes,
  }) : assert(directions.isNotEmpty);
}
