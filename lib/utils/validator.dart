import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Validator {
  static FormFieldValidator<String> email = (email) {
    if (email == null || email.isEmpty) {
      return 'Email is required.';
    }

    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return 'The email you entered is invalid.';
    }

    return null;
  };

  static FormFieldValidator<String> username = (username) {
    if (username == null || username.isEmpty) {
      return 'Full name is required.';
    }

    return null;
  };

  static FormFieldValidator<String> password = (password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 7) {
      return "Password is invalid.";
    }

    return null;
  };

  static FormFieldValidator<String> phoneNumber = (phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }

    String pattern = r'(^(?:[+])?[0-9]{11,12}$)';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(phoneNumber)) {
      return 'Phone number is invalid.';
    }

    return null;
  };

  static FormFieldValidator<String> code = (code) {
    if (code == null || code.isEmpty) {
      return 'Code is required.';
    }

    if (code.length != 4) {
      return "Code is invalid.";
    }

    return null;
  };

  static FormFieldValidator<String>? dateOfBirth = (date) {
    if (date == null || date.isEmpty) {
      return 'Date of birth is required';
    }

    if (DateFormat.yMMMMd().parse(date).isAtLeastYearsOld(18)) {
      return 'You must be 18years and above';
    }

    return null;
  };
}

extension IsAtLeastYearsOld on DateTime {
  bool isAtLeastYearsOld(int years) {
    var now = DateTime.now();
    var boundaryDate = DateTime(now.year - years, now.month, now.day);

    // Discard the time from [this].
    var thisDate = DateTime(year, month, day);

    // Did [thisDate] occur on or before [boundaryDate]?
    return thisDate.compareTo(boundaryDate) > 0;
  }
}
