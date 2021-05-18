import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Color.fromRGBO(18, 19, 33, 1),
  brightness: Brightness.dark,
  backgroundColor: Color.fromRGBO(18, 19, 33, 1),
  scaffoldBackgroundColor: Color.fromRGBO(18, 19, 33, 1),
  colorScheme: ColorScheme.light(),
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.dark(primary: Colors.black),
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

ThemeData bookTheme() {
  TextTheme _bookTextTheme(TextTheme base) {
    return base.copyWith(
        headline4: base.headline4.copyWith(fontFamily: 'Poppins', fontSize: 36.0, color: Color.fromRGBO(24, 25, 38, 1)),
        bodyText1: base.bodyText1.copyWith(
          fontFamily: 'Poppins',
          fontSize: 16.0,
          color: Colors.white10,
        ));
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _bookTextTheme(base.textTheme),
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromRGBO(36, 107, 253, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(24, 25, 38, 1), width: 2.0), borderRadius: BorderRadius.all(Radius.circular(20))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(24, 25, 38, 1), width: 2.0), borderRadius: BorderRadius.all(Radius.circular(20)))),
  );
}
