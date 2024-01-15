import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

///This class defines light theme and dark theme
///Here we used flex color scheme
class Themes {
  // static ThemeData get theme => FlexThemeData.light(
  //       scheme: FlexScheme.brandBlue,
  //       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  //       blendLevel: 20,
  //       appBarOpacity: 0.95,
  //       swapColors: true,
  //       tabBarStyle: FlexTabBarStyle.forBackground,
  //
  //       subThemesData: const FlexSubThemesData(
  //         blendOnLevel: 20,
  //         blendOnColors: false,
  //         inputDecoratorRadius: 8,
  //       ),
  //       keyColors: const FlexKeyColors(
  //         useSecondary: true,
  //         useTertiary: true,
  //       ),
  //       pageTransitionsTheme: const PageTransitionsTheme(
  //         builders: {
  //           // replace default CupertinoPageTransitionsBuilder with this
  //           TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
  //           TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  //         },
  //       ),
  //       visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //       useMaterial3: true,
  //
  //       /// fontFamily: GoogleFonts.getFont('Lato').fontFamily,
  //
  //       ///
  //     );
  // static ThemeData get darkTheme => FlexThemeData.dark(
  //       scheme: FlexScheme.brandBlue,
  //       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  //       blendLevel: 15,
  //       appBarStyle: FlexAppBarStyle.background,
  //       appBarOpacity: 0.90,
  //       tabBarStyle: FlexTabBarStyle.forBackground,
  //       subThemesData: const FlexSubThemesData(
  //         blendOnLevel: 30,
  //         inputDecoratorRadius: 8,
  //       ),
  //       keyColors: const FlexKeyColors(
  //         useSecondary: true,
  //         useTertiary: true,
  //       ),
  //       pageTransitionsTheme: const PageTransitionsTheme(
  //         builders: {
  //           // replace default CupertinoPageTransitionsBuilder with this
  //           TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
  //           TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
  //         },
  //       ),
  //       visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //       useMaterial3: true,
  //       // To use the playground font, add GoogleFonts package and uncomment
  //       // fontFamily: GoogleFonts.getFont('Lato').fontFamily,
  //     );

  static ThemeData get theme => ThemeData.light(useMaterial3: false).copyWith(
        colorScheme:
            FlexColorScheme.light(scheme: FlexScheme.brandBlue).toScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      );
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme:
            FlexColorScheme.dark(scheme: FlexScheme.brandBlue).toScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      );
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
}
