import 'dart:developer' as d;
import 'package:flutter/foundation.dart';

class PrintX {
  // Warning
  void warning(String meg) {
    if (kDebugMode) {
      d.log('\x1B[33m$meg\x1B[0m');
    }
  }

  // Information
  void info(String msg) {
    if (kDebugMode) {
      d.log('\x1B[34m$msg\x1B[0m');
    }
  }

  // Success
  void success(String msg) {
    if (kDebugMode) {
      d.log('\x1B[32m$msg\x1B[0m');
    }
  }

  // Error
  void error(String msg) {
    if (kDebugMode) {
      d.log('\x1B[31m$msg\x1B[0m');
    }
  }
}
