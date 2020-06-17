// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `IdeaShare`
  String get authScreenTitle {
    return Intl.message(
      'IdeaShare',
      name: 'authScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Share your ideas with the world or keep them private`
  String get authScreenSubtitle {
    return Intl.message(
      'Share your ideas with the world or keep them private',
      name: 'authScreenSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get authScreenSignIn {
    return Intl.message(
      'Sign In',
      name: 'authScreenSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get authScreenSignUp {
    return Intl.message(
      'Sign Up',
      name: 'authScreenSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInScreenAppBarTitle {
    return Intl.message(
      'Sign In',
      name: 'signInScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get socialFooterOr {
    return Intl.message(
      'Or',
      name: 'socialFooterOr',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get socialFooterFacebook {
    return Intl.message(
      'Facebook',
      name: 'socialFooterFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get socialFooterGoogle {
    return Intl.message(
      'Google',
      name: 'socialFooterGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get signInScreenForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'signInScreenForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInScreenButton {
    return Intl.message(
      'Sign in',
      name: 'signInScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get signInScreenEmailAddress {
    return Intl.message(
      'Email address',
      name: 'signInScreenEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signInScreenPassword {
    return Intl.message(
      'Password',
      name: 'signInScreenPassword',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get errorRequired {
    return Intl.message(
      'Required',
      name: 'errorRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email address invalid`
  String get errorEmailnvalid {
    return Intl.message(
      'Email address invalid',
      name: 'errorEmailnvalid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid: must have at least 6 characters`
  String get errorPasswordInvalid {
    return Intl.message(
      'Invalid: must have at least 6 characters',
      name: 'errorPasswordInvalid',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get signUpScreenFirstName {
    return Intl.message(
      'First name',
      name: 'signUpScreenFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get signUpScreenLastName {
    return Intl.message(
      'Last name',
      name: 'signUpScreenLastName',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get signUpScreenEmailAddress {
    return Intl.message(
      'Email address',
      name: 'signUpScreenEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signUpScreenPassword {
    return Intl.message(
      'Password',
      name: 'signUpScreenPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpScreenButton {
    return Intl.message(
      'Sign up',
      name: 'signUpScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpScreenAppBarTitle {
    return Intl.message(
      'Sign Up',
      name: 'signUpScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}