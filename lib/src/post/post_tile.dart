import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savrd/src/profile/profile_view.dart';
import 'package:savrd/src/profile/user_icon.dart';
import 'package:savrd/src/post/post.dart';

import '../profile/profile.dart';
import 'image_tile.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    Post postLocal = post;
    bool isRecipe = postLocal is RecipePost;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              ProfileView.routeName,
              arguments: ProfileViewArguments(
                profile: const Profile(
                  id: 1,
                  imageAssetLocation: 'assets/images/green_dutch_oven.png',
                  handle: 'Savrd food',
                  name: 'SAVRD',
                ),
              ),
            ),
            child: Row(
              children: [
                const UserIcon(
                  imageLocation: 'assets/images/green_dutch_oven.png',
                ),
                Text(' ${post.profile.handle}',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ImageTile(
              'assets/images/banana_bread.jpg',
            ),
          ),
          Text(
            post.title,
            style: Theme.of(context).textTheme.headlineSmall,
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
                ...List.generate(postLocal.tags.length * 2 - 1, (item) {
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
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Row(
              children: [
                FaIcon(FontAwesomeIcons.heart),
                SizedBox(
                  width: 6,
                ),
                FaIcon(FontAwesomeIcons.paperPlane),
                SizedBox(
                  width: 6,
                ),
                FaIcon(FontAwesomeIcons.comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
