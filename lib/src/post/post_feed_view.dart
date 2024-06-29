import 'package:flutter/material.dart';
import 'package:savrd/src/post/post_app_bar.dart';
import 'package:savrd/src/post/post_tile.dart';

import '../profile/profile.dart';
import '../settings/settings_view.dart';
import 'ingredient.dart';
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

  static String blog =
      "At SAVRD we strive to make sharing, discovering, and cooking food seamless."
      " We believe that food deserves its own app - a place curated just for cuisine,"
      " built to beautifully showcase and discover culinary creations of all kinds."
      " We aim to create a community that will learn, create, and get inspiration from one another.\n\n"
      "With that, we want to start sharing some of our favorite recipes. Our first dish dates back many generations in our family,"
      " and we can’t wait for you to try it out! Cajun comfort food with just the right amount of kick. We hope you enjoy our take on jambalaya.";

  static List<Ingredient> ingredients = [
    const Ingredient("1 whole chicken"),
    const Ingredient("2 cups white rice"),
    const Ingredient("1/2 bell pepper (chopped)"),
    const Ingredient("1 onion (chopped)"),
    const Ingredient("1/4 bunch celery (chopped)"),
    const Ingredient("1 lb ground sausage"),
    const Ingredient("1/2 lb link sausage (andouille preferred)"),
    const Ingredient("3oz tomato paste"),
    const Ingredient("2 bay leaves"),
    const Ingredient("1/2 tsp pepper"),
    const Ingredient("1/2 tsp Tobasco"),
    const Ingredient("2 tbsp Cavender’s Greek Seasoning"),
    const Ingredient("2 cloves garlic (minced)"),
    const Ingredient("1/4 tsp red pepper flakes"),
  ];

  static List<String> directions = [
    "Cook chicken on low in crock pot for 6-8 hours. When cooked, remove the meat and save the broth. Save half the meat for another dish, or double the recipe for a large gathering.",
    "Preheat oven to 350 F",
    "Add water to saved chicken broth to make 4 cups of liquid. Place rice and the broth/water mixture in a pot over high heat. Once boiling reduce heat to low and cover. Let cook for 25 minutes or when all liquid is absorbed.",
    "While rice is cooking, heat a large skillet to medium-high heat. Add the ground sausage and linked sausage (chopped up) and brown. Once cooked set aside on a clean plate and add the chopped vegetables. Cook the vegetables until they are softened(3-4 minutes). After the vegetables are softened, add in the tomato paste, bay leaves, pepper, Tobasco, Greek Seasoning, garlic, red pepper flakes, and cooked sausage and cook until fragrant (1-2 minutes). Cover and reduce heat, let simmer for 20 minutes.",
    "Grease a large 10x15 casserole dish (or two smaller ones) with your preferred cooking spray. In a large bowl combine chicken, cooked rice, and sausage mixture. Transfer to the casserole dish and cook covered at 350 F for 20-24 minutes. Jambalya should appear slightly golden when done.",
  ];

  static String note =
      "This dish freezes very well. If you are looking to do some meal prep,"
      " complete steps 1-4 and then transfer the mixture to a covered casserole dish and freeze."
      " When re-heating transfer dish(s) to the refrigerator or counter to thaw, and then bake for normal cook time."
      " The jambalaya can be frozen for several months if stored properly.";

  final List<Post> items = [
    RecipePost(
      id: 1,
      imageAssetLocation: 'assets/images/banana_bread.jpg',
      title: 'Chocolate Banana Bread',
      time: 30,
      caption: 'Delicious banana bread',
      servings: '4-6',
      profile: const Profile(
        id: 1,
        imageAssetLocation: 'assets/images/green_dutch_oven.png',
        handle: 'Savrd food',
        name: 'SAVRD',
      ),
      tags: ['Dessert', 'GF', 'Paleo'],
      directions: directions,
      blog: blog,
      ingredients: ingredients,
      notes: note,
    ),
    RecipePost(
      id: 1,
      imageAssetLocation: 'assets/images/jambalaya.jpg',
      title: 'Jambalaya',
      time: 60,
      caption:
          'A delcicious cajun casserole with chicken and andouille sausage sure to have your loved ones coming back for seconds!',
      servings: '4-6',
      profile: const Profile(
        id: 1,
        imageAssetLocation: 'assets/images/green_dutch_oven.png',
        handle: 'Savrd food',
        name: 'SAVRD',
      ),
      tags: ['Cajun', 'Easy Dinner', 'Meal Prep'],
      directions: directions,
      blog: blog,
      ingredients: ingredients,
      notes: note,
    ),
    RecipePost(
      id: 2,
      imageAssetLocation: 'assets/images/banana_pancakes.jpg',
      time: 30,
      servings: '4',
      title: 'post2',
      caption: 'Delicious banana bread',
      profile: const Profile(
        id: 1,
        imageAssetLocation: 'assets/images/green_dutch_oven.png',
        handle: 'proflie2',
        name: 'SAVRD',
      ),
      tags: ['Dessert', 'GF', 'Paleo'],
      directions: ['test'],
      blog: blog,
      ingredients: ingredients,
    ),
    const Post(
      id: 3,
      imageAssetLocation: 'assets/images/honey_harissa.jpeg',
      title: 'post3',
      profile: Profile(
        id: 1,
        imageAssetLocation: 'assets/images/green_dutch_oven.png',
        handle: 'Profile3',
        name: 'SAVRD',
      ),
      caption: "test descritpion",
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
                  icon: const Hero(
                      tag: 'settings-hero', child: Icon(Icons.settings)),
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
