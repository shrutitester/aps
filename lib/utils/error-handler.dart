import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../constants/stringConstant.dart';

class ErrorHandler {
  static String getError(String body) {
    try {
      final jsonObj = json.decode(body);
      return jsonObj['details']['message'];
    } catch (e) {
      debugPrint(e.toString());
      return StringConstants.apiError;
    }
  }
}
