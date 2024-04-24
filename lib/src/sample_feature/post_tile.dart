import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savrd/src/sample_feature/post.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Image.asset('assets/images/jambalya.jpg'),
            ),
          ),
          Text(post.title, style: Theme.of(context).textTheme.displayLarge,),
          IntrinsicHeight(child: Row(children: [Text(post.time!.toString()), VerticalDivider(), Text(post.servings!),],)),
          // generate tag widgets from list of strings
          if (post.tags != null) IntrinsicHeight(
            child: Row(children: [...List.generate(post.tags!.length * 2 - 1, (item) {
              if (item.isEven) {
                return Text(post.tags![item~/2]);
              }
              return VerticalDivider();
            }),]),
          ),
          Row(children: [Icon(Icons.favorite_border_rounded), Icon(Icons.send_rounded), Icon(Icons.chat_bubble_outline_rounded),],),
        ],
      ),
    );
  }
}
