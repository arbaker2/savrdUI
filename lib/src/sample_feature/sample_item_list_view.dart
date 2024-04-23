import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savrd/src/sample_feature/post_tile.dart';

import '../settings/settings_view.dart';
import 'post.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      Post(
          id: 1,
          imageAssetLocation: 'location',
          title: 'post1',
          time: 30,
          servings: '4',
          account: 'account 1',
          tags: ['Easy Dinner', 'GF', 'Seafood']),
      Post(
          id: 2,
          imageAssetLocation: 'location',
          time: 30,
          servings: '4',
          title: 'post2',
          account: 'account 2'),
      Post(
          id: 3,
          imageAssetLocation: 'location',
          time: 30,
          servings: '4',
          title: 'post3',
          account: 'account 3')
    ],
  });

  static const routeName = '/';

  final List<Post> items;

  @override
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      //TODO: create a sliverapp bar with custom scroll view
      child: Scaffold(
        
        //TODO: remove padding from top of nested croll view
        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: NestedScrollView( headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[SliverAppBar(
            floating: true,
            expandedHeight: 0,
            snap: true,
            forceElevated: innerBoxIsScrolled,
          title: const ImageIcon(AssetImage('assets/images/green_dutch_oven.png'), size: 45,),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'discover',
              ),
              Tab(
                text: 'following',
              ),
            ],
          ),
        ),
        ];},
        
        body: TabBarView(
          children: <Widget>[
            const Center(
              child: Text("It's cloudy here"),
            ),
            
            SafeArea(
              top: false,
              bottom: false,
              child: ListView.builder(
                // Providing a restorationId allows the ListView to restore the
                // scroll position when a user leaves and returns to the app after it
                // has been killed while running in the background.
                restorationId: 'sampleItemListView',
                itemCount: widget.items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = widget.items[index];
              
                  return PostTile(post: item);
                  // ListTile(
                  //   title: Text('Item ${item.id}'),
                  //   leading: const CircleAvatar(
                  //     // Display the Flutter Logo image asset.
                  //     foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                  //   ),
                  //   onTap: () {
                  //     // Navigate to the details page. If the user leaves and returns to
                  //     // the app after it has been killed while running in the
                  //     // background, the navigation stack is restored.
                  //     Navigator.restorablePushNamed(
                  //       context,
                  //       SampleItemDetailsView.routeName,
                  //     );
                  //   }
                  // );
                },
              ),
            ),
          ],
        ),
        ),
        bottomNavigationBar: NavigationBar(
          height: 50,
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
