import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Snack {
  static show({
    required String content,
    SnackType snackType = SnackType.info,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) async {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
        ),
        behavior: behavior,
        backgroundColor: _getSnackbarColor(snackType),
        margin: const EdgeInsets.only(bottom: 10, left: 900, right: 10),
      ),
    );
  }

  static Color _getSnackbarColor(SnackType type) {
    if (type == SnackType.error) {
      return Theme.of(Get.context!).colorScheme.error;
    }
    if (type == SnackType.warning) {
      return Theme.of(Get.context!).colorScheme.surface;
    }
    if (type == SnackType.info) {
      return Theme.of(Get.context!).colorScheme.secondary;
    }
    if (type == SnackType.success) {
      return Colors.greenAccent;
    }
    return Theme.of(Get.context!).colorScheme.onSurface;
  }

  static Color _getSnackbarTextColor(SnackType type) {
    if (type == SnackType.error ||
        type == SnackType.info ||
        type == SnackType.success)
      return Theme.of(Get.context!).colorScheme.onSurface;

    return Theme.of(Get.context!).colorScheme.onSurface;
  }
}

enum SnackType { info, warning, error, success }
