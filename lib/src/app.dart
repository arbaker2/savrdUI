import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
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
    //final textTheme = Theme.of(context).textTheme;

    //TODO: should this be defined in another block?
    // Configure Text theme
  //   final TextTheme textTheme = TextTheme(
  //   displayLarge: GoogleFonts.ptSerif(
  //       fontSize: 102, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  //   displayMedium: GoogleFonts.ptSerif(
  //       fontSize: 64, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  //   displaySmall: GoogleFonts.ptSerif(fontSize: 51, fontWeight: FontWeight.w400),
  //   headlineMedium: GoogleFonts.ptSerif(
  //       fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  //   headlineSmall: GoogleFonts.ptSerif(fontSize: 25, fontWeight: FontWeight.w400),
  //   titleLarge: GoogleFonts.ptSerif(
  //       fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  //   titleMedium: GoogleFonts.ptSerif(
  //       fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  //   titleSmall: GoogleFonts.ptSerif(
  //       fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  //   bodyLarge: GoogleFonts.ptSans(
  //       fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  //   bodyMedium: GoogleFonts.ptSans(
  //       fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  //   labelLarge: GoogleFonts.ptSans(
  //       fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  //   bodySmall: GoogleFonts.ptSans(
  //       fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  //   labelSmall: GoogleFonts.ptSans(
  //       fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
  // );
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

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
          theme: _buildTheme(),//ThemeData(textTheme: GoogleFonts.ptSerifTextTheme(textTheme)),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return const SampleItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}

ThemeData _buildTheme() {
  var baseTheme = ThemeData();
  const colorScheme = ColorScheme(brightness: Brightness.light, surfaceTint: Colors.transparent, primary: Color(0xFF958D77), onPrimary: Color(0xFFFCF6E6), secondary: Color(0xFF809671), onSecondary: Color(0xFFFCF6E6), error: Color(0xFFFF6961), onError: Color(0xFFFFFAFA), background: Color(0xFFFCF6E6), onBackground: Color(0xFF958D77), surface: Color(0xFFFCF6E6), onSurface: Color(0xFF958D77));

  return baseTheme.copyWith(
    textTheme: GoogleFonts.ptSerifTextTheme(baseTheme.textTheme).copyWith(
      titleSmall: GoogleFonts.ptSans(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.1)),
      bodyLarge: GoogleFonts.ptSans(textStyle: baseTheme.textTheme.bodyLarge),
      bodyMedium: GoogleFonts.ptSans(textStyle: baseTheme.textTheme.bodyMedium),
      bodySmall: GoogleFonts.ptSans(textStyle: baseTheme.textTheme.bodySmall),
      labelLarge: GoogleFonts.ptSans(textStyle: baseTheme.textTheme.labelLarge),
      labelMedium: GoogleFonts.ptSans(textStyle: baseTheme.textTheme.labelMedium),
      labelSmall: GoogleFonts.ptSans(textStyle: baseTheme.textTheme.labelSmall),
    ).apply(bodyColor: colorScheme.primary, displayColor: colorScheme.primary),
    scaffoldBackgroundColor: const Color(0xFFFCF6E6),
    colorScheme: colorScheme,
    iconTheme: IconThemeData(color: colorScheme.primary)
    );
}
