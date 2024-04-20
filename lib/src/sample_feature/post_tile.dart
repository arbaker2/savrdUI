import 'package:flutter/material.dart';
import 'package:savrd/src/sample_feature/post.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(clipBehavior: Clip.hardEdge, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),child: Image.asset('assets/images/jambalya.jpg'),),
    );
  }
}
