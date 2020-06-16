// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get authScreenTitle {
    return Intl.message(
      'IdeaShare',
      name: 'authScreenTitle',
      desc: '',
      args: [],
    );
  }

  String get authScreenSubtitle {
    return Intl.message(
      'Share your ideas with the world or keep them private',
      name: 'authScreenSubtitle',
      desc: '',
      args: [],
    );
  }

  String get authScreenSignIn {
    return Intl.message(
      'Sign In',
      name: 'authScreenSignIn',
      desc: '',
      args: [],
    );
  }

  String get authScreenSignUp {
    return Intl.message(
      'Sign Up',
      name: 'authScreenSignUp',
      desc: '',
      args: [],
    );
  }

  String get signInScreenAppBarTitle {
    return Intl.message(
      'Sign In',
      name: 'signInScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  String get socialFooterOr {
    return Intl.message(
      'Or',
      name: 'socialFooterOr',
      desc: '',
      args: [],
    );
  }

  String get socialFooterFacebook {
    return Intl.message(
      'Facebook',
      name: 'socialFooterFacebook',
      desc: '',
      args: [],
    );
  }

  String get socialFooterGoogle {
    return Intl.message(
      'Google',
      name: 'socialFooterGoogle',
      desc: '',
      args: [],
    );
  }

  String get signInScreenForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'signInScreenForgotPassword',
      desc: '',
      args: [],
    );
  }

  String get signInScreenButton {
    return Intl.message(
      'Sign in',
      name: 'signInScreenButton',
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
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}