import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:savrd/src/profile/profile_view.dart';

import 'post/post_feed_view.dart';
import 'post/post_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          home: const PostFeedView(),
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // remove debug banner
          debugShowCheckedModeBanner: false,

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme:
              _buildTheme(), //ThemeData(textTheme: GoogleFonts.ptSerifTextTheme(textTheme)),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          // onGenerateRoute: (RouteSettings routeSettings) {
          //   return MaterialPageRoute<void>(
          //     settings: routeSettings,
          //     builder: (BuildContext context) {
          //       switch (routeSettings.name) {
          //         case SettingsView.routeName:
          //           return SettingsView(controller: settingsController);
          //         // extra guard statement to only go to profile view with proper arguments
          //         case ProfileView.routeName
          //             when routeSettings.arguments is ProfileViewArguments:
          //           final args =
          //               routeSettings.arguments as ProfileViewArguments;
          //           return ProfileView(profile: args.profile);
          //         case PostView.routeName:
          //           final args = routeSettings.arguments as PostViewArguments;
          //           return PostView(post: args.post);
          //         case PostFeedView.routeName:
          //           return const PostFeedView();
          //         default:
          //           return const PostFeedView();
          //       }
          //     },
          //   );
          // },
        );
      },
    );
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData();
  const colorScheme = ColorScheme(
      brightness: Brightness.light,
      surfaceTint: Colors.transparent,
      primary: Color(0xFF958D77),
      onPrimary: Color(0xFFFCF6E6),
      secondary: Color(0xFF809671),
      onSecondary: Color(0xFFFCF6E6),
      error: Color(0xFFFF6961),
      onError: Color(0xFFFFFAFA),
      surface: Color(0xFFFCF6E6),
      onSurface: Color(0xFF958D77),
      tertiary: Color(0xFFF9EBC7));

  var baseIconTheme = IconThemeData(
    color: colorScheme.primary,
    //weight: 900,
    shadows: <Shadow>[
      Shadow(
          color: Color(0xFF403D34).withOpacity(.5),
          blurRadius: 1.5,
          offset: Offset(0, 1))
    ],
  );

  //FIXME: is this function needed?
  IconThemeData getIconTheme(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return baseIconTheme.copyWith(size: 32);
    }
    return baseIconTheme.copyWith(size: 32);
  }

  return baseTheme.copyWith(
    textTheme: GoogleFonts.ptSerifTextTheme(baseTheme.textTheme)
        .copyWith(
          headlineSmall:
              GoogleFonts.ptSerif(fontSize: 23, fontWeight: FontWeight.w500),
          titleSmall: GoogleFonts.arimo(
              textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1)),
          bodyLarge: GoogleFonts.arimo(
              textStyle: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5)),
          bodyMedium: GoogleFonts.arimo(
              textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4)),
          bodySmall: GoogleFonts.arimo(
              textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4)),
          labelLarge:
              GoogleFonts.arimo(textStyle: baseTheme.textTheme.labelLarge),
          labelMedium:
              GoogleFonts.arimo(textStyle: baseTheme.textTheme.labelMedium),
          labelSmall:
              GoogleFonts.arimo(textStyle: baseTheme.textTheme.labelSmall),
        )
        .apply(
            bodyColor: colorScheme.primary, displayColor: colorScheme.primary),
    scaffoldBackgroundColor: const Color(0xFFFCF6E6),
    colorScheme: colorScheme,
    iconTheme: baseIconTheme,
    tabBarTheme:
        TabBarTheme(overlayColor: WidgetStateProperty.all(Colors.transparent)),
    navigationBarTheme: NavigationBarThemeData(
        height: 38,
        elevation: 4,
        shadowColor: colorScheme.primary,
        indicatorColor: colorScheme.background,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        iconTheme: WidgetStateProperty.resolveWith(getIconTheme)),
  );
}
