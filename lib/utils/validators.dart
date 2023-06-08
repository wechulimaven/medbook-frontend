import 'package:phone_number/phone_number.dart';

final RegExp emailValidatorRegExp =
    RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

bool validateMobile(String value) {
  if (value.isEmpty) {
    return false;
  } else {
    var regExp = RegExp(r'(^(?:[+0]9)?[0-9]{9}$)');
    return regExp.hasMatch(value);
  }
}

String? validateMobileNumber(String? value) {
  if (value?.isEmpty == true) {
    return 'phoneNumberRequired';
  }
  return null;
}

String? validateNumber(String? value) {
  if (value?.isEmpty == true) {
    return 'idNumberRequired';
  }
  if (value!.length < 4) {
    return "invalidIdNumberlength";
  }
  return null;
}

String? validateMobile2(String? value) {
  var regExp = RegExp(r'(^(?:[+0]9)?[0-9]{9}$)');
  if (value?.isEmpty == true) {
    return 'Phone number is required';
  } else if (!regExp.hasMatch(value!)) {
    return 'Phone number not valid .';
  }
  return null;
}

Future<bool> validateIsoPhoneNumber(
    String name, String code, int prefix, phoneNumber) async {
  var region = RegionInfo(name: name, code: code, prefix: prefix);
  return await PhoneNumberUtil().validate(phoneNumber, regionCode: region.code);
}

bool validateEmail(String? email) {
  if (email?.isEmpty == true) {
    return false;
  } else {
    return emailValidatorRegExp.hasMatch(email!);
  }
}

String? validateEmailField(String? email) {
  if (email?.isEmpty == true) {
    return "Enter a valid email";
  } else {
    if (!emailValidatorRegExp.hasMatch(email!)) {
      return "Enter a valid email";
    }
  }
  return null;
}

bool isPhone(String input) =>
    RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
        .hasMatch(input);

String? validatePhoneEmailField(String? emailPhone) {
  if (emailPhone?.isEmpty == true) {
    return "enterEmailAddressPhone";
  } else {
    if (!emailValidatorRegExp.hasMatch(emailPhone!) && !isPhone(emailPhone)) {
      return "enterValidEmailAddressPhone";
    }
  }
  return null;
}

String? validateAtleastTwoNames(String? name) {
  if (name!.isEmpty) {
    return "Name is required";
  }
  if (name.trim().split(' ').length < 2) {
    return 'Enter at least two names.';
  }
  return null;
}

String? validateAtLeastAName(String? name) {
  if (name!.isEmpty) {
    return "Name is required";
  }
  if (name.trim().length < 2) {
    return 'Enter at least two characters.';
  }
  return null;
}
