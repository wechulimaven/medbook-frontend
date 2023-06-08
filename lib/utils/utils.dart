// decode access token to get owner details
// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'custom_snack.dart';
import 'package:uuid/uuid.dart';

// String getLanguageCode(BuildContext context) {
//   // var languageCode = context.locale.languageCode;

//   /// This must not be null. It may be 'und', representing 'undefined'.
//   if (languageCode == 'und') {
//     languageCode = 'en';
//   }

//   return languageCode;
// }

Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

Future<void> checkNetwork(BuildContext context) async {
  bool isOnline = await hasNetwork();

  if (!isOnline) {
    Snack.error('netConnectionError', context);
  }
}

Future<String> generateUUID() async {
  var uuid = const Uuid();
  return uuid.v4();
}
