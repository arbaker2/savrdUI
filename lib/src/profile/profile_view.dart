import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:savrd/src/profile/user_icon.dart';
import 'package:savrd/src/sample_feature/image_tile.dart';

//FIXME: accept a profile when building this page
//FIXME: make entire page scrollable
//FIXME: when scrolling make app bar disappear
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  static const double infoHeight = 188;
  static const double iconHeight = 140;
  static const double actionHeight = infoHeight - iconHeight;
  static const double statisticsPadding = 12;
  static const double gridSpacing = 8;
  static const double gridAspect = .75;
  static const double spacing = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SAVRD Foods',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.ellipsis),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing),
        child: Column(
          children: [
            SizedBox(
              height: infoHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const UserIcon(
                          imageLocation: 'assets/images/green_dutch_oven.png',
                          size: iconHeight,
                        ),
                        SizedBox(
                            height: actionHeight,
                            child: Center(
                                child: Text(
                              "SAVRD",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ))),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      //mainAxisSize: MainAxisSize.max,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // Padding to match text button
                          padding: const EdgeInsets.all(statisticsPadding),
                          height: iconHeight,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StatLabel(
                                number: '68',
                                metric: 'Posts',
                              ),
                              StatLabel(
                                number: '673K',
                                metric: 'Followers',
                              ),
                              StatLabel(
                                number: '3.7K',
                                metric: 'Following',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  "Follow +",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.apply(fontWeightDelta: 2),
                                )),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.link,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.bell,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: spacing),
              child: Text(
                "Create, share, discover, follow and cook in one app. A social platform built for cuisine, designed to beautifully showcase your culinary creations.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //FIXME: transfer sizing to themeing
                children: [
                  FaIcon(
                    FontAwesomeIcons.book,
                    size: 36,
                  ),
                  FaIcon(
                    FontAwesomeIcons.spoon,
                    size: 36,
                  ),
                  FaIcon(
                    FontAwesomeIcons.tag,
                    size: 36,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: gridSpacing,
                      crossAxisSpacing: gridSpacing,
                      childAspectRatio: gridAspect),
                  itemBuilder: (BuildContext context, int index) {
                    return ImageTile(
                      'assets/images/banana_bread.jpg',
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class StatLabel extends StatelessWidget {
  const StatLabel({
    super.key,
    required this.number,
    required this.metric,
  });

  final String number;
  final String metric;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: number,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.apply(fontWeightDelta: 3),
        children: <TextSpan>[
          TextSpan(
              text: ' $metric',
              style: Theme.of(context).textTheme.headlineMedium),
        ],
      ),
    );
  }
}
