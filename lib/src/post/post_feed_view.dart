import 'package:flutter/material.dart';
import 'package:savrd/src/post/post_app_bar.dart';
import 'package:savrd/src/post/post_tile.dart';

import '../profile/profile.dart';
import '../settings/settings_view.dart';
import 'post.dart';

double _tabHeight = 30;

/// Displays a list of SampleItems.
class PostFeedView extends StatefulWidget {
  const PostFeedView({
    super.key,
  });

  static const routeName = '/postFeed';

  @override
  State<PostFeedView> createState() => _PostFeedViewState();
}

class _PostFeedViewState extends State<PostFeedView> {
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
            headerSliverBuilder: buildHeaderSliverBuilder(
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Navigate to the settings page. If the user leaves and returns
                    // to the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(_tabHeight),
                child: SizedBox(
                  height: _tabHeight,
                  child: const TabBar(
                    dividerHeight: 0,
                    tabs: <Widget>[
                      Tab(
                        text: 'discover',
                        //height: 10,
                      ),
                      Tab(
                        text: 'following',
                        //height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                const Text("It's cloudy here"),
                ListView.builder(
                  // Providing a restorationId allows the ListView to restore the
                  // scroll position when a user leaves and returns to the app after it
                  // has been killed while running in the background.
                  restorationId: 'postFeedView',
                  padding: EdgeInsets.zero,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];

                    return PostTile(post: item);
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home_rounded),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.search_rounded),
              icon: Icon(Icons.search_outlined),
              label: 'Search',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.bookmark),
              icon: Icon(Icons.bookmark_border_rounded),
              label: 'Bookmakred',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle_rounded),
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
