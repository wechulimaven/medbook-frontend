import 'package:flutter/material.dart';

import '../../constants/dimens.dart';
import '../../theme/theme_extensions/app_color_scheme.dart';


Widget customCircularProgressIndicator(
    BuildContext context) {
  final themeData = Theme.of(context);
  final appColorScheme = themeData.extension<AppColorScheme>()!;

  return Padding(
    padding: const EdgeInsets.only(right: kDefaultPadding),
    child: SizedBox(
      height: 30.0,
      width: 30.0,
      child: Theme(
        data: themeData.copyWith(
          colorScheme:
              themeData.colorScheme.copyWith(primary: appColorScheme.success),
        ),
        child: CircularProgressIndicator(
          backgroundColor: themeData.scaffoldBackgroundColor,
        ),
      ),
    ),
  );
}
