import 'package:flutter/material.dart';
import 'package:savrd/src/post/post_app_bar.dart';
import 'package:savrd/src/post/post_tile.dart';

import '../profile/profile.dart';
import 'post.dart';

double _tabHeight = 30;

/// Displays a list of SampleItems.
class PostView extends StatefulWidget {
  const PostView({
    super.key,
  });

  static const routeName = '/post';

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  int currentPageIndex = 0;

  final List<Post> items = [
    RecipePost(
      id: 1,
      imageAssetLocation: 'location',
      title: 'Chocolate Banana Bread',
      time: 30,
      description: 'Delicious banana bread',
      servings: '4-6',
      profile: const Profile(
        id: 1,
        imageAssetLocation: 'assets/images/green_dutch_oven.png',
        handle: 'Savrd food',
        name: 'SAVRD',
      ),
      tags: ['Dessert', 'GF', 'Paleo'],
      directions: ['eat food'],
    ),
    RecipePost(
      id: 2,
      imageAssetLocation: 'location',
      time: 30,
      servings: '4',
      title: 'post2',
      description: 'Delicious banana bread',
      profile: const Profile(
        id: 1,
        imageAssetLocation: 'assets/images/green_dutch_oven.png',
        handle: 'proflie2',
        name: 'SAVRD',
      ),
      tags: ['Dessert', 'GF', 'Paleo'],
      directions: ['test'],
    ),
    const Post(
      id: 3,
      imageAssetLocation: 'location',
      title: 'post3',
      profile: Profile(
        id: 1,
        imageAssetLocation: 'assets/images/green_dutch_oven.png',
        handle: 'Profile3',
        name: 'SAVRD',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      animationDuration: const Duration(milliseconds: 600),
      child: Scaffold(
        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: buildHeaderSliverBuilder(),
            body: ListView.builder(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'postView',
              padding: EdgeInsets.zero,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return PostTile(post: item);
              },
            ),
          ),
        ),
      ),
    );
  }
}
