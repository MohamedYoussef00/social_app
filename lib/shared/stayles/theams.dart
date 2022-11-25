
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/shared/stayles/colors.dart';


ThemeData lightTheam ()=>ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      elevation: 0.0,
      backgroundColor:  Colors.white,
      titleTextStyle:TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),

  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor:  Colors.white,
    type: BottomNavigationBarType.fixed,
    elevation: 50.0,
    selectedItemColor: defulteColor,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
    bodyText1:TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.2,
    ) ,
    subtitle1:TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.2,
    ) ,
  ),
  primarySwatch: defulteColor,
  fontFamily: 'Jannah',
);



ThemeData darckTheam ()=>ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  HexColor('333739'),
          statusBarIconBrightness: Brightness.light
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      elevation: 0.0,
      backgroundColor:   HexColor('333739'),
      titleTextStyle:TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor:  HexColor('333739'),
    type: BottomNavigationBarType.fixed,
    elevation: 50.0,
    selectedItemColor: defulteColor,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
    bodyText1:TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.2,
    ) ,
    subtitle1:TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.2,
    ) ,
  ),
  primarySwatch: defulteColor,
  fontFamily: 'Jannah'
);