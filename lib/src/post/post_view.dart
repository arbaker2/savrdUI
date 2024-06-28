import 'package:flutter/material.dart';
import 'package:savrd/src/post/image_tile.dart';
import 'package:savrd/src/post/post_app_bar.dart';
import 'package:savrd/src/post/post_tile.dart';
import 'post.dart';

/// Displays a list of SampleItems.
class PostView extends StatelessWidget {
  const PostView({
    super.key,
    required this.post,
  });

  final Post post;

  static const routeName = '/post';

  @override
  Widget build(BuildContext context) {
    Post postLocal = post;
    bool isRecipe = postLocal is RecipePost;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: buildHeaderSliverBuilder(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageTile(
                    postLocal.imageAssetLocation,
                  ),
                  PostLabel(post: post),
                  if (post.blog != null)
                    Section(
                      child: Text(
                        postLocal.blog!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  if (isRecipe) RecipeElements(post: postLocal),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeElements extends StatelessWidget {
  const RecipeElements({super.key, required this.post});

  final RecipePost post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Section(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...List.generate(
                        post.ingredients.length,
                        (int index) {
                          final ingredient = post.ingredients[index];
                          return RichText(
                            text: TextSpan(
                              text: ingredient.amount,
                              style: Theme.of(context).textTheme.bodyLarge,
                              children: [
                                TextSpan(
                                  text: ingredient.item,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                          );
                        },
                        growable: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Section(
          child: Column(
            children: <Widget>[
              ...List.generate(
                post.directions.length,
                (int index) {
                  final direction = post.directions[index];
                  return Card(
                    child: ListTile(
                      title: RichText(
                        text: TextSpan(
                          text: "${index + 1} ",
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: [
                            TextSpan(
                              text: direction,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                growable: false,
              ),
            ],
          ),
        ),
        if (post.notes != null)
          Section(
            child: Text(
              post.notes!,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.child,
  });

  final Widget child;

  static double indent = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(
            thickness: 1,
            indent: indent,
            endIndent: indent,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child,
      ],
    );
  }
}

class PostViewArguments {
  final Post post;

  PostViewArguments({required this.post});
}
