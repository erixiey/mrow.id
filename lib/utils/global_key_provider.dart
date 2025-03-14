import 'package:flutter/material.dart';

class GlobalKeyProvider {
  // GlobalKey untuk showcase di RegisterScreen
  static final fullNameKey = GlobalKey();
  static final emailKey = GlobalKey();
  static final phoneKey = GlobalKey();
  static final passwordKey = GlobalKey();
  static final confirmPasswordKey = GlobalKey();
  static final continueKey = GlobalKey();

  // GlobalKey untuk showcase di AdditionalInfoScreen
  static final photoKey = GlobalKey();
  static final addressKey = GlobalKey();
  static final agreementKey = GlobalKey();
  static final signUpKey = GlobalKey();
}