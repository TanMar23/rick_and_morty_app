import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UiUtils {
  static Color getStatusColor({required String status}) {
    Color colorStatus;
    switch (status) {
      case 'Alive':
        colorStatus = const Color(0xFF55CB44);
        break;
      case 'Dead':
        colorStatus = Colors.red;
        break;
      case 'unknown':
        colorStatus = const Color(0xFFFF9800);
        break;
      default:
        colorStatus = Colors.black;
    }
    return colorStatus;
  }

  static ThemeData getAppTheme() => ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(32, 35, 40, 1),
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(color: Colors.grey.shade300),
          subtitle1: TextStyle(
            color: Colors.grey.shade200,
            fontWeight: FontWeight.w500,
          ),
          subtitle2: const TextStyle(
            color: Colors.grey,
          ),
          labelMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(39, 43, 51, 1),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.white),
      );

  static String convertToThreeDigits({required String id}) {
    if (id.characters.length == 1) {
      return '00$id';
    } else if (id.characters.length == 2) {
      return '0$id';
    } else {
      return id;
    }
  }

  static IconData getGenderIcon({required String gender}) {
    IconData genderIcon;
    switch (gender) {
      case 'Male':
        genderIcon = Icons.male_outlined;
        break;
      case 'Female':
        genderIcon = Icons.female_outlined;
        break;
      default:
        genderIcon = Icons.transgender_outlined;
    }
    return genderIcon;
  }

  static TextOverflow get fade =>
      kIsWeb ? TextOverflow.ellipsis : TextOverflow.fade;
}
