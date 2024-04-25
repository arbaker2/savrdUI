import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savrd/src/sample_feature/post.dart';

const BorderRadius imageBorderRadius = BorderRadius.all(Radius.circular(15));

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(child: ImageIcon(AssetImage('assets/images/green_dutch_oven.png'), size: 28, color: Theme.of(context).colorScheme.secondary,)),
              ),
              Text(' ${post.account}', style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Material(
              elevation: 4,
              borderRadius: imageBorderRadius,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    const BoxDecoration(borderRadius: imageBorderRadius),
                child: Image.asset('assets/images/honey_harissa.jpeg'),
              ),
            ),
          ),
          Text(
            post.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          IntrinsicHeight(
              child: Row(
            children: [
              Text(post.time!.toString()),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.schedule_rounded,
                size: 20,
              ),
              VerticalDivider(
                indent: 3,
                endIndent: 3,
                thickness: 1.5,
              ),
              Text(post.servings!),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.people_rounded,
                size: 20,
              ),
            ],
          )),
          // generate tag widgets from list of strings
          if (post.tags != null)
            IntrinsicHeight(
              child: Row(children: [
                ...List.generate(post.tags!.length * 2 - 1, (item) {
                  if (item.isEven) {
                    return Text(post.tags![item ~/ 2]);
                  }
                  return VerticalDivider(
                    indent: 3,
                    endIndent: 3,
                    thickness: 1.5,
                  );
                }),
              ]),
            ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Row(
              children: [
                Icon(Icons.favorite_border_rounded),
                SizedBox(
                  width: 2,
                ),
                Icon(Icons.send_rounded),
                SizedBox(
                  width: 2,
                ),
                Icon(Icons.chat_bubble_outline_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
