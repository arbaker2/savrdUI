import 'package:flutter/material.dart';

List<Widget> Function(BuildContext, bool) buildHeaderSliverBuilder(
    {List<Widget>? actions, PreferredSizeWidget? bottom}) {
  return (BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        toolbarHeight: 45,
        floating: true,
        expandedHeight: 0,
        snap: true,
        forceElevated: innerBoxIsScrolled,
        title: ImageIcon(
          const AssetImage('assets/images/green_dutch_oven.png'),
          size: 55,
          color: Theme.of(context).colorScheme.secondary,
        ),
        actions: actions,
        bottom: bottom,
      ),
    ];
  };
}
