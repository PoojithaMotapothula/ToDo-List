import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ThemeController extends GetxController {
final isDarkMode = false.obs;
final mainColor = Colors.white.obs;
final iconColor = Colors.black.obs;
final textColor = Colors.white.obs;
void changeMode() {
// ignore: unrelated_type_equality_checks
if (isDarkMode == true) {
changeIntoLightMode();
} else {
changeIntoDarkMode();
}
}
void changeIntoLightMode() {
ThemeData.light();
mainColor.value = Colors.white;
iconColor.value = Colors.black;
textColor.value = Colors.white;
isDarkMode.value = false;
}
void changeIntoDarkMode() {
ThemeData.dark();
mainColor.value = Colors.black;
iconColor.value = Colors.white;
textColor.value = Colors.white;
isDarkMode.value = true;
}
}