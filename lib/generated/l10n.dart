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

  /// `Forgot Password`
  String get forgotPasswordScreenAppBarTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get forgotPasswordScreenEmailAddress {
    return Intl.message(
      'Email address',
      name: 'forgotPasswordScreenEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get forgotPasswordScreenButton {
    return Intl.message(
      'Send',
      name: 'forgotPasswordScreenButton',
      desc: '',
      args: [],
    );
  }

  /// `We'll send you an email to reset your password.`
  String get forgotPasswordScreenText {
    return Intl.message(
      'We\'ll send you an email to reset your password.',
      name: 'forgotPasswordScreenText',
      desc: '',
      args: [],
    );
  }

  /// `Picture`
  String get selectPictureScreenAppBarTitle {
    return Intl.message(
      'Picture',
      name: 'selectPictureScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get selectPictureScreenSaveButton {
    return Intl.message(
      'Save',
      name: 'selectPictureScreenSaveButton',
      desc: '',
      args: [],
    );
  }

  /// `Import picture`
  String get selectPictureScreenImportButton {
    return Intl.message(
      'Import picture',
      name: 'selectPictureScreenImportButton',
      desc: '',
      args: [],
    );
  }

  /// `Take picture`
  String get selectPictureScreenTakeButton {
    return Intl.message(
      'Take picture',
      name: 'selectPictureScreenTakeButton',
      desc: '',
      args: [],
    );
  }

  /// `Select from default`
  String get selectPictureScreenFromDefaultButton {
    return Intl.message(
      'Select from default',
      name: 'selectPictureScreenFromDefaultButton',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get selectPictureScreenSkip {
    return Intl.message(
      'Skip',
      name: 'selectPictureScreenSkip',
      desc: '',
      args: [],
    );
  }

  /// `Sign in failed`
  String get signInScreenFailed {
    return Intl.message(
      'Sign in failed',
      name: 'signInScreenFailed',
      desc: '',
      args: [],
    );
  }

  /// `The password must be 6 characters long or more.`
  String get errorWeakPassword {
    return Intl.message(
      'The password must be 6 characters long or more.',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `The credentials are invalid.`
  String get errorInvalidCredential {
    return Intl.message(
      'The credentials are invalid.',
      name: 'errorInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already registered.`
  String get errorEmailAlreadyInUse {
    return Intl.message(
      'The email address is already registered.',
      name: 'errorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The email address is invalid.`
  String get errorInvalidEmail {
    return Intl.message(
      'The email address is invalid.',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The password is incorrect.`
  String get errorWrongPassword {
    return Intl.message(
      'The password is incorrect.',
      name: 'errorWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not registered.`
  String get errorUserNotFound {
    return Intl.message(
      'The email address is not registered.',
      name: 'errorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `We have blocked all requests from this device due to unusual activity. Try again later.`
  String get errorTooManyRequests {
    return Intl.message(
      'We have blocked all requests from this device due to unusual activity. Try again later.',
      name: 'errorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `This sign in method is not allowed. Please contact support.`
  String get errorOperationNotAllowed {
    return Intl.message(
      'This sign in method is not allowed. Please contact support.',
      name: 'errorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `This operation could not be completed due to a server error.`
  String get errorDefault {
    return Intl.message(
      'This operation could not be completed due to a server error.',
      name: 'errorDefault',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up failed`
  String get signUpScreenFailed {
    return Intl.message(
      'Sign Up failed',
      name: 'signUpScreenFailed',
      desc: '',
      args: [],
    );
  }

  /// `Send email failed`
  String get forgotPasswordScreenFailed {
    return Intl.message(
      'Send email failed',
      name: 'forgotPasswordScreenFailed',
      desc: '',
      args: [],
    );
  }

  /// `Email sent successfully`
  String get forgotPasswordScreenSuccessTitle {
    return Intl.message(
      'Email sent successfully',
      name: 'forgotPasswordScreenSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `An email has been sent. Follow the instruction to reset your password.`
  String get forgotPasswordScreenSuccessContent {
    return Intl.message(
      'An email has been sent. Follow the instruction to reset your password.',
      name: 'forgotPasswordScreenSuccessContent',
      desc: '',
      args: [],
    );
  }

  /// `Missing Google Auth Token`
  String get errorMissingGoogleAuthToken {
    return Intl.message(
      'Missing Google Auth Token',
      name: 'errorMissingGoogleAuthToken',
      desc: '',
      args: [],
    );
  }

  /// `Sign in aborted by user`
  String get errorAbortedByUser {
    return Intl.message(
      'Sign in aborted by user',
      name: 'errorAbortedByUser',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.`
  String get errorAccountExistsWithDifferentCredential {
    return Intl.message(
      'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
      name: 'errorAccountExistsWithDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `Default Picture`
  String get defaultPictureScreenAppBarTitle {
    return Intl.message(
      'Default Picture',
      name: 'defaultPictureScreenAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get defaultPictureScreenSave {
    return Intl.message(
      'OK',
      name: 'defaultPictureScreenSave',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get defaultPictureScreenNoImage {
    return Intl.message(
      'No image',
      name: 'defaultPictureScreenNoImage',
      desc: '',
      args: [],
    );
  }

  /// `Select a default picture`
  String get defaultPictureScreenErrorTitle {
    return Intl.message(
      'Select a default picture',
      name: 'defaultPictureScreenErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get noImage {
    return Intl.message(
      'No image',
      name: 'noImage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get tabTitleHome {
    return Intl.message(
      'Home',
      name: 'tabTitleHome',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get tabTitleSearch {
    return Intl.message(
      'Search',
      name: 'tabTitleSearch',
      desc: '',
      args: [],
    );
  }

  /// `Add post`
  String get tabTitleAddPost {
    return Intl.message(
      'Add post',
      name: 'tabTitleAddPost',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get tabTitleNotifications {
    return Intl.message(
      'Notifications',
      name: 'tabTitleNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get tabTitleProfile {
    return Intl.message(
      'Profile',
      name: 'tabTitleProfile',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get addPostTitleCategory {
    return Intl.message(
      'Category',
      name: 'addPostTitleCategory',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get addPostTitleInfo {
    return Intl.message(
      'Info',
      name: 'addPostTitleInfo',
      desc: '',
      args: [],
    );
  }

  /// `Optional Info`
  String get addPostTitleOptionalInfo {
    return Intl.message(
      'Optional Info',
      name: 'addPostTitleOptionalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Linked Issue`
  String get addPostTitleLinkedIssue {
    return Intl.message(
      'Linked Issue',
      name: 'addPostTitleLinkedIssue',
      desc: '',
      args: [],
    );
  }

  /// `Labels`
  String get addPostTitleLabels {
    return Intl.message(
      'Labels',
      name: 'addPostTitleLabels',
      desc: '',
      args: [],
    );
  }

  /// `Share Options`
  String get addPostTitleShareOptions {
    return Intl.message(
      'Share Options',
      name: 'addPostTitleShareOptions',
      desc: '',
      args: [],
    );
  }

  /// `Resume`
  String get addPostTitleResume {
    return Intl.message(
      'Resume',
      name: 'addPostTitleResume',
      desc: '',
      args: [],
    );
  }

  /// `Add Post`
  String get addPostTitleAddPost {
    return Intl.message(
      'Add Post',
      name: 'addPostTitleAddPost',
      desc: '',
      args: [],
    );
  }

  /// `START`
  String get addPostStartButton {
    return Intl.message(
      'START',
      name: 'addPostStartButton',
      desc: '',
      args: [],
    );
  }

  /// `of`
  String get addPostBottomProgressOf {
    return Intl.message(
      'of',
      name: 'addPostBottomProgressOf',
      desc: '',
      args: [],
    );
  }

  /// `Idea`
  String get addPostCategoryIdeaTitle {
    return Intl.message(
      'Idea',
      name: 'addPostCategoryIdeaTitle',
      desc: '',
      args: [],
    );
  }

  /// `Issue`
  String get addPostCategoryIssueTitle {
    return Intl.message(
      'Issue',
      name: 'addPostCategoryIssueTitle',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get addPostInfoInputTitle {
    return Intl.message(
      'Title',
      name: 'addPostInfoInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resume`
  String get addPostInfoInputResume {
    return Intl.message(
      'Resume',
      name: 'addPostInfoInputResume',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get addPostInfoInputDescription {
    return Intl.message(
      'Description',
      name: 'addPostInfoInputDescription',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get addPostOptionalInfoNoteTitle {
    return Intl.message(
      'Note',
      name: 'addPostOptionalInfoNoteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Only you can read this note.`
  String get addPostOptionalInfoNoteDescription {
    return Intl.message(
      'Only you can read this note.',
      name: 'addPostOptionalInfoNoteDescription',
      desc: '',
      args: [],
    );
  }

  /// `Links`
  String get addPostOptionalInfoLinksTitle {
    return Intl.message(
      'Links',
      name: 'addPostOptionalInfoLinksTitle',
      desc: '',
      args: [],
    );
  }

  /// `Useful website that help describe your post.`
  String get addPostOptionalInfoLinksDescription {
    return Intl.message(
      'Useful website that help describe your post.',
      name: 'addPostOptionalInfoLinksDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Links`
  String get addPostOptionalInfoLinksAlertTitle {
    return Intl.message(
      'Links',
      name: 'addPostOptionalInfoLinksAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `URL`
  String get addPostOptionalInfoLinksUrl {
    return Intl.message(
      'URL',
      name: 'addPostOptionalInfoLinksUrl',
      desc: '',
      args: [],
    );
  }

  /// `Invalid URL`
  String get invalidUrl {
    return Intl.message(
      'Invalid URL',
      name: 'invalidUrl',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get addPostOptionalInfoLanguageTitle {
    return Intl.message(
      'Language',
      name: 'addPostOptionalInfoLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `The language of your post.`
  String get addPostOptionalInfoLanguageDescription {
    return Intl.message(
      'The language of your post.',
      name: 'addPostOptionalInfoLanguageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Populars`
  String get addPostOptionalInfoLanguageSectionTitlePopulars {
    return Intl.message(
      'Populars',
      name: 'addPostOptionalInfoLanguageSectionTitlePopulars',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get addPostOptionalInfoLanguageSectionTitleOthers {
    return Intl.message(
      'Languages',
      name: 'addPostOptionalInfoLanguageSectionTitleOthers',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get addPostOptionalInfoImagesTitle {
    return Intl.message(
      'Images',
      name: 'addPostOptionalInfoImagesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add images that helps describe your post. Click on an image to make it the first one and display it on the list of posts.`
  String get addPostOptionalInfoImagesDescription {
    return Intl.message(
      'Add images that helps describe your post. Click on an image to make it the first one and display it on the list of posts.',
      name: 'addPostOptionalInfoImagesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Only for idea`
  String get addPostLinkedIssueUnavailable {
    return Intl.message(
      'Only for idea',
      name: 'addPostLinkedIssueUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `No linked issue`
  String get addPostLinkedIssueNull {
    return Intl.message(
      'No linked issue',
      name: 'addPostLinkedIssueNull',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get addPostLinkedIssueSearch {
    return Intl.message(
      'Search',
      name: 'addPostLinkedIssueSearch',
      desc: '',
      args: [],
    );
  }

  /// `No labels available`
  String get addPostLabelsUnavailable {
    return Intl.message(
      'No labels available',
      name: 'addPostLabelsUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Everyone`
  String get visiblenessEveryone {
    return Intl.message(
      'Everyone',
      name: 'visiblenessEveryone',
      desc: '',
      args: [],
    );
  }

  /// `Approval`
  String get visiblenessApproval {
    return Intl.message(
      'Approval',
      name: 'visiblenessApproval',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get visiblenessFollow {
    return Intl.message(
      'Follow',
      name: 'visiblenessFollow',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get visiblenessWork {
    return Intl.message(
      'Work',
      name: 'visiblenessWork',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get visiblenessNone {
    return Intl.message(
      'None',
      name: 'visiblenessNone',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get shareOptionPrivate {
    return Intl.message(
      'Private',
      name: 'shareOptionPrivate',
      desc: '',
      args: [],
    );
  }

  /// `Anonymous`
  String get shareOptionsAnonymous {
    return Intl.message(
      'Anonymous',
      name: 'shareOptionsAnonymous',
      desc: '',
      args: [],
    );
  }

  /// `Allow actions`
  String get shareOptionsAllowActions {
    return Intl.message(
      'Allow actions',
      name: 'shareOptionsAllowActions',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get shareOptionsLike {
    return Intl.message(
      'Like',
      name: 'shareOptionsLike',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get shareOptionsComment {
    return Intl.message(
      'Comment',
      name: 'shareOptionsComment',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get shareOptionsHelp {
    return Intl.message(
      'Help',
      name: 'shareOptionsHelp',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get shareOptionsFollow {
    return Intl.message(
      'Follow',
      name: 'shareOptionsFollow',
      desc: '',
      args: [],
    );
  }

  /// `Work`
  String get shareOptionsWork {
    return Intl.message(
      'Work',
      name: 'shareOptionsWork',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get shareOptionsContact {
    return Intl.message(
      'Contact',
      name: 'shareOptionsContact',
      desc: '',
      args: [],
    );
  }

  /// `Linked Idea`
  String get shareOptionsLinkedPost {
    return Intl.message(
      'Linked Idea',
      name: 'shareOptionsLinkedPost',
      desc: '',
      args: [],
    );
  }

  /// `Who see what?`
  String get shareOptionsSee {
    return Intl.message(
      'Who see what?',
      name: 'shareOptionsSee',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get shareOptionsNews {
    return Intl.message(
      'News',
      name: 'shareOptionsNews',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get shareOptionsStatus {
    return Intl.message(
      'Status',
      name: 'shareOptionsStatus',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get addPostShareOptionsAppBarButton {
    return Intl.message(
      'Reset',
      name: 'addPostShareOptionsAppBarButton',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get imagesSectionTitle {
    return Intl.message(
      'Images',
      name: 'imagesSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageSectionTitle {
    return Intl.message(
      'Language',
      name: 'languageSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Idea`
  String get postTypeIdea {
    return Intl.message(
      'Idea',
      name: 'postTypeIdea',
      desc: '',
      args: [],
    );
  }

  /// `Issue`
  String get postTypeIssue {
    return Intl.message(
      'Issue',
      name: 'postTypeIssue',
      desc: '',
      args: [],
    );
  }

  /// `Link`
  String get linksSectionAlertTitle {
    return Intl.message(
      'Link',
      name: 'linksSectionAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `URL`
  String get linksSectionUrl {
    return Intl.message(
      'URL',
      name: 'linksSectionUrl',
      desc: '',
      args: [],
    );
  }

  /// `Links`
  String get linksSectionTitle {
    return Intl.message(
      'Links',
      name: 'linksSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get addPostDelete {
    return Intl.message(
      'Delete',
      name: 'addPostDelete',
      desc: '',
      args: [],
    );
  }

  /// `Do you want really want erase it?`
  String get addPostDeleteMessage {
    return Intl.message(
      'Do you want really want erase it?',
      name: 'addPostDeleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Do you want save this post?`
  String get addPostSaveMessage {
    return Intl.message(
      'Do you want save this post?',
      name: 'addPostSaveMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete post`
  String get addPostDeleteTitle {
    return Intl.message(
      'Delete post',
      name: 'addPostDeleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save post`
  String get addPostSaveTitle {
    return Intl.message(
      'Save post',
      name: 'addPostSaveTitle',
      desc: '',
      args: [],
    );
  }

  /// `is required`
  String get isRequired {
    return Intl.message(
      'is required',
      name: 'isRequired',
      desc: '',
      args: [],
    );
  }

  /// `Your post is being uploaded`
  String get addPostLoadingTitle {
    return Intl.message(
      'Your post is being uploaded',
      name: 'addPostLoadingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Uploading images`
  String get addPostLoadingImages {
    return Intl.message(
      'Uploading images',
      name: 'addPostLoadingImages',
      desc: '',
      args: [],
    );
  }

  /// `Completing post`
  String get addPostLoadingPost {
    return Intl.message(
      'Completing post',
      name: 'addPostLoadingPost',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get addPostSuccessTitle {
    return Intl.message(
      'Success!',
      name: 'addPostSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your post has been upload!`
  String get addPostSuccessMessage {
    return Intl.message(
      'Your post has been upload!',
      name: 'addPostSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Add another post`
  String get addPostSuccessAnother {
    return Intl.message(
      'Add another post',
      name: 'addPostSuccessAnother',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Error!`
  String get addPostFailTitle {
    return Intl.message(
      'Error!',
      name: 'addPostFailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, your post has not been uploaded.`
  String get addPostFailMessage {
    return Intl.message(
      'Something went wrong, your post has not been uploaded.',
      name: 'addPostFailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Edit post`
  String get addPostFailEdit {
    return Intl.message(
      'Edit post',
      name: 'addPostFailEdit',
      desc: '',
      args: [],
    );
  }

  /// `Take a picture`
  String get imageSectionCameraTitle {
    return Intl.message(
      'Take a picture',
      name: 'imageSectionCameraTitle',
      desc: '',
      args: [],
    );
  }

  /// `Import from gallery`
  String get imageSectionGalleryTitle {
    return Intl.message(
      'Import from gallery',
      name: 'imageSectionGalleryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get postStatusTypeOpen {
    return Intl.message(
      'Open',
      name: 'postStatusTypeOpen',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing`
  String get postStatusTypeOngoing {
    return Intl.message(
      'Ongoing',
      name: 'postStatusTypeOngoing',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get postStatusTypeCompleted {
    return Intl.message(
      'Completed',
      name: 'postStatusTypeCompleted',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get timeAgoJustNow {
    return Intl.message(
      'Just now',
      name: 'timeAgoJustNow',
      desc: '',
      args: [],
    );
  }

  /// `{second, plural, one{1 sec} other{{second} secs}}`
  String timeAgoSec(num second) {
    return Intl.plural(
      second,
      one: '1 sec',
      other: '$second secs',
      name: 'timeAgoSec',
      desc: '',
      args: [second],
    );
  }

  /// `{minute, plural, one{1 min} other{{minute} mins}}`
  String timeAgoMin(num minute) {
    return Intl.plural(
      minute,
      one: '1 min',
      other: '$minute mins',
      name: 'timeAgoMin',
      desc: '',
      args: [minute],
    );
  }

  /// `{hour, plural, one{1 hr} other{{hour} hrs}}`
  String timeAgoHr(num hour) {
    return Intl.plural(
      hour,
      one: '1 hr',
      other: '$hour hrs',
      name: 'timeAgoHr',
      desc: '',
      args: [hour],
    );
  }

  /// `{day, plural, one{1 day} other{{day} days}}`
  String timeAgoDay(num day) {
    return Intl.plural(
      day,
      one: '1 day',
      other: '$day days',
      name: 'timeAgoDay',
      desc: '',
      args: [day],
    );
  }

  /// `{week, plural, one{1 week} other{{week} weeks}}`
  String timeAgoWeek(num week) {
    return Intl.plural(
      week,
      one: '1 week',
      other: '$week weeks',
      name: 'timeAgoWeek',
      desc: '',
      args: [week],
    );
  }

  /// `{month, plural, one{1 mo} other{{month} mos}}`
  String timeAgoMo(num month) {
    return Intl.plural(
      month,
      one: '1 mo',
      other: '$month mos',
      name: 'timeAgoMo',
      desc: '',
      args: [month],
    );
  }

  /// `Yesterday`
  String get timeAgoYesterday {
    return Intl.message(
      'Yesterday',
      name: 'timeAgoYesterday',
      desc: '',
      args: [],
    );
  }

  /// `Last week`
  String get timeAgoLastWeek {
    return Intl.message(
      'Last week',
      name: 'timeAgoLastWeek',
      desc: '',
      args: [],
    );
  }

  /// `Last month`
  String get timeAgoLastMonth {
    return Intl.message(
      'Last month',
      name: 'timeAgoLastMonth',
      desc: '',
      args: [],
    );
  }

  /// `at`
  String get timeAgoAt {
    return Intl.message(
      'at',
      name: 'timeAgoAt',
      desc: '',
      args: [],
    );
  }

  /// `Posts not found`
  String get postsNotFound {
    return Intl.message(
      'Posts not found',
      name: 'postsNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get postsAppBarTitle {
    return Intl.message(
      'Posts',
      name: 'postsAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit post`
  String get postEditPost {
    return Intl.message(
      'Edit post',
      name: 'postEditPost',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get postTabBarInfo {
    return Intl.message(
      'Info',
      name: 'postTabBarInfo',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get postTabBarComments {
    return Intl.message(
      'Comments',
      name: 'postTabBarComments',
      desc: '',
      args: [],
    );
  }

  /// `Helps`
  String get postTabBarHelps {
    return Intl.message(
      'Helps',
      name: 'postTabBarHelps',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get postTabBarNews {
    return Intl.message(
      'News',
      name: 'postTabBarNews',
      desc: '',
      args: [],
    );
  }

  /// `Linked`
  String get postTabBarLinked {
    return Intl.message(
      'Linked',
      name: 'postTabBarLinked',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get postTabBarNotes {
    return Intl.message(
      'Notes',
      name: 'postTabBarNotes',
      desc: '',
      args: [],
    );
  }

  /// `No comments`
  String get postCommentsNotFoundTitle {
    return Intl.message(
      'No comments',
      name: 'postCommentsNotFoundTitle',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to leave a comment!`
  String get postCommentsNotFoundDescription {
    return Intl.message(
      'Be the first to leave a comment!',
      name: 'postCommentsNotFoundDescription',
      desc: '',
      args: [],
    );
  }

  /// `New comment`
  String get newComment {
    return Intl.message(
      'New comment',
      name: 'newComment',
      desc: '',
      args: [],
    );
  }

  /// `Comment successfully deleted`
  String get postCommentDeletedSuccess {
    return Intl.message(
      'Comment successfully deleted',
      name: 'postCommentDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get undo {
    return Intl.message(
      'Undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// `Note successfully deleted`
  String get postNoteDeletedSuccess {
    return Intl.message(
      'Note successfully deleted',
      name: 'postNoteDeletedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get noteScreenPlaceholder {
    return Intl.message(
      'Note',
      name: 'noteScreenPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `The language of your help.`
  String get helpLanguageDescription {
    return Intl.message(
      'The language of your help.',
      name: 'helpLanguageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add images that helps describe your help. Double click on an image to make it the first one.`
  String get helpImageDescription {
    return Intl.message(
      'Add images that helps describe your help. Double click on an image to make it the first one.',
      name: 'helpImageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get helpTitlePlaceholder {
    return Intl.message(
      'Title',
      name: 'helpTitlePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get helpDescription {
    return Intl.message(
      'Description',
      name: 'helpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add help`
  String get helpAlertTitle {
    return Intl.message(
      'Add help',
      name: 'helpAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want send this new help?`
  String get helpAlertMessage {
    return Intl.message(
      'Do you want send this new help?',
      name: 'helpAlertMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete help`
  String get helpDeleteAlertTitle {
    return Intl.message(
      'Delete help',
      name: 'helpDeleteAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want delete this help?`
  String get helpAlertDeleteMessage {
    return Intl.message(
      'Do you want delete this help?',
      name: 'helpAlertDeleteMessage',
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