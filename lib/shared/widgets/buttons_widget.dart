import 'package:flutter/material.dart';

import '../../constants/dimens.dart';
import '../../theme/theme_extensions/app_button_theme.dart';

Widget successElevatedButton(
  context, {
  required String title,
  required Function() onPressed,
}) {
  final themeData = Theme.of(context);
  final appButtonTheme = themeData.extension<AppButtonTheme>()!;
  return ElevatedButton(
    onPressed: onPressed,
    style: appButtonTheme.successElevated,
    child: Text(title),
  );
}

Widget successElevatedButtonWithIcon(
  context, {
  required String title,
  required IconData icons,
  required Function() onPressed,
}) {
  final themeData = Theme.of(context);
  final appButtonTheme = themeData.extension<AppButtonTheme>()!;
  return ElevatedButton(
    onPressed: onPressed,
    style: appButtonTheme.successElevated,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: kTextPadding),
          child: Icon(icons),
        ),
        Text(title),
      ],
    ),
  );
}

Widget infoElevatedButton(
  context, {
  required String title,
  required Function() onPressed,
}) {
  final themeData = Theme.of(context);
  final appButtonTheme = themeData.extension<AppButtonTheme>()!;
  return ElevatedButton(
    onPressed: onPressed,
    style: appButtonTheme.infoElevated,
    child: Text(title),
  );
}

Widget infoElevatedButtonWithIcon(
  context, {
  required String title,
  required IconData icons,
  required Function() onPressed,
}) {
  final themeData = Theme.of(context);
  final appButtonTheme = themeData.extension<AppButtonTheme>()!;
  return ElevatedButton(
    onPressed: onPressed,
    style: appButtonTheme.infoElevated,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: kTextPadding),
          child: Icon(icons),
        ),
        Text(title),
      ],
    ),
  );
}

Widget exitButtonWithIcon(
  context, {
  required String title,
  required IconData icons,
  required Function() onPressed,
}) {
  final themeData = Theme.of(context);
  final appButtonTheme = themeData.extension<AppButtonTheme>()!;
  return ElevatedButton(
    onPressed: onPressed,
    style: appButtonTheme.errorElevated,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: kTextPadding),
          child: Icon(icons),
        ),
        Text(title),
      ],
    ),
  );
}
