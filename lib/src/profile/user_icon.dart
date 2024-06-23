import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({super.key, this.size = 35, required this.imageLocation});

  final double size;
  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(size)),
      child: Center(
          child: ImageIcon(
        AssetImage(imageLocation),
        size: size * .8,
        color: Theme.of(context).colorScheme.secondary,
      )),
    );
  }
}
