import 'package:flutter/material.dart';

import '../profile/profile.dart';

/// A placeholder class that represents an entity or model.
class Post {
  final int id;
  final String imageAssetLocation;
  final String title;
  final Profile profile;

  const Post({
    required this.id,
    required this.imageAssetLocation,
    required this.title,
    required this.profile,
  });
}
//TODO: create getter for all icon related items in list if not null (time and servings)

class RecipePost extends Post {
  final int time;
  final String servings;
  final String description;
  final List<String> tags;

  const RecipePost({
    required super.id,
    required super.imageAssetLocation,
    required super.title,
    required super.profile,
    required this.time,
    required this.servings,
    required this.description,
    required this.tags,
  });
}
