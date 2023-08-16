import 'package:flutter/material.dart';
import 'package:green_egypt/config/theme/default_fonts.dart';

class ApplicationTheme {
  /**
   ####################### Application dark theme property ##############################
   */
  static ThemeData applicationDarkTheme = ThemeData.dark().copyWith(
      textTheme: TextTheme(
        labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),

      /**
     * -------------------- Scaffold Background Color -----------------------
     */
      scaffoldBackgroundColor: Colors.black,
/**
 * -------------------------- Primary Color --------------------------
 */
      primaryColor: const Color(0xFF90AD19),
      /**
  * -------------------------- AppBar Theme --------------------------
  */
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      /***
     * -------------------------- Prrmary Text Theme --------------------------
     */
      primaryTextTheme: TextTheme(
        labelLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),
      /**
     * ----------------------------- Drawer Theme -------------------------
     */
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
      /**
     * -------------------------- Button Theme --------------------------
     */
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white,
        textTheme: ButtonTextTheme.primary,
      ),
      /***
     * ************************************************************************
     * **************************  Buttons Section ****************************
     * ************************************************************************
     */
      /**
     *  -------------------------- 1 - OutlinedButton --------------------------
     */
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF90AD19), textStyle: const TextStyle(color: Colors.white),
          side: const BorderSide(color: Color(0xFF90AD19), width: 2),
        ),
      ),
      /**
     *  2 - ElevatedButton
     */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(color: Colors.white), backgroundColor: const Color(0xFF90AD19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      /**
   *  3 - Text Button
   */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF90AD19), textStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
/**
 * 4- Floating action button
 */
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF90AD19),
        foregroundColor: Colors.white,
        iconSize: 18,
      ),
      /**
     *************************************************************************
     ***************************  TextField Section **************************
     *************************************************************************
     * */
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: const Color(0xFF90AD19),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF90AD19))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF90AD19)),
        ),
      ),
      /**
               * *************************** Cursor Color **********************************
               */
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Color(0xFF90AD19)),
      /**
           * ************************* TF prefix - postfix themeing **********************
           */
      iconTheme: const IconThemeData(color: Color(0xFF90AD19)));

  /// ############################# Application light theme property ###########################

  static ThemeData applicationLightTheme = ThemeData.light().copyWith(
      /**
     * -------------------- Scaffold Background Color -----------------------
     */
      scaffoldBackgroundColor: Colors.white,
/**
 * -------------------------- Primary Color --------------------------
 */
      primaryColor: const Color(0xFF90AD19),
      /**
  * -------------------------- AppBar Theme --------------------------
  */
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      /***
     * -------------------------- Prrmary Text Theme --------------------------
     */

      textTheme: TextTheme(
        labelLarge: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),
      primaryTextTheme: TextTheme(
        labelLarge: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 72,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displayMedium: TextStyle(
            color: Colors.black,
            fontSize: 56,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        displaySmall: TextStyle(
            color: Colors.black,
            fontSize: 48,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineMedium: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleLarge: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        bodyMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
        titleMedium: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            fontFamily: DefaultFonts.defaultLondrinaSolidThin),
      ),
      /**
     * ----------------------------- Drawer Theme -------------------------
     */
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
      /**
     * -------------------------- Button Theme --------------------------
     */
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
        textTheme: ButtonTextTheme.primary,
      ),
      /***
     * ************************************************************************
     * **************************  Buttons Section ****************************
     * ************************************************************************
     */
      /**
     *  -------------------------- 1 - OutlinedButton --------------------------
     */
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF90AD19), textStyle: const TextStyle(color: Colors.black),
          side: const BorderSide(color: Color(0xFF90AD19), width: 2),
        ),
      ),
      /**
     *  2 - ElevatedButton
     */
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(color: Colors.black), backgroundColor: const Color(0xFF90AD19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      /**
   *  3 - Text Button
   */
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF90AD19), textStyle: const TextStyle(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
/**
 * 4- Floating action button
 */
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF90AD19),
        foregroundColor: Colors.black,
        iconSize: 18,
      ),
      /**
     *************************************************************************
     ***************************  TextField Section **************************
     *************************************************************************
     * */
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: const Color(0xFF90AD19),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF90AD19))),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF90AD19)),
        ),
      ),
      /**
               * *************************** Cursor Color **********************************
               */
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Color(0xFF90AD19)),
      /**
           * ************************* TF prefix - postfix themeing **********************
           */
      iconTheme: const IconThemeData(color: Color(0xFF90AD19)));
}
