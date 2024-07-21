import "dart:core";

import "package:flutter/foundation.dart";

class Logger {
  static bool _isDebug = false;
  static set setDebugMode(bool value) => _isDebug = value;

  static const _red = "\x1B[31m";
  static const _green = "\x1B[32m";
  static const _cyan = "\x1B[36m";
  static const _yellow = "\x1B[33m";

  static void _printer(String color, String tag, dynamic value) {
    String text =
        "$color\n$tag: \n${'-' * 60}\n${_valueHandler(value)} \n${'-' * 60} ";
    if (kDebugMode) {
      print(text);
    }
  }

  static String _valueHandler(dynamic value) {
    String text = "";

    if (value is List) {
      for (var element in value) {
        text += (element + "\n");
      }
    } else if (value is String) {
      text = value;
    } else {
      text = value.toString();
    }

    return text;
  }

  static error(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_red, tag, value);
    }
  }

  static warning(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_yellow, tag, value);
    }
  }

  static info(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_cyan, tag, value);
    }
  }

  static success(String tag, dynamic value) {
    if (_isDebug) {
      _printer(_green, tag, value);
    }
  }
}