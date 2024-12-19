import 'package:flutter/material.dart';

class TValidation {
  TValidation._();

  static FormFieldValidator<String> get emptyValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the value';
        }
        return null;
      };

  static FormFieldValidator<String> get emailValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      };
  static FormFieldValidator<String> get passwordValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some password';
        }
        if (value.length < 8) {
          if (value.length > 15) {
            return 'Password must be at most 15 characters long';
          }
          return 'Password must be at least 8 characters long';
        }
        if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)').hasMatch(value)) {
          return 'Password must include uppercase, lowercase, and numeric characters';
        }
        return null;
      };
  static FormFieldValidator<String> get usernameValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the username';
        }
        if (value.length > 10) {
          return 'Username must be at most 10 characters long';
        }
        if (value.length < 6) {
          return 'Username must be at least 6 characters long';
        }
        if (!RegExp(r'^[a-z]+$').hasMatch(value)) {
          return 'Username must include only lowercase letters and no numbers';
        }
        return null;
      };
  static FormFieldValidator<String> get firstNameValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the name';
        }
        if (value.length < 2) {
          return 'At least 2 characters long';
        }
        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'Only letters';
        }
        return null;
      };
  static FormFieldValidator<String> get lastNameValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the name';
        }
        if (value.length < 2) {
          return 'At least 2 characters long';
        }
        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'Only letters';
        }
        return null;
      };
  static FormFieldValidator<String> get phoneValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the phone number';
        }
        if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value.trim())) {
          return 'Make sure the phone number is valid';
        }
        return null;
      };

  static FormFieldValidator<String> get postalValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the postal code';
        }

        if (value.length > 6) {
          return 'Postal code must be at most 6 characters long';
        }
        return null;
      };

  static FormFieldValidator<String> get registrationNumberValidator => (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the registration number';
        }
        if (value.length > 10) {
          return 'Registration number must be at most 10 characters long';
        }
        return null;
      };

  static FormFieldValidator<String> colorValidator = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the color';
    }
    if (value.length > 10) {
      return 'Color must be at most 10 characters long';
    }
    return null;
  };
}
