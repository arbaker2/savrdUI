import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savrd/src/post/image_tile.dart';
import 'package:savrd/src/post/post_app_bar.dart';
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
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      animationDuration: const Duration(milliseconds: 600),
      child: Scaffold(
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
                    // FIXME: refactor post lable used in post tile
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        postLocal.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    if (isRecipe)
                      IntrinsicHeight(
                          child: Row(
                        children: [
                          Text(postLocal.time.toString()),
                          const SizedBox(
                            width: 2,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.clock,
                            size: 15,
                          ),
                          const VerticalDivider(
                            indent: 3,
                            endIndent: 3,
                            thickness: 1.5,
                          ),
                          Text(postLocal.servings),
                          const SizedBox(
                            width: 2,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.userGroup,
                            size: 15,
                          ),
                        ],
                      )),
                    // generate tag widgets from list of strings
                    if (isRecipe)
                      IntrinsicHeight(
                        child: Row(children: [
                          ...List.generate(postLocal.tags.length * 2 - 1,
                              (item) {
                            if (item.isEven) {
                              return Text(postLocal.tags[item ~/ 2]);
                            }
                            return const VerticalDivider(
                              indent: 3,
                              endIndent: 3,
                              thickness: 1.5,
                            );
                          }),
                        ]),
                      ),
                    // FIXME: Refactor the two below widgets
                    if (isRecipe)
                      Text(
                        postLocal.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    // FIXME: group
                    if (isRecipe)
                      if (postLocal.blog != null)
                        Section(
                          child: Text(
                            postLocal.blog!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),

                    if (isRecipe)
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
                                      postLocal.ingredients.length,
                                      (int index) {
                                        final ingredient =
                                            postLocal.ingredients[index];

                                        return RichText(
                                          text: TextSpan(
                                            text: ingredient.amount,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            children: [
                                              TextSpan(
                                                text: ingredient.item,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
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
                    if (isRecipe)
                      Section(
                        child: ListView(
                          restorationId: 'directionsView',
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: <Widget>[
                            ...List.generate(
                              postLocal.directions.length,
                              (int index) {
                                final direction = postLocal.directions[index];

                                return Card(
                                  child: ListTile(
                                    title: RichText(
                                      text: TextSpan(
                                        text: "${index + 1} ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        children: [
                                          TextSpan(
                                            text: direction,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
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
                    if (isRecipe)
                      if (postLocal.notes != null)
                        Section(
                          child: Text(
                            postLocal.notes!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
