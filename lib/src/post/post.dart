import '../profile/profile.dart';
import 'ingredient.dart';

/// A placeholder class that represents an entity or model.
class Post {
  final int id;
  final String imageAssetLocation;
  final String title;
  final Profile profile;
  final String caption;
  // TODO: change this datatype for rich text
  final String? blog;

  const Post({
    required this.id,
    required this.imageAssetLocation,
    required this.title,
    required this.profile,
    required this.caption,
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
  final List<String> tags;
  final List<Ingredient> ingredients;
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
    required this.tags,
    required this.directions,
    required this.ingredients,
    required super.caption,
    super.blog,
    // FIXME: Parent class for notes and blog to abstract off of?
    this.notes,
  }) : assert(directions.isNotEmpty);
}
