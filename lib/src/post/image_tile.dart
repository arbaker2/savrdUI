import 'package:flutter/material.dart';

const BorderRadius imageBorderRadius = BorderRadius.all(Radius.circular(15));

class ImageTile extends StatelessWidget {
  const ImageTile(
    this.name, {
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = width * 1.33;
      final BorderRadius imageBorderRadius =
          BorderRadius.all(Radius.circular(height / 30));

      return Material(
        elevation: 4,
        borderRadius: imageBorderRadius,
        child: Container(
          height: height,
          width: width,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: imageBorderRadius),
          child: Image.asset(
            name,
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
