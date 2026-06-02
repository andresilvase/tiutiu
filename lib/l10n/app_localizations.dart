import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// No description provided for @crashlyticsInfo.
  ///
  /// In en, this message translates to:
  /// **'To better resolve possible crashes in the application, we would like to receive crash reports automatically.\n\nWould you like to automatically send crash reports to developers?'**
  String get crashlyticsInfo;

  /// No description provided for @permissionDeniedForeverWarning.
  ///
  /// In en, this message translates to:
  /// **'Go to the permissions setting on your device and allow Tiu, tiu to access your location.\n\nOnce finished, you may need to close and open the app and reopen it.'**
  String get permissionDeniedForeverWarning;

  /// No description provided for @noConnectionWarning2.
  ///
  /// In en, this message translates to:
  /// **'You need to be connected to some internet network to be able to adopt a PET, or even to post one for adoption or that is missing!'**
  String get noConnectionWarning2;

  /// No description provided for @haveMoneyEnough.
  ///
  /// In en, this message translates to:
  /// **'Do you have the financial resources to care for an animal? (feed, vaccination, veterinary appointments)'**
  String get haveMoneyEnough;

  /// No description provided for @resetPasswordInstructionsSent.
  ///
  /// In en, this message translates to:
  /// **'Instructions on how to reset your password have been sent to the email address provided.'**
  String get resetPasswordInstructionsSent;

  /// No description provided for @notificationsMessageRequest.
  ///
  /// In en, this message translates to:
  /// **'Stay updated! Enable notifications to receive important alerts and updates in real-time.'**
  String get notificationsMessageRequest;

  /// No description provided for @tryAgainInABrief.
  ///
  /// In en, this message translates to:
  /// **'Posts are temporarily unavailable.\nCheck back in a few minutes.\n\nThank you for understanding!'**
  String get tryAgainInABrief;

  /// No description provided for @aboutForm.
  ///
  /// In en, this message translates to:
  /// **'Generate and share an adoption form in PDF format or WhatsApp message format in a few seconds.'**
  String get aboutForm;

  /// No description provided for @deleteAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'After deleting your account, it cannot be recovered.\n\nDo you want to continue?'**
  String get deleteAccountWarning;

  /// No description provided for @demandRecentLoginWarning.
  ///
  /// In en, this message translates to:
  /// **'This action requires you to login again.\n\nWould you like to logout?'**
  String get demandRecentLoginWarning;

  /// No description provided for @chooseWhereSeePets.
  ///
  /// In en, this message translates to:
  /// **'Choose where you want to see the pets or where you want to post one from.'**
  String get chooseWhereSeePets;

  /// No description provided for @youDontNeedAnAccount.
  ///
  /// In en, this message translates to:
  /// **'You don\'t need to have an account and you can login whenever you want.'**
  String get youDontNeedAnAccount;

  /// No description provided for @authError.
  ///
  /// In en, this message translates to:
  /// **'There was an error with your authentication.\nTry to sign out and sign in again.'**
  String get authError;

  /// No description provided for @allowGetInContatactWithReferences.
  ///
  /// In en, this message translates to:
  /// **'Do you authorize me to contact your references contacts?'**
  String get allowGetInContatactWithReferences;

  /// No description provided for @loadingVideoFirstTime.
  ///
  /// In en, this message translates to:
  /// **'Loading video...\n\nWait for it\nit will only happen this time 😃'**
  String get loadingVideoFirstTime;

  /// No description provided for @videoSizeExceed.
  ///
  /// In en, this message translates to:
  /// **'Maximum video length exceeded!\nVideo must be no longer than 1:30 min'**
  String get videoSizeExceed;

  /// No description provided for @noConnectionWarning.
  ///
  /// In en, this message translates to:
  /// **'These posts may be out of date because you are without internet.'**
  String get noConnectionWarning;

  /// No description provided for @needsAccess.
  ///
  /// In en, this message translates to:
  /// **'needs to know where you are to show animals closest to your location.'**
  String get needsAccess;

  /// No description provided for @haveAnimals.
  ///
  /// In en, this message translates to:
  /// **'Do you have other animals at home? If yes, which ones and how many?'**
  String get haveAnimals;

  /// No description provided for @onlyAnwerWhatYouWant.
  ///
  /// In en, this message translates to:
  /// **'Only answer questions you feel comfortable answering.'**
  String get onlyAnwerWhatYouWant;

  /// No description provided for @friendlyReminderToAdd9Digit.
  ///
  /// In en, this message translates to:
  /// **'Remember to add the 9 in front of the number'**
  String get friendlyReminderToAdd9Digit;

  /// No description provided for @formFilledSuccess.
  ///
  /// In en, this message translates to:
  /// **'Ready, form successfully saved! What do you want to do?'**
  String get formFilledSuccess;

  /// No description provided for @deleteMessageQuestion.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this conversation?'**
  String get deleteMessageQuestion;

  /// No description provided for @verifyEmailToSeeContactInfo.
  ///
  /// In en, this message translates to:
  /// **'Check your email for contact information!'**
  String get verifyEmailToSeeContactInfo;

  /// No description provided for @generateAndShareEmptyFormTXT.
  ///
  /// In en, this message translates to:
  /// **'Generate and share an empty form (Text)'**
  String get generateAndShareEmptyFormTXT;

  /// No description provided for @partnershipWarning.
  ///
  /// In en, this message translates to:
  /// **'Leave correct information so we can contact you!'**
  String get partnershipWarning;

  /// No description provided for @generateAndShareEmptyFormPDF.
  ///
  /// In en, this message translates to:
  /// **'Generate and share an empty form (PDF)'**
  String get generateAndShareEmptyFormPDF;

  /// No description provided for @failureWarning.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while submitting your feedback.'**
  String get failureWarning;

  /// No description provided for @stillSendingAd.
  ///
  /// In en, this message translates to:
  /// **'Still publishing...\n\nPlease wait on this screen!'**
  String get stillSendingAd;

  /// No description provided for @confirmeIfThisNumberIsCorrect.
  ///
  /// In en, this message translates to:
  /// **'Confirm that the number is correct.'**
  String get confirmeIfThisNumberIsCorrect;

  /// No description provided for @haveTimeEnough.
  ///
  /// In en, this message translates to:
  /// **'Do you have enough time to take care of an animal?'**
  String get haveTimeEnough;

  /// No description provided for @haveChildren.
  ///
  /// In en, this message translates to:
  /// **'You have kids? If so, how many and how old are they?'**
  String get haveChildren;

  /// No description provided for @allowCheckBackground.
  ///
  /// In en, this message translates to:
  /// **'Are you willing to pass a background check?'**
  String get allowCheckBackground;

  /// No description provided for @needsAccessToPost.
  ///
  /// In en, this message translates to:
  /// **'needs to know the current location of the PET.'**
  String get needsAccessToPost;

  /// No description provided for @unableToGenerateSharebleFile.
  ///
  /// In en, this message translates to:
  /// **'Unable to generate shareable file.'**
  String get unableToGenerateSharebleFile;

  /// No description provided for @setARadiusToSearchPets.
  ///
  /// In en, this message translates to:
  /// **'Set the radius in km to search for pets.'**
  String get setARadiusToSearchPets;

  /// No description provided for @postCancelMessage.
  ///
  /// In en, this message translates to:
  /// **'Exiting now all data will be lost.\nContinue?'**
  String get postCancelMessage;

  /// No description provided for @wannaAnnounceOnApp.
  ///
  /// In en, this message translates to:
  /// **'I want to advertise my business on Tiu, tiu'**
  String get wannaAnnounceOnApp;

  /// No description provided for @doYouWannaPasteCodeCopied.
  ///
  /// In en, this message translates to:
  /// **'Do you want to paste the copied code'**
  String get doYouWannaPasteCodeCopied;

  /// No description provided for @whichIsDennounceMotive.
  ///
  /// In en, this message translates to:
  /// **'What is the reason for your complaint?'**
  String get whichIsDennounceMotive;

  /// No description provided for @unableToResendEmail.
  ///
  /// In en, this message translates to:
  /// **'Unable to resend email. Try again later!'**
  String get unableToResendEmail;

  /// No description provided for @tryVerifyCodeAgain.
  ///
  /// In en, this message translates to:
  /// **'Could not verify code.\nPlease try again.'**
  String get tryVerifyCodeAgain;

  /// No description provided for @dennounceSentSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Your report was sent successfully!'**
  String get dennounceSentSuccessfully;

  /// No description provided for @turnOnInternetMobile.
  ///
  /// In en, this message translates to:
  /// **'Connect Mobile Internet (3G, 4G or 5G)'**
  String get turnOnInternetMobile;

  /// No description provided for @provideAddressDetails.
  ///
  /// In en, this message translates to:
  /// **'Provide details of where is the PET'**
  String get provideAddressDetails;

  /// No description provided for @willNotLate.
  ///
  /// In en, this message translates to:
  /// **'It will be quick, come back in a few minutes!'**
  String get willNotLate;

  /// No description provided for @verifyInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get verifyInternetConnection;

  /// No description provided for @verifyAccountWarning.
  ///
  /// In en, this message translates to:
  /// **'Your account is not verified yet!'**
  String get verifyAccountWarning;

  /// No description provided for @linkWasSent.
  ///
  /// In en, this message translates to:
  /// **'A verification link has been sent to email'**
  String get linkWasSent;

  /// No description provided for @codeIsValidForMinutes.
  ///
  /// In en, this message translates to:
  /// **'The code is valid for 2 minutes.'**
  String get codeIsValidForMinutes;

  /// No description provided for @otherCaracteristicsOptional.
  ///
  /// In en, this message translates to:
  /// **'Other Features (Optional)'**
  String get otherCaracteristicsOptional;

  /// No description provided for @deletingAccountStarting.
  ///
  /// In en, this message translates to:
  /// **'Initializing account deletion'**
  String get deletingAccountStarting;

  /// No description provided for @successfullyVerifiedCode.
  ///
  /// In en, this message translates to:
  /// **'Code successfully verified!'**
  String get successfullyVerifiedCode;

  /// No description provided for @sendingYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Sending your message to the admin'**
  String get sendingYourMessage;

  /// No description provided for @needsGPS.
  ///
  /// In en, this message translates to:
  /// **'needs GPS / Location service to be enabled!'**
  String get needsGPS;

  /// No description provided for @insertVideo.
  ///
  /// In en, this message translates to:
  /// **'Insert a video - max 1:30 min (Optional)'**
  String get insertVideo;

  /// No description provided for @allQuestionsAreOptionals.
  ///
  /// In en, this message translates to:
  /// **'All questions are optional.'**
  String get allQuestionsAreOptionals;

  /// No description provided for @allDone.
  ///
  /// In en, this message translates to:
  /// **'Everything ready, look how it will turn out!'**
  String get allDone;

  /// No description provided for @successSent.
  ///
  /// In en, this message translates to:
  /// **'Your message has been sent successfully!'**
  String get successSent;

  /// No description provided for @chooseFormFormat.
  ///
  /// In en, this message translates to:
  /// **'Choose the format you want to send'**
  String get chooseFormFormat;

  /// No description provided for @verifyEmailAdvice.
  ///
  /// In en, this message translates to:
  /// **'Only verified accounts can post.'**
  String get verifyEmailAdvice;

  /// No description provided for @checkYourSpam.
  ///
  /// In en, this message translates to:
  /// **'Check your spam folder if necessary.'**
  String get checkYourSpam;

  /// No description provided for @allowContactViaWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Allow contact via WhatsApp'**
  String get allowContactViaWhatsApp;

  /// No description provided for @weAreGettingAllReady.
  ///
  /// In en, this message translates to:
  /// **'Preparing everything for you'**
  String get weAreGettingAllReady;

  /// No description provided for @reviewYourPost.
  ///
  /// In en, this message translates to:
  /// **'Click the card to review your post'**
  String get reviewYourPost;

  /// No description provided for @insertAtLeastOnePicture.
  ///
  /// In en, this message translates to:
  /// **'Insert at least one photo'**
  String get insertAtLeastOnePicture;

  /// No description provided for @preparingPostToShare.
  ///
  /// In en, this message translates to:
  /// **'Preparing the post to share'**
  String get preparingPostToShare;

  /// No description provided for @insertCodeSentToNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter code sent to number'**
  String get insertCodeSentToNumber;

  /// No description provided for @describeDiseaseType.
  ///
  /// In en, this message translates to:
  /// **'Describe the type of illness'**
  String get describeDiseaseType;

  /// No description provided for @weWilSendACodeToThisNumber.
  ///
  /// In en, this message translates to:
  /// **'Let\'s send a code to'**
  String get weWilSendACodeToThisNumber;

  /// No description provided for @foreverDeletedAccount.
  ///
  /// In en, this message translates to:
  /// **'Account deleted forever!'**
  String get foreverDeletedAccount;

  /// No description provided for @confirmAndReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Confirm and receive code'**
  String get confirmAndReceiveCode;

  /// No description provided for @typeAddress.
  ///
  /// In en, this message translates to:
  /// **'Supplement the address (Optional)'**
  String get typeAddress;

  /// No description provided for @loginCouldNotProceed.
  ///
  /// In en, this message translates to:
  /// **'Unable to complete login'**
  String get loginCouldNotProceed;

  /// No description provided for @helpMaintainTheApp.
  ///
  /// In en, this message translates to:
  /// **'Help us maintain this app!'**
  String get helpMaintainTheApp;

  /// No description provided for @headline2.
  ///
  /// In en, this message translates to:
  /// **'Many Cute Pets\nAre Waiting For You'**
  String get headline2;

  /// No description provided for @doLoginWarning.
  ///
  /// In en, this message translates to:
  /// **'Log in to access all features.'**
  String get doLoginWarning;

  /// No description provided for @whenContinue.
  ///
  /// In en, this message translates to:
  /// **'To continue, you MUST accpet our'**
  String get whenContinue;

  /// No description provided for @specifyDennounceMotive.
  ///
  /// In en, this message translates to:
  /// **'Please specify reason'**
  String get specifyDennounceMotive;

  /// No description provided for @announceNoAnswer.
  ///
  /// In en, this message translates to:
  /// **'Advertiser does not respond'**
  String get announceNoAnswer;

  /// No description provided for @closedForMaintenance.
  ///
  /// In en, this message translates to:
  /// **'Closed for maintenance'**
  String get closedForMaintenance;

  /// No description provided for @houseTypeOptions.
  ///
  /// In en, this message translates to:
  /// **'House, apartment, site...'**
  String get houseTypeOptions;

  /// No description provided for @backgroundInfo.
  ///
  /// In en, this message translates to:
  /// **'Background and Contact Check'**
  String get backgroundInfo;

  /// No description provided for @setMyProfileAsONG.
  ///
  /// In en, this message translates to:
  /// **'Configure profile as NGO'**
  String get setMyProfileAsONG;

  /// No description provided for @financialInfo.
  ///
  /// In en, this message translates to:
  /// **'Time and financial resources'**
  String get financialInfo;

  /// No description provided for @anotherUserIssue.
  ///
  /// In en, this message translates to:
  /// **'Problem with another user'**
  String get anotherUserIssue;

  /// No description provided for @isThisPetDisappeared.
  ///
  /// In en, this message translates to:
  /// **'Is this PET missing?'**
  String get isThisPetDisappeared;

  /// No description provided for @dontReceiveEmail.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive an email?'**
  String get dontReceiveEmail;

  /// No description provided for @doNotHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get doNotHaveAnAccount;

  /// No description provided for @backToCivilization.
  ///
  /// In en, this message translates to:
  /// **'Return to civilization'**
  String get backToCivilization;

  /// No description provided for @verifyFilters.
  ///
  /// In en, this message translates to:
  /// **'Check your search filters.'**
  String get verifyFilters;

  /// No description provided for @typePasswordAgain.
  ///
  /// In en, this message translates to:
  /// **'Type the password again'**
  String get typePasswordAgain;

  /// No description provided for @startConversation.
  ///
  /// In en, this message translates to:
  /// **'Start the conversation'**
  String get startConversation;

  /// No description provided for @searchForName.
  ///
  /// In en, this message translates to:
  /// **'Enter the name of a PET...'**
  String get searchForName;

  /// No description provided for @moreDetails.
  ///
  /// In en, this message translates to:
  /// **'More details and description'**
  String get moreDetails;

  /// No description provided for @describBreed.
  ///
  /// In en, this message translates to:
  /// **'Write the name of the breed'**
  String get describBreed;

  /// No description provided for @provideMoreDetails.
  ///
  /// In en, this message translates to:
  /// **'Provide more details'**
  String get provideMoreDetails;

  /// No description provided for @imagesWarning.
  ///
  /// In en, this message translates to:
  /// **'Merely illustrative images'**
  String get imagesWarning;

  /// No description provided for @notificationsWarning.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get notificationsWarning;

  /// No description provided for @alreadyDonated.
  ///
  /// In en, this message translates to:
  /// **'I already donated my PET'**
  String get alreadyDonated;

  /// No description provided for @wannaLeave.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to exit?'**
  String get wannaLeave;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get termsAndConditions;

  /// No description provided for @passwordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get passwordNotMatch;

  /// No description provided for @haveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAnAccount;

  /// No description provided for @houseType.
  ///
  /// In en, this message translates to:
  /// **'What is your property type?'**
  String get houseType;

  /// No description provided for @createNewAccount.
  ///
  /// In en, this message translates to:
  /// **'Create a new account.'**
  String get createNewAccount;

  /// No description provided for @alreadyFoundPet.
  ///
  /// In en, this message translates to:
  /// **'I already found my PET'**
  String get alreadyFoundPet;

  /// No description provided for @alreadyAdopted.
  ///
  /// In en, this message translates to:
  /// **'I already adopted a pet'**
  String get alreadyAdopted;

  /// No description provided for @whatYouWannaDo.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get whatYouWannaDo;

  /// No description provided for @noPostFavorited.
  ///
  /// In en, this message translates to:
  /// **'No PET was favorited.'**
  String get noPostFavorited;

  /// No description provided for @dificultsUse.
  ///
  /// In en, this message translates to:
  /// **'Difficulty using the app'**
  String get dificultsUse;

  /// No description provided for @authentique.
  ///
  /// In en, this message translates to:
  /// **'Please login to continue.'**
  String get authentique;

  /// No description provided for @marriedSeparated.
  ///
  /// In en, this message translates to:
  /// **'Married and Divorced'**
  String get marriedSeparated;

  /// No description provided for @videoPlayerError.
  ///
  /// In en, this message translates to:
  /// **'Error playing video'**
  String get videoPlayerError;

  /// No description provided for @talkAboutThisPet.
  ///
  /// In en, this message translates to:
  /// **'Talk about this PET'**
  String get talkAboutThisPet;

  /// No description provided for @referenceContacts.
  ///
  /// In en, this message translates to:
  /// **'Reference contacts'**
  String get referenceContacts;

  /// No description provided for @chatWithAnnouncer.
  ///
  /// In en, this message translates to:
  /// **'Talk to advertiser'**
  String get chatWithAnnouncer;

  /// No description provided for @writeYourMessage.
  ///
  /// In en, this message translates to:
  /// **'Write your message'**
  String get writeYourMessage;

  /// No description provided for @updatingProfile.
  ///
  /// In en, this message translates to:
  /// **'Updating profile...'**
  String get updatingProfile;

  /// No description provided for @shareMyFormTXT.
  ///
  /// In en, this message translates to:
  /// **'Share my form (Text)'**
  String get shareMyFormTXT;

  /// No description provided for @sendingVideo.
  ///
  /// In en, this message translates to:
  /// **'Uploading the video...'**
  String get sendingVideo;

  /// No description provided for @noPetInMyRegion.
  ///
  /// In en, this message translates to:
  /// **'No PET in my region'**
  String get noPetInMyRegion;

  /// No description provided for @enterAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to your account.'**
  String get enterAccount;

  /// No description provided for @verifyYourNumber.
  ///
  /// In en, this message translates to:
  /// **'Check your number'**
  String get verifyYourNumber;

  /// No description provided for @turnOnLocalization.
  ///
  /// In en, this message translates to:
  /// **'ENABLE LOCATION'**
  String get turnOnLocalization;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'About what you want to talk'**
  String get subject;

  /// No description provided for @shareMyFormPDF.
  ///
  /// In en, this message translates to:
  /// **'Share my form (PDF)'**
  String get shareMyFormPDF;

  /// No description provided for @howCallYou.
  ///
  /// In en, this message translates to:
  /// **'What should I call you?'**
  String get howCallYou;

  /// No description provided for @addVideo.
  ///
  /// In en, this message translates to:
  /// **'If you want, add a video.'**
  String get addVideo;

  /// No description provided for @repeatPassword.
  ///
  /// In en, this message translates to:
  /// **'Repeat the password'**
  String get repeatPassword;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get invalidPhoneNumber;

  /// Minimum size required for a field to be correctly filled in
  ///
  /// In en, this message translates to:
  /// **'{field} must have at least {length} characters'**
  String fieldShouldBeAtLeast(String field, int length);

  /// No description provided for @dennounceUser.
  ///
  /// In en, this message translates to:
  /// **'Report {username}'**
  String dennounceUser(String username);

  /// No description provided for @blockUser.
  ///
  /// In en, this message translates to:
  /// **'Block {username}'**
  String blockUser(String username);

  /// No description provided for @imageQty.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{sending the photo...} other{Sending the photos...}}'**
  String imageQty(num count);

  /// No description provided for @postsQty.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{post} other{posts}}'**
  String postsQty(num count);

  /// No description provided for @isFromYou.
  ///
  /// In en, this message translates to:
  /// **'Is {distanceText} away from you'**
  String isFromYou(String distanceText);

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred'**
  String get genericError;

  /// No description provided for @haveYard.
  ///
  /// In en, this message translates to:
  /// **'Do you have a backyard?'**
  String get haveYard;

  /// No description provided for @editPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Edit phone number'**
  String get editPhoneNumber;

  /// No description provided for @continueAnon.
  ///
  /// In en, this message translates to:
  /// **'Continue anonymously'**
  String get continueAnon;

  /// No description provided for @whereLastSeen.
  ///
  /// In en, this message translates to:
  /// **'Where was last seen'**
  String get whereLastSeen;

  /// No description provided for @changeListVisual.
  ///
  /// In en, this message translates to:
  /// **'Change list view'**
  String get changeListVisual;

  /// No description provided for @authenticanting.
  ///
  /// In en, this message translates to:
  /// **'Authenticating...'**
  String get authenticanting;

  /// No description provided for @authFailure.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed'**
  String get authFailure;

  /// No description provided for @registeringUser.
  ///
  /// In en, this message translates to:
  /// **'Creating account'**
  String get registeringUser;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personalInfo;

  /// No description provided for @loginInProgress.
  ///
  /// In en, this message translates to:
  /// **'Performing Login'**
  String get loginInProgress;

  /// No description provided for @completeProfile.
  ///
  /// In en, this message translates to:
  /// **'Complete profile'**
  String get completeProfile;

  /// No description provided for @verifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get verifyYourEmail;

  /// No description provided for @enterWithemail.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get enterWithemail;

  /// No description provided for @callInWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'Call on WhatsApp'**
  String get callInWhatsapp;

  /// No description provided for @addMorePictures.
  ///
  /// In en, this message translates to:
  /// **'Add more photos'**
  String get addMorePictures;

  /// No description provided for @numberVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified number'**
  String get numberVerified;

  /// No description provided for @houseInfo.
  ///
  /// In en, this message translates to:
  /// **'About your residence'**
  String get houseInfo;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @deleteChat.
  ///
  /// In en, this message translates to:
  /// **'Delete conversation'**
  String get deleteChat;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAccount;

  /// No description provided for @whereIsThisPet.
  ///
  /// In en, this message translates to:
  /// **'Where is the pet'**
  String get whereIsThisPet;

  /// No description provided for @whichBugs.
  ///
  /// In en, this message translates to:
  /// **'What bugs happened?'**
  String get whichBugs;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'Your WhatsApp number'**
  String get whatsapp;

  /// No description provided for @typeYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Type your e-mail'**
  String get typeYourEmail;

  /// No description provided for @selectPetType.
  ///
  /// In en, this message translates to:
  /// **'Select PET type'**
  String get selectPetType;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password.'**
  String get resetPassword;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Updated profile'**
  String get profileUpdated;

  /// No description provided for @noCallOnChat.
  ///
  /// In en, this message translates to:
  /// **'No, talk in chat'**
  String get noCallOnChat;

  /// No description provided for @loadingImage.
  ///
  /// In en, this message translates to:
  /// **'Loading image...'**
  String get loadingImage;

  /// No description provided for @jotSomethingDown.
  ///
  /// In en, this message translates to:
  /// **'Write here...'**
  String get jotSomethingDown;

  /// No description provided for @insertAPicture.
  ///
  /// In en, this message translates to:
  /// **'Insert a photo'**
  String get insertAPicture;

  /// No description provided for @chronicDisease.
  ///
  /// In en, this message translates to:
  /// **'Chronic disease'**
  String get chronicDisease;

  /// No description provided for @caracteristics.
  ///
  /// In en, this message translates to:
  /// **'Characteristics'**
  String get caracteristics;

  /// No description provided for @selectACountry.
  ///
  /// In en, this message translates to:
  /// **'Select a Country'**
  String get selectACountry;

  /// No description provided for @cannotUse.
  ///
  /// In en, this message translates to:
  /// **'I can\'t use the app'**
  String get cannotUse;

  /// No description provided for @maritalStatus.
  ///
  /// In en, this message translates to:
  /// **'Marital Status'**
  String get maritalStatus;

  /// No description provided for @sexualContent.
  ///
  /// In en, this message translates to:
  /// **'Sexual Content'**
  String get sexualContent;

  /// No description provided for @postCancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel post?'**
  String get postCancelTitle;

  /// No description provided for @dennounceVideo.
  ///
  /// In en, this message translates to:
  /// **'Report Video'**
  String get dennounceVideo;

  /// No description provided for @otherCaracteristics.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get otherCaracteristics;

  /// No description provided for @noConnection.
  ///
  /// In en, this message translates to:
  /// **'Without Internet'**
  String get noConnection;

  /// No description provided for @fillAdData.
  ///
  /// In en, this message translates to:
  /// **'Fill in post data'**
  String get fillAdData;

  /// No description provided for @endApp.
  ///
  /// In en, this message translates to:
  /// **'Terminate application'**
  String get endApp;

  /// No description provided for @deletingAd.
  ///
  /// In en, this message translates to:
  /// **'Deleting posts...'**
  String get deletingAd;

  /// No description provided for @deleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Delete message'**
  String get deleteMessage;

  /// No description provided for @createYours.
  ///
  /// In en, this message translates to:
  /// **'Create your own.'**
  String get createYours;

  /// No description provided for @tellUsTheMotive.
  ///
  /// In en, this message translates to:
  /// **'Tell us why'**
  String get tellUsTheMotive;

  /// No description provided for @sendingData.
  ///
  /// In en, this message translates to:
  /// **'Sending data...'**
  String get sendingData;

  /// No description provided for @selectSpecie.
  ///
  /// In en, this message translates to:
  /// **'Select species'**
  String get selectSpecie;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get requiredField;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get openSettings;

  /// No description provided for @hermaphrodite.
  ///
  /// In en, this message translates to:
  /// **'Hermaphrodite'**
  String get hermaphrodite;

  /// No description provided for @headline1.
  ///
  /// In en, this message translates to:
  /// **'Make A New Friend'**
  String get headline1;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get goodAfternoon;

  /// No description provided for @fake.
  ///
  /// In en, this message translates to:
  /// **'It\'s a misleading post'**
  String get fake;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit my profile'**
  String get editProfile;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @changeCountry.
  ///
  /// In en, this message translates to:
  /// **'Change Country'**
  String get changeCountry;

  /// No description provided for @adoptioinForm.
  ///
  /// In en, this message translates to:
  /// **'Adoption Form'**
  String get adoptioinForm;

  /// No description provided for @takeApicture.
  ///
  /// In en, this message translates to:
  /// **'Take a picture'**
  String get takeApicture;

  /// No description provided for @receiveEmail.
  ///
  /// In en, this message translates to:
  /// **'Receive email'**
  String get receiveEmail;

  /// No description provided for @noPostFound.
  ///
  /// In en, this message translates to:
  /// **'Nothing found.'**
  String get noPostFound;

  /// No description provided for @loadingVideo.
  ///
  /// In en, this message translates to:
  /// **'Loading video'**
  String get loadingVideo;

  /// No description provided for @justThis.
  ///
  /// In en, this message translates to:
  /// **'For now it\'s just'**
  String get justThis;

  /// No description provided for @deletingAds.
  ///
  /// In en, this message translates to:
  /// **'Deleting posts'**
  String get deletingAds;

  /// No description provided for @deleteForever.
  ///
  /// In en, this message translates to:
  /// **'Delete post?'**
  String get deleteForever;

  /// No description provided for @adoptionForm.
  ///
  /// In en, this message translates to:
  /// **'Adoption form'**
  String get adoptionForm;

  /// No description provided for @recordVideo.
  ///
  /// In en, this message translates to:
  /// **'Record a video'**
  String get recordVideo;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @formPdfName.
  ///
  /// In en, this message translates to:
  /// **'Adoption Form'**
  String get formPdfName;

  /// No description provided for @appBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Where are you?'**
  String get appBarTitle;

  /// No description provided for @tiutiuUser.
  ///
  /// In en, this message translates to:
  /// **'Tiu, tiu user'**
  String get tiutiuUser;

  /// No description provided for @tryingAgain.
  ///
  /// In en, this message translates to:
  /// **'Trying again'**
  String get tryingAgain;

  /// No description provided for @removeVideo.
  ///
  /// In en, this message translates to:
  /// **'Remove video'**
  String get removeVideo;

  /// No description provided for @petInfo.
  ///
  /// In en, this message translates to:
  /// **'About the animal'**
  String get petInfo;

  /// No description provided for @openGallery.
  ///
  /// In en, this message translates to:
  /// **'Open gallery'**
  String get openGallery;

  /// No description provided for @noContact.
  ///
  /// In en, this message translates to:
  /// **'No contact yet'**
  String get noContact;

  /// No description provided for @keyPixCopied.
  ///
  /// In en, this message translates to:
  /// **'Key copied!'**
  String get keyPixCopied;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code!'**
  String get invalidCode;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get google;

  /// No description provided for @backToStart.
  ///
  /// In en, this message translates to:
  /// **'Back to start'**
  String get backToStart;

  /// No description provided for @stableUnion.
  ///
  /// In en, this message translates to:
  /// **'Stable Union'**
  String get stableUnion;

  /// No description provided for @sexualAppeal.
  ///
  /// In en, this message translates to:
  /// **'Sex appeal'**
  String get sexualAppeal;

  /// No description provided for @selectBreed.
  ///
  /// In en, this message translates to:
  /// **'Select race'**
  String get selectBreed;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// No description provided for @editMyForm.
  ///
  /// In en, this message translates to:
  /// **'Edit my form'**
  String get editMyForm;

  /// No description provided for @apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get apple;

  /// No description provided for @adDeleted.
  ///
  /// In en, this message translates to:
  /// **'Post Deleted!'**
  String get adDeleted;

  /// No description provided for @userLastSeen.
  ///
  /// In en, this message translates to:
  /// **'Last seen'**
  String get userLastSeen;

  /// No description provided for @scamTry.
  ///
  /// In en, this message translates to:
  /// **'Attempted Coup'**
  String get scamTry;

  /// No description provided for @postUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update post'**
  String get postUpdate;

  /// No description provided for @petDisappeared.
  ///
  /// In en, this message translates to:
  /// **'Missing'**
  String get petDisappeared;

  /// No description provided for @profession.
  ///
  /// In en, this message translates to:
  /// **'Profession'**
  String get profession;

  /// No description provided for @partnership.
  ///
  /// In en, this message translates to:
  /// **'Partnership'**
  String get partnership;

  /// No description provided for @turnOnWifi.
  ///
  /// In en, this message translates to:
  /// **'Turn on WiFi'**
  String get turnOnWifi;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health condition'**
  String get health;

  /// No description provided for @finalizing.
  ///
  /// In en, this message translates to:
  /// **'Finishing...'**
  String get finalizing;

  /// No description provided for @fillForm.
  ///
  /// In en, this message translates to:
  /// **'Fill out form'**
  String get fillForm;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @seeDetails.
  ///
  /// In en, this message translates to:
  /// **'See\ndetails'**
  String get seeDetails;

  /// No description provided for @palliative.
  ///
  /// In en, this message translates to:
  /// **'Palliative'**
  String get palliative;

  /// No description provided for @myMessages.
  ///
  /// In en, this message translates to:
  /// **'My messages'**
  String get myMessages;

  /// No description provided for @userSince.
  ///
  /// In en, this message translates to:
  /// **'User since'**
  String get userSince;

  /// No description provided for @talkWithUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get talkWithUs;

  /// No description provided for @pasteCode.
  ///
  /// In en, this message translates to:
  /// **'Paste code'**
  String get pasteCode;

  /// No description provided for @orderedBy.
  ///
  /// In en, this message translates to:
  /// **'sorted by:'**
  String get orderedBy;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'It does not have'**
  String get none;

  /// No description provided for @muchAds.
  ///
  /// In en, this message translates to:
  /// **'Too many ads'**
  String get muchAds;

  /// No description provided for @localization.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get localization;

  /// No description provided for @emailSent.
  ///
  /// In en, this message translates to:
  /// **'Email sent!'**
  String get emailSent;

  /// No description provided for @disappeareds.
  ///
  /// In en, this message translates to:
  /// **'Missing'**
  String get disappeareds;

  /// No description provided for @detailsOf.
  ///
  /// In en, this message translates to:
  /// **'Details of'**
  String get detailsOf;

  /// No description provided for @deleteAd.
  ///
  /// In en, this message translates to:
  /// **'Delete post'**
  String get deleteAd;

  /// No description provided for @announcer.
  ///
  /// In en, this message translates to:
  /// **'Advertiser'**
  String get announcer;

  /// No description provided for @reviewButton.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewButton;

  /// No description provided for @preganant.
  ///
  /// In en, this message translates to:
  /// **'Pregnancy'**
  String get preganant;

  /// No description provided for @fullname.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullname;

  /// No description provided for @picTime.
  ///
  /// In en, this message translates to:
  /// **'Photo time!'**
  String get picTime;

  /// No description provided for @petType.
  ///
  /// In en, this message translates to:
  /// **'Type of PET'**
  String get petType;

  /// No description provided for @ourNet.
  ///
  /// In en, this message translates to:
  /// **'Our networks'**
  String get ourNet;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get myProfile;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @disappeared.
  ///
  /// In en, this message translates to:
  /// **'Missing'**
  String get disappeared;

  /// No description provided for @dennouncy.
  ///
  /// In en, this message translates to:
  /// **'Complaint'**
  String get dennouncy;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Switch off'**
  String get delete;

  /// No description provided for @clickHere.
  ///
  /// In en, this message translates to:
  /// **'Click here'**
  String get clickHere;

  /// No description provided for @addImages.
  ///
  /// In en, this message translates to:
  /// **'Add photos'**
  String get addImages;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About the app'**
  String get about;

  /// No description provided for @provideInfo.
  ///
  /// In en, this message translates to:
  /// **'Inform'**
  String get provideInfo;

  /// No description provided for @posting.
  ///
  /// In en, this message translates to:
  /// **'Posting...'**
  String get posting;

  /// No description provided for @separated.
  ///
  /// In en, this message translates to:
  /// **'Separate'**
  String get separated;

  /// No description provided for @petBreed.
  ///
  /// In en, this message translates to:
  /// **'Pet Breed'**
  String get petBreed;

  /// No description provided for @lastSeen.
  ///
  /// In en, this message translates to:
  /// **'Last seen'**
  String get lastSeen;

  /// No description provided for @goodNight.
  ///
  /// In en, this message translates to:
  /// **'Good Night'**
  String get goodNight;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get getStarted;

  /// No description provided for @finishing.
  ///
  /// In en, this message translates to:
  /// **'Finishing'**
  String get finishing;

  /// No description provided for @commingSoon.
  ///
  /// In en, this message translates to:
  /// **'Shortly'**
  String get commingSoon;

  /// No description provided for @store.
  ///
  /// In en, this message translates to:
  /// **'Tiutiu Shop'**
  String get store;

  /// No description provided for @validate.
  ///
  /// In en, this message translates to:
  /// **'Validate'**
  String get validate;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @tiutok.
  ///
  /// In en, this message translates to:
  /// **'TiuTok'**
  String get tiutok;

  /// No description provided for @petsData.
  ///
  /// In en, this message translates to:
  /// **'PET data'**
  String get petsData;

  /// No description provided for @partners.
  ///
  /// In en, this message translates to:
  /// **'Partners'**
  String get partners;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @divorced.
  ///
  /// In en, this message translates to:
  /// **'Divorced'**
  String get divorced;

  /// No description provided for @myPosts.
  ///
  /// In en, this message translates to:
  /// **'My Posts'**
  String get myPosts;

  /// No description provided for @messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get messages;

  /// No description provided for @infos.
  ///
  /// In en, this message translates to:
  /// **'information'**
  String get infos;

  /// No description provided for @foundAt.
  ///
  /// In en, this message translates to:
  /// **'found in'**
  String get foundAt;

  /// No description provided for @editAd.
  ///
  /// In en, this message translates to:
  /// **'Edit post'**
  String get editAd;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @dennounce.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get dennounce;

  /// No description provided for @copyKey.
  ///
  /// In en, this message translates to:
  /// **'Copy key'**
  String get copyKey;

  /// No description provided for @contines.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get contines;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Tiu, tiu'**
  String get appName;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get success;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @postedAt.
  ///
  /// In en, this message translates to:
  /// **'Posted'**
  String get postedAt;

  /// No description provided for @watch.
  ///
  /// In en, this message translates to:
  /// **'Attend'**
  String get watch;

  /// No description provided for @pictures.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get pictures;

  /// No description provided for @madeBy.
  ///
  /// In en, this message translates to:
  /// **'Made by'**
  String get madeBy;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @myAds.
  ///
  /// In en, this message translates to:
  /// **'My posts'**
  String get myAds;

  /// No description provided for @married.
  ///
  /// In en, this message translates to:
  /// **'Mrried'**
  String get married;

  /// No description provided for @widower.
  ///
  /// In en, this message translates to:
  /// **'Widowe'**
  String get widower;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @leave.
  ///
  /// In en, this message translates to:
  /// **'Go out'**
  String get leave;

  /// No description provided for @healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get healthy;

  /// No description provided for @failure.
  ///
  /// In en, this message translates to:
  /// **'Failure'**
  String get failure;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get warning;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @reward.
  ///
  /// In en, this message translates to:
  /// **'Reward'**
  String get reward;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @single.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get single;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @reload.
  ///
  /// In en, this message translates to:
  /// **'Reload'**
  String get reload;

  /// No description provided for @months.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get months;

  /// No description provided for @hurted.
  ///
  /// In en, this message translates to:
  /// **'Bruised'**
  String get hurted;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @doLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get doLogin;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @saveds.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get saveds;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @adopte.
  ///
  /// In en, this message translates to:
  /// **'Adopt'**
  String get adopte;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @views.
  ///
  /// In en, this message translates to:
  /// **'views'**
  String get views;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'posts'**
  String get posts;

  /// No description provided for @petName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get petName;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @local.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get local;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @bugs.
  ///
  /// In en, this message translates to:
  /// **'Bugs'**
  String get bugs;

  /// No description provided for @breed.
  ///
  /// In en, this message translates to:
  /// **'Race'**
  String get breed;

  /// No description provided for @wait.
  ///
  /// In en, this message translates to:
  /// **'Wait'**
  String get wait;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @dog.
  ///
  /// In en, this message translates to:
  /// **'Puppy'**
  String get dog;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @bird.
  ///
  /// In en, this message translates to:
  /// **'Bird'**
  String get bird;

  /// No description provided for @txt.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get txt;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @pdf.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get pdf;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get news;

  /// No description provided for @ill.
  ///
  /// In en, this message translates to:
  /// **'Sick'**
  String get ill;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get you;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @cat.
  ///
  /// In en, this message translates to:
  /// **'Cat'**
  String get cat;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @dewormed.
  ///
  /// In en, this message translates to:
  /// **'Dewormed'**
  String get dewormed;

  /// No description provided for @playful.
  ///
  /// In en, this message translates to:
  /// **'Playful'**
  String get playful;

  /// No description provided for @getsAlongWellWithOtherPets.
  ///
  /// In en, this message translates to:
  /// **'Gets Along Well With Other Pets'**
  String get getsAlongWellWithOtherPets;

  /// No description provided for @quiet.
  ///
  /// In en, this message translates to:
  /// **'Quiet'**
  String get quiet;

  /// No description provided for @dealsWellWithChildren.
  ///
  /// In en, this message translates to:
  /// **'Deals Well With Children'**
  String get dealsWellWithChildren;

  /// No description provided for @castrated.
  ///
  /// In en, this message translates to:
  /// **'Castrated'**
  String get castrated;

  /// No description provided for @dealsWellWithVisits.
  ///
  /// In en, this message translates to:
  /// **'Deals Well With Visits'**
  String get dealsWellWithVisits;

  /// No description provided for @vaccinated.
  ///
  /// In en, this message translates to:
  /// **'Vaccinated'**
  String get vaccinated;

  /// No description provided for @shy.
  ///
  /// In en, this message translates to:
  /// **'Shy'**
  String get shy;

  /// No description provided for @sly.
  ///
  /// In en, this message translates to:
  /// **'Sly'**
  String get sly;

  /// No description provided for @needy.
  ///
  /// In en, this message translates to:
  /// **'Needy'**
  String get needy;

  /// No description provided for @buddy.
  ///
  /// In en, this message translates to:
  /// **'Buddy'**
  String get buddy;

  /// No description provided for @guard.
  ///
  /// In en, this message translates to:
  /// **'Guard'**
  String get guard;

  /// No description provided for @docile.
  ///
  /// In en, this message translates to:
  /// **'Docile'**
  String get docile;

  /// No description provided for @yellow.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get yellow;

  /// No description provided for @white.
  ///
  /// In en, this message translates to:
  /// **'White'**
  String get white;

  /// No description provided for @bicolor.
  ///
  /// In en, this message translates to:
  /// **'Bicolor'**
  String get bicolor;

  /// No description provided for @whiteWithGray.
  ///
  /// In en, this message translates to:
  /// **'White with Gray'**
  String get whiteWithGray;

  /// No description provided for @whiteWithBlack.
  ///
  /// In en, this message translates to:
  /// **'White with black'**
  String get whiteWithBlack;

  /// No description provided for @caramel.
  ///
  /// In en, this message translates to:
  /// **'Caramel'**
  String get caramel;

  /// No description provided for @gray.
  ///
  /// In en, this message translates to:
  /// **'Gray'**
  String get gray;

  /// No description provided for @carey.
  ///
  /// In en, this message translates to:
  /// **'Carey'**
  String get carey;

  /// No description provided for @scale.
  ///
  /// In en, this message translates to:
  /// **'Scale'**
  String get scale;

  /// No description provided for @tabby.
  ///
  /// In en, this message translates to:
  /// **'Tabby'**
  String get tabby;

  /// No description provided for @brown.
  ///
  /// In en, this message translates to:
  /// **'Brown'**
  String get brown;

  /// No description provided for @brownWithYellow.
  ///
  /// In en, this message translates to:
  /// **'Brown with yellow'**
  String get brownWithYellow;

  /// No description provided for @brownWithWhite.
  ///
  /// In en, this message translates to:
  /// **'Brown with white'**
  String get brownWithWhite;

  /// No description provided for @brownWithGray.
  ///
  /// In en, this message translates to:
  /// **'Brown with gray'**
  String get brownWithGray;

  /// No description provided for @brownWithBlack.
  ///
  /// In en, this message translates to:
  /// **'Brown with black'**
  String get brownWithBlack;

  /// No description provided for @mustard.
  ///
  /// In en, this message translates to:
  /// **'Mustard'**
  String get mustard;

  /// No description provided for @multicolor.
  ///
  /// In en, this message translates to:
  /// **'Multicolor'**
  String get multicolor;

  /// No description provided for @orange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get orange;

  /// No description provided for @frajola.
  ///
  /// In en, this message translates to:
  /// **'frajola'**
  String get frajola;

  /// No description provided for @striped.
  ///
  /// In en, this message translates to:
  /// **'Striped'**
  String get striped;

  /// No description provided for @black.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get black;

  /// No description provided for @blackWithYellow.
  ///
  /// In en, this message translates to:
  /// **'Black with Yellow'**
  String get blackWithYellow;

  /// No description provided for @tricolor.
  ///
  /// In en, this message translates to:
  /// **'Tricolor'**
  String get tricolor;

  /// No description provided for @brindle.
  ///
  /// In en, this message translates to:
  /// **'Brindle'**
  String get brindle;

  /// No description provided for @darkBlue.
  ///
  /// In en, this message translates to:
  /// **'Dark Blue'**
  String get darkBlue;

  /// No description provided for @beige.
  ///
  /// In en, this message translates to:
  /// **'Beige'**
  String get beige;

  /// No description provided for @chocolate.
  ///
  /// In en, this message translates to:
  /// **'Chocolate'**
  String get chocolate;

  /// No description provided for @golden.
  ///
  /// In en, this message translates to:
  /// **'Golden'**
  String get golden;

  /// No description provided for @dalmatian.
  ///
  /// In en, this message translates to:
  /// **'Dalmatian'**
  String get dalmatian;

  /// No description provided for @great.
  ///
  /// In en, this message translates to:
  /// **'Great'**
  String get great;

  /// No description provided for @copperBrown.
  ///
  /// In en, this message translates to:
  /// **'Copper Brown'**
  String get copperBrown;

  /// No description provided for @red.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get red;

  /// No description provided for @fawn.
  ///
  /// In en, this message translates to:
  /// **'Fawn'**
  String get fawn;

  /// No description provided for @undefinedBreed.
  ///
  /// In en, this message translates to:
  /// **'NBD - No Breed Defined'**
  String get undefinedBreed;

  /// No description provided for @dogBreed1.
  ///
  /// In en, this message translates to:
  /// **'Akita'**
  String get dogBreed1;

  /// No description provided for @dogBreed2.
  ///
  /// In en, this message translates to:
  /// **'Basset'**
  String get dogBreed2;

  /// No description provided for @dogBreed3.
  ///
  /// In en, this message translates to:
  /// **'Beagle'**
  String get dogBreed3;

  /// No description provided for @dogBreed4.
  ///
  /// In en, this message translates to:
  /// **'Bichon'**
  String get dogBreed4;

  /// No description provided for @dogBreed5.
  ///
  /// In en, this message translates to:
  /// **'Cattle Dog'**
  String get dogBreed5;

  /// No description provided for @dogBreed6.
  ///
  /// In en, this message translates to:
  /// **'Border'**
  String get dogBreed6;

  /// No description provided for @dogBreed7.
  ///
  /// In en, this message translates to:
  /// **'Boston'**
  String get dogBreed7;

  /// No description provided for @dogBreed8.
  ///
  /// In en, this message translates to:
  /// **'Boxer'**
  String get dogBreed8;

  /// No description provided for @dogBreed9.
  ///
  /// In en, this message translates to:
  /// **'French bulldog'**
  String get dogBreed9;

  /// No description provided for @dogBreed10.
  ///
  /// In en, this message translates to:
  /// **'English bulldog'**
  String get dogBreed10;

  /// No description provided for @dogBreed11.
  ///
  /// In en, this message translates to:
  /// **'Bull'**
  String get dogBreed11;

  /// No description provided for @dogBreed12.
  ///
  /// In en, this message translates to:
  /// **'Cane'**
  String get dogBreed12;

  /// No description provided for @dogBreed13.
  ///
  /// In en, this message translates to:
  /// **'Cavalier'**
  String get dogBreed13;

  /// No description provided for @dogBreed14.
  ///
  /// In en, this message translates to:
  /// **'Chihuahua'**
  String get dogBreed14;

  /// No description provided for @dogBreed15.
  ///
  /// In en, this message translates to:
  /// **'Chow'**
  String get dogBreed15;

  /// No description provided for @dogBreed16.
  ///
  /// In en, this message translates to:
  /// **'Cocker'**
  String get dogBreed16;

  /// No description provided for @dogBreed17.
  ///
  /// In en, this message translates to:
  /// **'Dachshund'**
  String get dogBreed17;

  /// No description provided for @dogBreed18.
  ///
  /// In en, this message translates to:
  /// **'Dalmatian'**
  String get dogBreed18;

  /// No description provided for @dogBreed19.
  ///
  /// In en, this message translates to:
  /// **'Doberman'**
  String get dogBreed19;

  /// No description provided for @dogBreed20.
  ///
  /// In en, this message translates to:
  /// **'Dogo'**
  String get dogBreed20;

  /// No description provided for @dogBreed21.
  ///
  /// In en, this message translates to:
  /// **'Dog'**
  String get dogBreed21;

  /// No description provided for @dogBreed22.
  ///
  /// In en, this message translates to:
  /// **'Queue'**
  String get dogBreed22;

  /// No description provided for @dogBreed23.
  ///
  /// In en, this message translates to:
  /// **'Golden'**
  String get dogBreed23;

  /// No description provided for @dogBreed24.
  ///
  /// In en, this message translates to:
  /// **'Husky'**
  String get dogBreed24;

  /// No description provided for @dogBreed25.
  ///
  /// In en, this message translates to:
  /// **'Jack'**
  String get dogBreed25;

  /// No description provided for @dogBreed26.
  ///
  /// In en, this message translates to:
  /// **'Labrador'**
  String get dogBreed26;

  /// No description provided for @dogBreed27.
  ///
  /// In en, this message translates to:
  /// **'Lhasa'**
  String get dogBreed27;

  /// No description provided for @dogBreed28.
  ///
  /// In en, this message translates to:
  /// **'Lulu'**
  String get dogBreed28;

  /// No description provided for @dogBreed29.
  ///
  /// In en, this message translates to:
  /// **'Maltese'**
  String get dogBreed29;

  /// No description provided for @dogBreed30.
  ///
  /// In en, this message translates to:
  /// **'Mastiff'**
  String get dogBreed30;

  /// No description provided for @dogBreed31.
  ///
  /// In en, this message translates to:
  /// **'Mastiff'**
  String get dogBreed31;

  /// No description provided for @dogBreed32.
  ///
  /// In en, this message translates to:
  /// **'Shetland Shepherd'**
  String get dogBreed32;

  /// No description provided for @dogBreed33.
  ///
  /// In en, this message translates to:
  /// **'Australian Shepherd'**
  String get dogBreed33;

  /// No description provided for @dogBreed34.
  ///
  /// In en, this message translates to:
  /// **'German Shepherd'**
  String get dogBreed34;

  /// No description provided for @dogBreed35.
  ///
  /// In en, this message translates to:
  /// **'Pekingese'**
  String get dogBreed35;

  /// No description provided for @dogBreed36.
  ///
  /// In en, this message translates to:
  /// **'Pinscher'**
  String get dogBreed36;

  /// No description provided for @dogBreed37.
  ///
  /// In en, this message translates to:
  /// **'Pit'**
  String get dogBreed37;

  /// No description provided for @dogBreed38.
  ///
  /// In en, this message translates to:
  /// **'Poodle'**
  String get dogBreed38;

  /// No description provided for @dogBreed39.
  ///
  /// In en, this message translates to:
  /// **'Pug'**
  String get dogBreed39;

  /// No description provided for @dogBreed40.
  ///
  /// In en, this message translates to:
  /// **'Rottweiler'**
  String get dogBreed40;

  /// No description provided for @dogBreed41.
  ///
  /// In en, this message translates to:
  /// **'Schnauzer'**
  String get dogBreed41;

  /// No description provided for @dogBreed42.
  ///
  /// In en, this message translates to:
  /// **'Shar'**
  String get dogBreed42;

  /// No description provided for @dogBreed43.
  ///
  /// In en, this message translates to:
  /// **'Shiba'**
  String get dogBreed43;

  /// No description provided for @dogBreed44.
  ///
  /// In en, this message translates to:
  /// **'Shih'**
  String get dogBreed44;

  /// No description provided for @dogBreed45.
  ///
  /// In en, this message translates to:
  /// **'Shih Tzu'**
  String get dogBreed45;

  /// No description provided for @dogBreed46.
  ///
  /// In en, this message translates to:
  /// **'Staffordshire'**
  String get dogBreed46;

  /// No description provided for @dogBreed47.
  ///
  /// In en, this message translates to:
  /// **'Pooch'**
  String get dogBreed47;

  /// No description provided for @dogBreed48.
  ///
  /// In en, this message translates to:
  /// **'Weimaraner'**
  String get dogBreed48;

  /// No description provided for @dogBreed49.
  ///
  /// In en, this message translates to:
  /// **'Yorkshire'**
  String get dogBreed49;

  /// No description provided for @catBread1.
  ///
  /// In en, this message translates to:
  /// **'Abyssinian'**
  String get catBread1;

  /// No description provided for @catBread2.
  ///
  /// In en, this message translates to:
  /// **'Angora'**
  String get catBread2;

  /// No description provided for @catBread3.
  ///
  /// In en, this message translates to:
  /// **'Ashera'**
  String get catBread3;

  /// No description provided for @catBread4.
  ///
  /// In en, this message translates to:
  /// **'Balinese'**
  String get catBread4;

  /// No description provided for @catBread5.
  ///
  /// In en, this message translates to:
  /// **'Bengal'**
  String get catBread5;

  /// No description provided for @catBread6.
  ///
  /// In en, this message translates to:
  /// **'American bobtail'**
  String get catBread6;

  /// No description provided for @catBread7.
  ///
  /// In en, this message translates to:
  /// **'Japanese Bobtail'**
  String get catBread7;

  /// No description provided for @catBread8.
  ///
  /// In en, this message translates to:
  /// **'Bombay'**
  String get catBread8;

  /// No description provided for @catBread9.
  ///
  /// In en, this message translates to:
  /// **'Burmese'**
  String get catBread9;

  /// No description provided for @catBread10.
  ///
  /// In en, this message translates to:
  /// **'Red Burmese'**
  String get catBread10;

  /// No description provided for @catBread11.
  ///
  /// In en, this message translates to:
  /// **'Chartreux'**
  String get catBread11;

  /// No description provided for @catBread12.
  ///
  /// In en, this message translates to:
  /// **'Shorthair Colorpoint'**
  String get catBread12;

  /// No description provided for @catBread13.
  ///
  /// In en, this message translates to:
  /// **'Cornish Rex.'**
  String get catBread13;

  /// No description provided for @catBread14.
  ///
  /// In en, this message translates to:
  /// **'American Curl (no info)'**
  String get catBread14;

  /// No description provided for @catBread15.
  ///
  /// In en, this message translates to:
  /// **'Devon Rex'**
  String get catBread15;

  /// No description provided for @catBread16.
  ///
  /// In en, this message translates to:
  /// **'Himalayan'**
  String get catBread16;

  /// No description provided for @catBread17.
  ///
  /// In en, this message translates to:
  /// **'Ocelot'**
  String get catBread17;

  /// No description provided for @catBread18.
  ///
  /// In en, this message translates to:
  /// **'Javanese'**
  String get catBread18;

  /// No description provided for @catBread19.
  ///
  /// In en, this message translates to:
  /// **'Korat'**
  String get catBread19;

  /// No description provided for @catBread20.
  ///
  /// In en, this message translates to:
  /// **'LaPerm'**
  String get catBread20;

  /// No description provided for @catBread21.
  ///
  /// In en, this message translates to:
  /// **'Maine Coon'**
  String get catBread21;

  /// No description provided for @catBread22.
  ///
  /// In en, this message translates to:
  /// **'Manx'**
  String get catBread22;

  /// No description provided for @catBread23.
  ///
  /// In en, this message translates to:
  /// **'Cymric'**
  String get catBread23;

  /// No description provided for @catBread24.
  ///
  /// In en, this message translates to:
  /// **'Egyptian Mau'**
  String get catBread24;

  /// No description provided for @catBread25.
  ///
  /// In en, this message translates to:
  /// **'Australian Mist'**
  String get catBread25;

  /// No description provided for @catBread26.
  ///
  /// In en, this message translates to:
  /// **'Munchkin'**
  String get catBread26;

  /// No description provided for @catBread27.
  ///
  /// In en, this message translates to:
  /// **'Forest Norwegian'**
  String get catBread27;

  /// No description provided for @catBread28.
  ///
  /// In en, this message translates to:
  /// **'American Shorthair'**
  String get catBread28;

  /// No description provided for @catBread29.
  ///
  /// In en, this message translates to:
  /// **'Brazilian short fur'**
  String get catBread29;

  /// No description provided for @catBread30.
  ///
  /// In en, this message translates to:
  /// **'European Shorthair'**
  String get catBread30;

  /// No description provided for @catBread31.
  ///
  /// In en, this message translates to:
  /// **'English short fur'**
  String get catBread31;

  /// No description provided for @catBread32.
  ///
  /// In en, this message translates to:
  /// **'Persian'**
  String get catBread32;

  /// No description provided for @catBread33.
  ///
  /// In en, this message translates to:
  /// **'Pixie-bob'**
  String get catBread33;

  /// No description provided for @catBread34.
  ///
  /// In en, this message translates to:
  /// **'Ragdoll'**
  String get catBread34;

  /// No description provided for @catBread35.
  ///
  /// In en, this message translates to:
  /// **'Ocicat'**
  String get catBread35;

  /// No description provided for @catBread36.
  ///
  /// In en, this message translates to:
  /// **'Russian Blue'**
  String get catBread36;

  /// No description provided for @catBread37.
  ///
  /// In en, this message translates to:
  /// **'Sacred of Burma'**
  String get catBread37;

  /// No description provided for @catBread38.
  ///
  /// In en, this message translates to:
  /// **'Savannah'**
  String get catBread38;

  /// No description provided for @catBread39.
  ///
  /// In en, this message translates to:
  /// **'Scottish Fold'**
  String get catBread39;

  /// No description provided for @catBread40.
  ///
  /// In en, this message translates to:
  /// **'Selkirk Rex'**
  String get catBread40;

  /// No description provided for @catBread41.
  ///
  /// In en, this message translates to:
  /// **'Siamese'**
  String get catBread41;

  /// No description provided for @catBread42.
  ///
  /// In en, this message translates to:
  /// **'Siberian'**
  String get catBread42;

  /// No description provided for @catBread43.
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get catBread43;

  /// No description provided for @catBread44.
  ///
  /// In en, this message translates to:
  /// **'Somali'**
  String get catBread44;

  /// No description provided for @catBread45.
  ///
  /// In en, this message translates to:
  /// **'Sphynx'**
  String get catBread45;

  /// No description provided for @catBread46.
  ///
  /// In en, this message translates to:
  /// **'Thai'**
  String get catBread46;

  /// No description provided for @catBread47.
  ///
  /// In en, this message translates to:
  /// **'Tonkinese'**
  String get catBread47;

  /// No description provided for @catBread48.
  ///
  /// In en, this message translates to:
  /// **'Toyger'**
  String get catBread48;

  /// No description provided for @catBread49.
  ///
  /// In en, this message translates to:
  /// **'Usuri'**
  String get catBread49;

  /// No description provided for @petSizeMini.
  ///
  /// In en, this message translates to:
  /// **'Mini'**
  String get petSizeMini;

  /// No description provided for @petSizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get petSizeSmall;

  /// No description provided for @petSizeMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get petSizeMedium;

  /// No description provided for @petSizeBig.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get petSizeBig;

  /// No description provided for @birdBreed1.
  ///
  /// In en, this message translates to:
  /// **'Bee-eater'**
  String get birdBreed1;

  /// No description provided for @birdBreed2.
  ///
  /// In en, this message translates to:
  /// **'Lovebird'**
  String get birdBreed2;

  /// No description provided for @birdBreed3.
  ///
  /// In en, this message translates to:
  /// **'Agapornis canus'**
  String get birdBreed3;

  /// No description provided for @birdBreed4.
  ///
  /// In en, this message translates to:
  /// **'Agapornis fischeri'**
  String get birdBreed4;

  /// No description provided for @birdBreed5.
  ///
  /// In en, this message translates to:
  /// **'agapornis liliane'**
  String get birdBreed5;

  /// No description provided for @birdBreed6.
  ///
  /// In en, this message translates to:
  /// **'agapornis nigrinenis'**
  String get birdBreed6;

  /// No description provided for @birdBreed7.
  ///
  /// In en, this message translates to:
  /// **'Agapornis personatus'**
  String get birdBreed7;

  /// No description provided for @birdBreed8.
  ///
  /// In en, this message translates to:
  /// **'Agapornis roseicollis'**
  String get birdBreed8;

  /// No description provided for @birdBreed9.
  ///
  /// In en, this message translates to:
  /// **'Agapornis swinderniana'**
  String get birdBreed9;

  /// No description provided for @birdBreed10.
  ///
  /// In en, this message translates to:
  /// **'agapornis taranta'**
  String get birdBreed10;

  /// No description provided for @birdBreed11.
  ///
  /// In en, this message translates to:
  /// **'Cat Soul'**
  String get birdBreed11;

  /// No description provided for @birdBreed12.
  ///
  /// In en, this message translates to:
  /// **'Senegal amaranth'**
  String get birdBreed12;

  /// No description provided for @birdBreed13.
  ///
  /// In en, this message translates to:
  /// **'Anaca'**
  String get birdBreed13;

  /// No description provided for @birdBreed14.
  ///
  /// In en, this message translates to:
  /// **'Frantzius\' Aracari'**
  String get birdBreed14;

  /// No description provided for @birdBreed15.
  ///
  /// In en, this message translates to:
  /// **'Araponga'**
  String get birdBreed15;

  /// No description provided for @birdBreed16.
  ///
  /// In en, this message translates to:
  /// **'Lear\'s Macaw'**
  String get birdBreed16;

  /// No description provided for @birdBreed17.
  ///
  /// In en, this message translates to:
  /// **'Great Hyacinth Macaw'**
  String get birdBreed17;

  /// No description provided for @birdBreed18.
  ///
  /// In en, this message translates to:
  /// **'Little Hyacinth Macaw'**
  String get birdBreed18;

  /// No description provided for @birdBreed19.
  ///
  /// In en, this message translates to:
  /// **'Araracanga'**
  String get birdBreed19;

  /// No description provided for @birdBreed20.
  ///
  /// In en, this message translates to:
  /// **'Caninde Macaw'**
  String get birdBreed20;

  /// No description provided for @birdBreed21.
  ///
  /// In en, this message translates to:
  /// **'Yellow-bellied Macaw'**
  String get birdBreed21;

  /// No description provided for @birdBreed22.
  ///
  /// In en, this message translates to:
  /// **'Military Macaw'**
  String get birdBreed22;

  /// No description provided for @birdBreed23.
  ///
  /// In en, this message translates to:
  /// **'Red Macaw'**
  String get birdBreed23;

  /// No description provided for @birdBreed24.
  ///
  /// In en, this message translates to:
  /// **'Sky Macaw'**
  String get birdBreed24;

  /// No description provided for @birdBreed25.
  ///
  /// In en, this message translates to:
  /// **'Red-fronted Macaw'**
  String get birdBreed25;

  /// No description provided for @birdBreed26.
  ///
  /// In en, this message translates to:
  /// **'Bavete'**
  String get birdBreed26;

  /// No description provided for @birdBreed27.
  ///
  /// In en, this message translates to:
  /// **'Plum Head'**
  String get birdBreed27;

  /// No description provided for @birdBreed28.
  ///
  /// In en, this message translates to:
  /// **'Black-bellied Cable'**
  String get birdBreed28;

  /// No description provided for @birdBreed29.
  ///
  /// In en, this message translates to:
  /// **'Dark Whisker'**
  String get birdBreed29;

  /// No description provided for @birdBreed30.
  ///
  /// In en, this message translates to:
  /// **'Cockatoo'**
  String get birdBreed30;

  /// No description provided for @birdBreed31.
  ///
  /// In en, this message translates to:
  /// **'caulker'**
  String get birdBreed31;

  /// No description provided for @birdBreed32.
  ///
  /// In en, this message translates to:
  /// **'Canary'**
  String get birdBreed32;

  /// No description provided for @birdBreed33.
  ///
  /// In en, this message translates to:
  /// **'Portuguese Harlequin Canary'**
  String get birdBreed33;

  /// No description provided for @birdBreed34.
  ///
  /// In en, this message translates to:
  /// **'Color Canary'**
  String get birdBreed34;

  /// No description provided for @birdBreed35.
  ///
  /// In en, this message translates to:
  /// **'Canario de Porte'**
  String get birdBreed35;

  /// No description provided for @birdBreed36.
  ///
  /// In en, this message translates to:
  /// **'Karakite'**
  String get birdBreed36;

  /// No description provided for @birdBreed37.
  ///
  /// In en, this message translates to:
  /// **'Amazon cardinal'**
  String get birdBreed37;

  /// No description provided for @birdBreed38.
  ///
  /// In en, this message translates to:
  /// **'goias cardinal'**
  String get birdBreed38;

  /// No description provided for @birdBreed39.
  ///
  /// In en, this message translates to:
  /// **'red-crested cardinal'**
  String get birdBreed39;

  /// No description provided for @birdBreed40.
  ///
  /// In en, this message translates to:
  /// **'Northeast Cardinal'**
  String get birdBreed40;

  /// No description provided for @birdBreed41.
  ///
  /// In en, this message translates to:
  /// **'Wetland Cardinal'**
  String get birdBreed41;

  /// No description provided for @birdBreed42.
  ///
  /// In en, this message translates to:
  /// **'cockatiel or cockatiel'**
  String get birdBreed42;

  /// No description provided for @birdBreed43.
  ///
  /// In en, this message translates to:
  /// **'Caturrita'**
  String get birdBreed43;

  /// No description provided for @birdBreed44.
  ///
  /// In en, this message translates to:
  /// **'decoy'**
  String get birdBreed44;

  /// No description provided for @birdBreed45.
  ///
  /// In en, this message translates to:
  /// **'Quail'**
  String get birdBreed45;

  /// No description provided for @birdBreed46.
  ///
  /// In en, this message translates to:
  /// **'Keeper'**
  String get birdBreed46;

  /// No description provided for @birdBreed47.
  ///
  /// In en, this message translates to:
  /// **'Common Redpoll'**
  String get birdBreed47;

  /// No description provided for @birdBreed48.
  ///
  /// In en, this message translates to:
  /// **'Cordonbleu'**
  String get birdBreed48;

  /// No description provided for @birdBreed49.
  ///
  /// In en, this message translates to:
  /// **'Curio'**
  String get birdBreed49;

  /// No description provided for @birdBreed50.
  ///
  /// In en, this message translates to:
  /// **'Domino'**
  String get birdBreed50;

  /// No description provided for @birdBreed51.
  ///
  /// In en, this message translates to:
  /// **'Eclectus Roratus Polychloros'**
  String get birdBreed51;

  /// No description provided for @birdBreed52.
  ///
  /// In en, this message translates to:
  /// **'Emma'**
  String get birdBreed52;

  /// No description provided for @birdBreed53.
  ///
  /// In en, this message translates to:
  /// **'Explendid'**
  String get birdBreed53;

  /// No description provided for @birdBreed54.
  ///
  /// In en, this message translates to:
  /// **'Forpus Coelestis'**
  String get birdBreed54;

  /// No description provided for @birdBreed55.
  ///
  /// In en, this message translates to:
  /// **'Galah'**
  String get birdBreed55;

  /// No description provided for @birdBreed56.
  ///
  /// In en, this message translates to:
  /// **'European Heron'**
  String get birdBreed56;

  /// No description provided for @birdBreed57.
  ///
  /// In en, this message translates to:
  /// **'Garrincha'**
  String get birdBreed57;

  /// No description provided for @birdBreed58.
  ///
  /// In en, this message translates to:
  /// **'Tingle-winged Hawk'**
  String get birdBreed58;

  /// No description provided for @birdBreed59.
  ///
  /// In en, this message translates to:
  /// **'Blue Hawk'**
  String get birdBreed59;

  /// No description provided for @birdBreed60.
  ///
  /// In en, this message translates to:
  /// **'Gaviao-belo'**
  String get birdBreed60;

  /// No description provided for @birdBreed61.
  ///
  /// In en, this message translates to:
  /// **'Gaviao-Breed'**
  String get birdBreed61;

  /// No description provided for @birdBreed62.
  ///
  /// In en, this message translates to:
  /// **'Grayhawk'**
  String get birdBreed62;

  /// No description provided for @birdBreed63.
  ///
  /// In en, this message translates to:
  /// **'Gaviao-pega-macaco'**
  String get birdBreed63;

  /// No description provided for @birdBreed64.
  ///
  /// In en, this message translates to:
  /// **'Gaviao-pomba'**
  String get birdBreed64;

  /// No description provided for @birdBreed65.
  ///
  /// In en, this message translates to:
  /// **'Grenatine'**
  String get birdBreed65;

  /// No description provided for @birdBreed66.
  ///
  /// In en, this message translates to:
  /// **'Guaruba'**
  String get birdBreed66;

  /// No description provided for @birdBreed67.
  ///
  /// In en, this message translates to:
  /// **'Harpy'**
  String get birdBreed67;

  /// No description provided for @birdBreed68.
  ///
  /// In en, this message translates to:
  /// **'Undefined'**
  String get birdBreed68;

  /// No description provided for @birdBreed69.
  ///
  /// In en, this message translates to:
  /// **'Inhambu-chicken'**
  String get birdBreed69;

  /// No description provided for @birdBreed70.
  ///
  /// In en, this message translates to:
  /// **'Coquinho Conure'**
  String get birdBreed70;

  /// No description provided for @birdBreed71.
  ///
  /// In en, this message translates to:
  /// **'Ja&oacute;'**
  String get birdBreed71;

  /// No description provided for @birdBreed72.
  ///
  /// In en, this message translates to:
  /// **'João de Barro'**
  String get birdBreed72;

  /// No description provided for @birdBreed73.
  ///
  /// In en, this message translates to:
  /// **'Kakarikes'**
  String get birdBreed73;

  /// No description provided for @birdBreed74.
  ///
  /// In en, this message translates to:
  /// **'Lorys'**
  String get birdBreed74;

  /// No description provided for @birdBreed75.
  ///
  /// In en, this message translates to:
  /// **'Lugano'**
  String get birdBreed75;

  /// No description provided for @birdBreed76.
  ///
  /// In en, this message translates to:
  /// **'Macuco'**
  String get birdBreed76;

  /// No description provided for @birdBreed77.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get birdBreed77;

  /// No description provided for @birdBreed78.
  ///
  /// In en, this message translates to:
  /// **'mandarin'**
  String get birdBreed78;

  /// No description provided for @birdBreed79.
  ///
  /// In en, this message translates to:
  /// **'Moustache'**
  String get birdBreed79;

  /// No description provided for @birdBreed80.
  ///
  /// In en, this message translates to:
  /// **'Bolivian Bold'**
  String get birdBreed80;

  /// No description provided for @birdBreed81.
  ///
  /// In en, this message translates to:
  /// **'Neophemas'**
  String get birdBreed81;

  /// No description provided for @birdBreed82.
  ///
  /// In en, this message translates to:
  /// **'Green Parrot'**
  String get birdBreed82;

  /// No description provided for @birdBreed83.
  ///
  /// In en, this message translates to:
  /// **'Chaua Parrot'**
  String get birdBreed83;

  /// No description provided for @birdBreed84.
  ///
  /// In en, this message translates to:
  /// **'Grey Parrot'**
  String get birdBreed84;

  /// No description provided for @birdBreed85.
  ///
  /// In en, this message translates to:
  /// **'Patagonian Parrot'**
  String get birdBreed85;

  /// No description provided for @birdBreed86.
  ///
  /// In en, this message translates to:
  /// **'Sawbird Parrot'**
  String get birdBreed86;

  /// No description provided for @birdBreed87.
  ///
  /// In en, this message translates to:
  /// **'Purple-faced Parrot'**
  String get birdBreed87;

  /// No description provided for @birdBreed88.
  ///
  /// In en, this message translates to:
  /// **'Hispaniola Parrot'**
  String get birdBreed88;

  /// No description provided for @birdBreed89.
  ///
  /// In en, this message translates to:
  /// **'Purple-breasted Parrot'**
  String get birdBreed89;

  /// No description provided for @birdBreed90.
  ///
  /// In en, this message translates to:
  /// **'Puerto Rico Parrot'**
  String get birdBreed90;

  /// No description provided for @birdBreed91.
  ///
  /// In en, this message translates to:
  /// **'Saint Lucia Parrot'**
  String get birdBreed91;

  /// No description provided for @birdBreed92.
  ///
  /// In en, this message translates to:
  /// **'São Vicente Parrot'**
  String get birdBreed92;

  /// No description provided for @birdBreed93.
  ///
  /// In en, this message translates to:
  /// **'Green Parrot'**
  String get birdBreed93;

  /// No description provided for @birdBreed94.
  ///
  /// In en, this message translates to:
  /// **'mangrove parrot'**
  String get birdBreed94;

  /// No description provided for @birdBreed95.
  ///
  /// In en, this message translates to:
  /// **'Scarlet Parrot'**
  String get birdBreed95;

  /// No description provided for @birdBreed96.
  ///
  /// In en, this message translates to:
  /// **'Green Parrot'**
  String get birdBreed96;

  /// No description provided for @birdBreed97.
  ///
  /// In en, this message translates to:
  /// **'Sweet Parrot'**
  String get birdBreed97;

  /// No description provided for @birdBreed98.
  ///
  /// In en, this message translates to:
  /// **'True Parrot'**
  String get birdBreed98;

  /// No description provided for @birdBreed99.
  ///
  /// In en, this message translates to:
  /// **'Partridge'**
  String get birdBreed99;

  /// No description provided for @birdBreed100.
  ///
  /// In en, this message translates to:
  /// **'Australian Parakeet'**
  String get birdBreed100;

  /// No description provided for @birdBreed101.
  ///
  /// In en, this message translates to:
  /// **'Collared Parakeet'**
  String get birdBreed101;

  /// No description provided for @birdBreed102.
  ///
  /// In en, this message translates to:
  /// **'King Parakeet (Aratinga Aurea)'**
  String get birdBreed102;

  /// No description provided for @birdBreed103.
  ///
  /// In en, this message translates to:
  /// **'Ivory-billed Woodpecker'**
  String get birdBreed103;

  /// No description provided for @birdBreed104.
  ///
  /// In en, this message translates to:
  /// **'Woodpecker'**
  String get birdBreed104;

  /// No description provided for @birdBreed105.
  ///
  /// In en, this message translates to:
  /// **'White-banded Woodpecker'**
  String get birdBreed105;

  /// No description provided for @birdBreed106.
  ///
  /// In en, this message translates to:
  /// **'Red-bellied Woodpecker'**
  String get birdBreed106;

  /// No description provided for @birdBreed107.
  ///
  /// In en, this message translates to:
  /// **'Yellow-headed Woodpecker'**
  String get birdBreed107;

  /// No description provided for @birdBreed108.
  ///
  /// In en, this message translates to:
  /// **'Red-crested Woodpecker'**
  String get birdBreed108;

  /// No description provided for @birdBreed109.
  ///
  /// In en, this message translates to:
  /// **'White Woodpecker'**
  String get birdBreed109;

  /// No description provided for @birdBreed110.
  ///
  /// In en, this message translates to:
  /// **'Great Spotted Woodpecker'**
  String get birdBreed110;

  /// No description provided for @birdBreed111.
  ///
  /// In en, this message translates to:
  /// **'Robin'**
  String get birdBreed111;

  /// No description provided for @birdBreed112.
  ///
  /// In en, this message translates to:
  /// **'Pintassilgo Baianinho'**
  String get birdBreed112;

  /// No description provided for @birdBreed113.
  ///
  /// In en, this message translates to:
  /// **'Common Goldfinch'**
  String get birdBreed113;

  /// No description provided for @birdBreed114.
  ///
  /// In en, this message translates to:
  /// **'Black-headed Goldfinch'**
  String get birdBreed114;

  /// No description provided for @birdBreed115.
  ///
  /// In en, this message translates to:
  /// **'Black-capped Goldfinch'**
  String get birdBreed115;

  /// No description provided for @birdBreed116.
  ///
  /// In en, this message translates to:
  /// **'Ecuador Goldfinch'**
  String get birdBreed116;

  /// No description provided for @birdBreed117.
  ///
  /// In en, this message translates to:
  /// **'Northeast Goldfinch'**
  String get birdBreed117;

  /// No description provided for @birdBreed118.
  ///
  /// In en, this message translates to:
  /// **'Andean Goldfinch'**
  String get birdBreed118;

  /// No description provided for @birdBreed119.
  ///
  /// In en, this message translates to:
  /// **'Portuguese Goldfinch'**
  String get birdBreed119;

  /// No description provided for @birdBreed120.
  ///
  /// In en, this message translates to:
  /// **'Common Pigeon'**
  String get birdBreed120;

  /// No description provided for @birdBreed121.
  ///
  /// In en, this message translates to:
  /// **'Port Lincoln'**
  String get birdBreed121;

  /// No description provided for @birdBreed122.
  ///
  /// In en, this message translates to:
  /// **'Red Rumpet '**
  String get birdBreed122;

  /// No description provided for @birdBreed123.
  ///
  /// In en, this message translates to:
  /// **'Ring neck'**
  String get birdBreed123;

  /// No description provided for @birdBreed124.
  ///
  /// In en, this message translates to:
  /// **'Rosela adscitus'**
  String get birdBreed124;

  /// No description provided for @birdBreed125.
  ///
  /// In en, this message translates to:
  /// **'Rosella eximius'**
  String get birdBreed125;

  /// No description provided for @birdBreed126.
  ///
  /// In en, this message translates to:
  /// **'Rosella Pennant'**
  String get birdBreed126;

  /// No description provided for @birdBreed127.
  ///
  /// In en, this message translates to:
  /// **'Tarim'**
  String get birdBreed127;

  /// No description provided for @birdBreed128.
  ///
  /// In en, this message translates to:
  /// **'tueeee'**
  String get birdBreed128;

  /// No description provided for @birdBreed129.
  ///
  /// In en, this message translates to:
  /// **'King Vulture'**
  String get birdBreed129;

  /// No description provided for @birdBreed130.
  ///
  /// In en, this message translates to:
  /// **'Common Greenfinch'**
  String get birdBreed130;

  /// No description provided for @birdBreed131.
  ///
  /// In en, this message translates to:
  /// **'Black-headed Greenfinch'**
  String get birdBreed131;

  /// No description provided for @birdBreed132.
  ///
  /// In en, this message translates to:
  /// **'Eastern Greenfin'**
  String get birdBreed132;

  /// No description provided for @birdBreed133.
  ///
  /// In en, this message translates to:
  /// **'Warsangli Linnet'**
  String get birdBreed133;

  /// No description provided for @birdBreed134.
  ///
  /// In en, this message translates to:
  /// **'Yemen Linne'**
  String get birdBreed134;

  /// No description provided for @pumpkin.
  ///
  /// In en, this message translates to:
  /// **'Pumpkin'**
  String get pumpkin;

  /// No description provided for @saffron.
  ///
  /// In en, this message translates to:
  /// **'Saffron'**
  String get saffron;

  /// No description provided for @amber.
  ///
  /// In en, this message translates to:
  /// **'Amber'**
  String get amber;

  /// No description provided for @plum.
  ///
  /// In en, this message translates to:
  /// **'Plum'**
  String get plum;

  /// No description provided for @almond.
  ///
  /// In en, this message translates to:
  /// **'Almond'**
  String get almond;

  /// No description provided for @amethyst.
  ///
  /// In en, this message translates to:
  /// **'Amethyst'**
  String get amethyst;

  /// No description provided for @indigo.
  ///
  /// In en, this message translates to:
  /// **'indigo'**
  String get indigo;

  /// No description provided for @blue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get blue;

  /// No description provided for @bordeaux.
  ///
  /// In en, this message translates to:
  /// **'bordeaux'**
  String get bordeaux;

  /// No description provided for @bronze.
  ///
  /// In en, this message translates to:
  /// **'Bronze'**
  String get bronze;

  /// No description provided for @khaki.
  ///
  /// In en, this message translates to:
  /// **'khaki'**
  String get khaki;

  /// No description provided for @crimson.
  ///
  /// In en, this message translates to:
  /// **'Crimson'**
  String get crimson;

  /// No description provided for @carmine.
  ///
  /// In en, this message translates to:
  /// **'Carmine'**
  String get carmine;

  /// No description provided for @cherry.
  ///
  /// In en, this message translates to:
  /// **'cherry'**
  String get cherry;

  /// No description provided for @cyan.
  ///
  /// In en, this message translates to:
  /// **'Cyan'**
  String get cyan;

  /// No description provided for @copper.
  ///
  /// In en, this message translates to:
  /// **'Copper'**
  String get copper;

  /// No description provided for @coral.
  ///
  /// In en, this message translates to:
  /// **'Coral'**
  String get coral;

  /// No description provided for @cream.
  ///
  /// In en, this message translates to:
  /// **'Cream'**
  String get cream;

  /// No description provided for @damascus.
  ///
  /// In en, this message translates to:
  /// **'apricot'**
  String get damascus;

  /// No description provided for @scarlet.
  ///
  /// In en, this message translates to:
  /// **'Scarlet'**
  String get scarlet;

  /// No description provided for @emerald.
  ///
  /// In en, this message translates to:
  /// **'Emerald'**
  String get emerald;

  /// No description provided for @rust.
  ///
  /// In en, this message translates to:
  /// **'Rust'**
  String get rust;

  /// No description provided for @fuchsia.
  ///
  /// In en, this message translates to:
  /// **'Fuchsia'**
  String get fuchsia;

  /// No description provided for @ice.
  ///
  /// In en, this message translates to:
  /// **'Ice'**
  String get ice;

  /// No description provided for @grena.
  ///
  /// In en, this message translates to:
  /// **'grena'**
  String get grena;

  /// No description provided for @grey.
  ///
  /// In en, this message translates to:
  /// **'Grey'**
  String get grey;

  /// No description provided for @jade.
  ///
  /// In en, this message translates to:
  /// **'jade'**
  String get jade;

  /// No description provided for @jambo.
  ///
  /// In en, this message translates to:
  /// **'Jambo'**
  String get jambo;

  /// No description provided for @lavender.
  ///
  /// In en, this message translates to:
  /// **'Lavender'**
  String get lavender;

  /// No description provided for @lilac.
  ///
  /// In en, this message translates to:
  /// **'Lilac'**
  String get lilac;

  /// No description provided for @lemon.
  ///
  /// In en, this message translates to:
  /// **'Lemon'**
  String get lemon;

  /// No description provided for @straight.
  ///
  /// In en, this message translates to:
  /// **'Straight'**
  String get straight;

  /// No description provided for @blonde.
  ///
  /// In en, this message translates to:
  /// **'Blonde'**
  String get blonde;

  /// No description provided for @littleWolf.
  ///
  /// In en, this message translates to:
  /// **'Little Wolf'**
  String get littleWolf;

  /// No description provided for @magenta.
  ///
  /// In en, this message translates to:
  /// **'Magenta'**
  String get magenta;

  /// No description provided for @mauve.
  ///
  /// In en, this message translates to:
  /// **'mauve'**
  String get mauve;

  /// No description provided for @ivory.
  ///
  /// In en, this message translates to:
  /// **'ivory'**
  String get ivory;

  /// No description provided for @ocher.
  ///
  /// In en, this message translates to:
  /// **'ochre'**
  String get ocher;

  /// No description provided for @olive.
  ///
  /// In en, this message translates to:
  /// **'Olive'**
  String get olive;

  /// No description provided for @cougar.
  ///
  /// In en, this message translates to:
  /// **'cougar'**
  String get cougar;

  /// No description provided for @peach.
  ///
  /// In en, this message translates to:
  /// **'Peach'**
  String get peach;

  /// No description provided for @silver.
  ///
  /// In en, this message translates to:
  /// **'Silver'**
  String get silver;

  /// No description provided for @blackWithGrey.
  ///
  /// In en, this message translates to:
  /// **'Black with gray'**
  String get blackWithGrey;

  /// No description provided for @purple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get purple;

  /// No description provided for @pink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get pink;

  /// No description provided for @salmon.
  ///
  /// In en, this message translates to:
  /// **'Salmon'**
  String get salmon;

  /// No description provided for @sepia.
  ///
  /// In en, this message translates to:
  /// **'Sepia'**
  String get sepia;

  /// No description provided for @siamese.
  ///
  /// In en, this message translates to:
  /// **'Siamese'**
  String get siamese;

  /// No description provided for @sialata.
  ///
  /// In en, this message translates to:
  /// **'sialata'**
  String get sialata;

  /// No description provided for @terracotta.
  ///
  /// In en, this message translates to:
  /// **'Terracotta'**
  String get terracotta;

  /// No description provided for @brick.
  ///
  /// In en, this message translates to:
  /// **'Brick'**
  String get brick;

  /// No description provided for @turquoise.
  ///
  /// In en, this message translates to:
  /// **'Turquoise'**
  String get turquoise;

  /// No description provided for @grape.
  ///
  /// In en, this message translates to:
  /// **'Grape'**
  String get grape;

  /// No description provided for @green.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get green;

  /// No description provided for @wine.
  ///
  /// In en, this message translates to:
  /// **'Wine'**
  String get wine;

  /// No description provided for @violet.
  ///
  /// In en, this message translates to:
  /// **'Violet'**
  String get violet;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @appNeedToKnowWhereYouAreToShowNearestPets.
  ///
  /// In en, this message translates to:
  /// **'Tiutiu needs to know where you are to show you the closest PETs to you right now. You can even go in and see the PETs, but if you\'re going to make a publication, you\'ll need to inform your location!'**
  String get appNeedToKnowWhereYouAreToShowNearestPets;

  /// No description provided for @joinUs.
  ///
  /// In en, this message translates to:
  /// **'Join our network of supporting companies and help make a difference in the lives of animals. Have your business here 👇.'**
  String get joinUs;

  /// No description provided for @appNeedToKnowWhereYouAre.
  ///
  /// In en, this message translates to:
  /// **'Tiutiu needs to know where the PET you are going to post is.'**
  String get appNeedToKnowWhereYouAre;

  /// No description provided for @areExperiencedInThisPet.
  ///
  /// In en, this message translates to:
  /// **'Do you have experience with this type of pet?'**
  String get areExperiencedInThisPet;

  /// No description provided for @whyYouWantThisPet.
  ///
  /// In en, this message translates to:
  /// **'Why do you want to adopt this particular pet?'**
  String get whyYouWantThisPet;

  /// No description provided for @whatKindPetYouWant.
  ///
  /// In en, this message translates to:
  /// **'What kind of pet are you interested in?'**
  String get whatKindPetYouWant;

  /// No description provided for @toReceiveAnotherCode.
  ///
  /// In en, this message translates to:
  /// **'to receive another code'**
  String get toReceiveAnotherCode;

  /// No description provided for @noPostNow.
  ///
  /// In en, this message translates to:
  /// **'I don\'t want to post now'**
  String get noPostNow;

  /// No description provided for @onlySeePets.
  ///
  /// In en, this message translates to:
  /// **'Only See Pets'**
  String get onlySeePets;

  /// No description provided for @updating.
  ///
  /// In en, this message translates to:
  /// **'Updating'**
  String get updating;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving'**
  String get saving;

  /// No description provided for @form.
  ///
  /// In en, this message translates to:
  /// **'form'**
  String get form;

  /// No description provided for @step.
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get step;

  /// No description provided for @andThe.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get andThe;

  /// No description provided for @aboutText.
  ///
  /// In en, this message translates to:
  /// **'The Tiu, tiu application was created with the aim of facilitating the adoption of pets. We believe that all animals deserve a loving and caring home, and we want to help connect people who want to adopt with those who want to donate their animals./n/n We are not an NGO, but we care about the animal cause and want to contribute in some way to reduce the number of abandoned animals on the streets. Our team is dedicated to ensuring that all transactions are done transparently and legally, to ensure the safety and well-being of the animals involved.'**
  String get aboutText;

  /// No description provided for @termsAndConditionsText.
  ///
  /// In en, this message translates to:
  /// **'Platform Usage: By downloading and using the Tiu, tiu app, you agree to follow all applicable laws and regulations. You also agree not to use the application in an illegal, harmful or offensive way./n/nObjectionable content:\nProhibition of selling animals: It is explicitly prohibited to sell animals through the Tiu, Tiu application. Any user who tries to sell animals through the app will be banned from the platform./n/n Prohibition of inappropriate content: Tiu, tiu app is dedicated to connecting animal adopters and donors. Any sexual or pornographic content will be prohibited and users who publish such content will be banned from the platform./n/n Reporting inappropriate content: Users have the right to report any publication they consider inappropriate. If a post receives a significant number of reports, it will be automatically deleted./n/n Responsibility for content: You are solely responsible for the content you post on the app, including information, photos and videos. Please ensure this information is accurate and does not infringe any third party copyright./n/n Changes to terms and conditions: We reserve the right to change these terms and conditions at any time without notice. Any changes will be posted on our \"Terms and Conditions\" page\"./n/n Questions and suggestions: If you have any questions about these terms and conditions, please contact us through the \"Contact Us\" tab in the app or via email tiutiuapp2@gmail.com./n/nBy using the Tiu application, tiu, you agree to all the terms and conditions mentioned above.'**
  String get termsAndConditionsText;

  /// No description provided for @privacyPolicyText.
  ///
  /// In en, this message translates to:
  /// **'The privacy of our users is very important to us. Therefore, we would like to explain how we collect, use and protect the personal information that you share with us when using the Tiu app, tiu./n/n/nData Collection:/nWe collect information such as location, name, WhatsApp number and email address. email only to ensure the correct functioning of the application. This information is essential so that we can connect users interested in adopting animals with users who want to donate their animals./n/n/nUse of Data:/nWe do not share your personal information with third parties. We use your information only to provide the services offered by the application./n/n/nDeletion of Data:/nUsers can request the deletion of their information through the application itself, just access the \"Delete my account\" option. Upon deletion, your data will be permanently removed from our systems./n/n/nSecurity:/nWe take security measures to protect your personal information from unauthorized access and inappropriate use. However, we cannot guarantee the absolute security of information transmitted over the internet. It is important that you take steps to protect your information, such as not sharing your password and keeping your device secure./n/n/nPrivacy Policy Changes:/nWe reserve the right to change this privacy policy at any time, without early warning. Any changes will be posted on our \"Privacy Policy\" page./n/n/nIf you have any questions about this privacy policy, please contact us at tiutiuapp2@gmail.com.'**
  String get privacyPolicyText;

  /// No description provided for @afghanistan.
  ///
  /// In en, this message translates to:
  /// **'Afghanistan'**
  String get afghanistan;

  /// No description provided for @albania.
  ///
  /// In en, this message translates to:
  /// **'Albania'**
  String get albania;

  /// No description provided for @algeria.
  ///
  /// In en, this message translates to:
  /// **'Algeria'**
  String get algeria;

  /// No description provided for @andorra.
  ///
  /// In en, this message translates to:
  /// **'Andorra'**
  String get andorra;

  /// No description provided for @angola.
  ///
  /// In en, this message translates to:
  /// **'Angola'**
  String get angola;

  /// No description provided for @antiguaDeps.
  ///
  /// In en, this message translates to:
  /// **'Antigua & Deps'**
  String get antiguaDeps;

  /// No description provided for @argentina.
  ///
  /// In en, this message translates to:
  /// **'Argentina'**
  String get argentina;

  /// No description provided for @armenia.
  ///
  /// In en, this message translates to:
  /// **'Armenia'**
  String get armenia;

  /// No description provided for @australia.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get australia;

  /// No description provided for @austria.
  ///
  /// In en, this message translates to:
  /// **'Austria'**
  String get austria;

  /// No description provided for @azerbaijan.
  ///
  /// In en, this message translates to:
  /// **'Azerbaijan'**
  String get azerbaijan;

  /// No description provided for @bahamas.
  ///
  /// In en, this message translates to:
  /// **'Bahamas'**
  String get bahamas;

  /// No description provided for @bahrain.
  ///
  /// In en, this message translates to:
  /// **'Bahrain'**
  String get bahrain;

  /// No description provided for @bangladesh.
  ///
  /// In en, this message translates to:
  /// **'Bangladesh'**
  String get bangladesh;

  /// No description provided for @barbados.
  ///
  /// In en, this message translates to:
  /// **'Barbados'**
  String get barbados;

  /// No description provided for @belarus.
  ///
  /// In en, this message translates to:
  /// **'Belarus'**
  String get belarus;

  /// No description provided for @belgium.
  ///
  /// In en, this message translates to:
  /// **'Belgium'**
  String get belgium;

  /// No description provided for @belize.
  ///
  /// In en, this message translates to:
  /// **'Belize'**
  String get belize;

  /// No description provided for @benin.
  ///
  /// In en, this message translates to:
  /// **'Benin'**
  String get benin;

  /// No description provided for @bhutan.
  ///
  /// In en, this message translates to:
  /// **'Bhutan'**
  String get bhutan;

  /// No description provided for @bolivia.
  ///
  /// In en, this message translates to:
  /// **'Bolivia'**
  String get bolivia;

  /// No description provided for @bosniaHerzegovina.
  ///
  /// In en, this message translates to:
  /// **'Bosnia Herzegovina'**
  String get bosniaHerzegovina;

  /// No description provided for @botswana.
  ///
  /// In en, this message translates to:
  /// **'Botswana'**
  String get botswana;

  /// No description provided for @brazil.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get brazil;

  /// No description provided for @brunei.
  ///
  /// In en, this message translates to:
  /// **'Brunei'**
  String get brunei;

  /// No description provided for @bulgaria.
  ///
  /// In en, this message translates to:
  /// **'Bulgaria'**
  String get bulgaria;

  /// No description provided for @burkina.
  ///
  /// In en, this message translates to:
  /// **'Burkina'**
  String get burkina;

  /// No description provided for @burundi.
  ///
  /// In en, this message translates to:
  /// **'Burundi'**
  String get burundi;

  /// No description provided for @cambodia.
  ///
  /// In en, this message translates to:
  /// **'Cambodia'**
  String get cambodia;

  /// No description provided for @cameroon.
  ///
  /// In en, this message translates to:
  /// **'Cameroon'**
  String get cameroon;

  /// No description provided for @canada.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get canada;

  /// No description provided for @capeVerde.
  ///
  /// In en, this message translates to:
  /// **'Cape Verde'**
  String get capeVerde;

  /// No description provided for @centralAfricanRep.
  ///
  /// In en, this message translates to:
  /// **'Central African Rep'**
  String get centralAfricanRep;

  /// No description provided for @chad.
  ///
  /// In en, this message translates to:
  /// **'Chad'**
  String get chad;

  /// No description provided for @chile.
  ///
  /// In en, this message translates to:
  /// **'Chile'**
  String get chile;

  /// No description provided for @china.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get china;

  /// No description provided for @colombia.
  ///
  /// In en, this message translates to:
  /// **'Colombia'**
  String get colombia;

  /// No description provided for @comoros.
  ///
  /// In en, this message translates to:
  /// **'Comoros'**
  String get comoros;

  /// No description provided for @congo.
  ///
  /// In en, this message translates to:
  /// **'Congo'**
  String get congo;

  /// No description provided for @costaRica.
  ///
  /// In en, this message translates to:
  /// **'Costa Rica'**
  String get costaRica;

  /// No description provided for @croatia.
  ///
  /// In en, this message translates to:
  /// **'Croatia'**
  String get croatia;

  /// No description provided for @cuba.
  ///
  /// In en, this message translates to:
  /// **'Cuba'**
  String get cuba;

  /// No description provided for @cyprus.
  ///
  /// In en, this message translates to:
  /// **'Cyprus'**
  String get cyprus;

  /// No description provided for @czechRepublic.
  ///
  /// In en, this message translates to:
  /// **'Czech Republic'**
  String get czechRepublic;

  /// No description provided for @denmark.
  ///
  /// In en, this message translates to:
  /// **'Denmark'**
  String get denmark;

  /// No description provided for @djibouti.
  ///
  /// In en, this message translates to:
  /// **'Djibouti'**
  String get djibouti;

  /// No description provided for @dominica.
  ///
  /// In en, this message translates to:
  /// **'Dominica'**
  String get dominica;

  /// No description provided for @dominicanRepublic.
  ///
  /// In en, this message translates to:
  /// **'Dominican Republic'**
  String get dominicanRepublic;

  /// No description provided for @eastTimor.
  ///
  /// In en, this message translates to:
  /// **'East Timor'**
  String get eastTimor;

  /// No description provided for @ecuador.
  ///
  /// In en, this message translates to:
  /// **'Ecuador'**
  String get ecuador;

  /// No description provided for @egypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get egypt;

  /// No description provided for @elSalvador.
  ///
  /// In en, this message translates to:
  /// **'El Salvador'**
  String get elSalvador;

  /// No description provided for @equatorialGuinea.
  ///
  /// In en, this message translates to:
  /// **'Equatorial Guinea'**
  String get equatorialGuinea;

  /// No description provided for @eritrea.
  ///
  /// In en, this message translates to:
  /// **'Eritrea'**
  String get eritrea;

  /// No description provided for @estonia.
  ///
  /// In en, this message translates to:
  /// **'Estonia'**
  String get estonia;

  /// No description provided for @ethiopia.
  ///
  /// In en, this message translates to:
  /// **'Ethiopia'**
  String get ethiopia;

  /// No description provided for @fiji.
  ///
  /// In en, this message translates to:
  /// **'Fiji'**
  String get fiji;

  /// No description provided for @finland.
  ///
  /// In en, this message translates to:
  /// **'Finland'**
  String get finland;

  /// No description provided for @france.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get france;

  /// No description provided for @gabon.
  ///
  /// In en, this message translates to:
  /// **'Gabon'**
  String get gabon;

  /// No description provided for @gambia.
  ///
  /// In en, this message translates to:
  /// **'Gambia'**
  String get gambia;

  /// No description provided for @georgia.
  ///
  /// In en, this message translates to:
  /// **'Georgia'**
  String get georgia;

  /// No description provided for @germany.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get germany;

  /// No description provided for @ghana.
  ///
  /// In en, this message translates to:
  /// **'Ghana'**
  String get ghana;

  /// No description provided for @greece.
  ///
  /// In en, this message translates to:
  /// **'Greece'**
  String get greece;

  /// No description provided for @grenada.
  ///
  /// In en, this message translates to:
  /// **'Grenada'**
  String get grenada;

  /// No description provided for @guatemala.
  ///
  /// In en, this message translates to:
  /// **'Guatemala'**
  String get guatemala;

  /// No description provided for @guinea.
  ///
  /// In en, this message translates to:
  /// **'Guinea'**
  String get guinea;

  /// No description provided for @guineaBissau.
  ///
  /// In en, this message translates to:
  /// **'Guinea-Bissau'**
  String get guineaBissau;

  /// No description provided for @guyana.
  ///
  /// In en, this message translates to:
  /// **'Guyana'**
  String get guyana;

  /// No description provided for @haiti.
  ///
  /// In en, this message translates to:
  /// **'Haiti'**
  String get haiti;

  /// No description provided for @honduras.
  ///
  /// In en, this message translates to:
  /// **'Honduras'**
  String get honduras;

  /// No description provided for @hungary.
  ///
  /// In en, this message translates to:
  /// **'Hungary'**
  String get hungary;

  /// No description provided for @iceland.
  ///
  /// In en, this message translates to:
  /// **'Iceland'**
  String get iceland;

  /// No description provided for @india.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get india;

  /// No description provided for @indonesia.
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get indonesia;

  /// No description provided for @iran.
  ///
  /// In en, this message translates to:
  /// **'Iran'**
  String get iran;

  /// No description provided for @iraq.
  ///
  /// In en, this message translates to:
  /// **'Iraq'**
  String get iraq;

  /// No description provided for @ireland.
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get ireland;

  /// No description provided for @israel.
  ///
  /// In en, this message translates to:
  /// **'Israel'**
  String get israel;

  /// No description provided for @italy.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get italy;

  /// No description provided for @ivoryCoast.
  ///
  /// In en, this message translates to:
  /// **'Ivory Coast'**
  String get ivoryCoast;

  /// No description provided for @jamaica.
  ///
  /// In en, this message translates to:
  /// **'Jamaica'**
  String get jamaica;

  /// No description provided for @japan.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get japan;

  /// No description provided for @jordan.
  ///
  /// In en, this message translates to:
  /// **'Jordan'**
  String get jordan;

  /// No description provided for @kazakhstan.
  ///
  /// In en, this message translates to:
  /// **'Kazakhstan'**
  String get kazakhstan;

  /// No description provided for @kenya.
  ///
  /// In en, this message translates to:
  /// **'Kenya'**
  String get kenya;

  /// No description provided for @kiribati.
  ///
  /// In en, this message translates to:
  /// **'Kiribati'**
  String get kiribati;

  /// No description provided for @koreaNorth.
  ///
  /// In en, this message translates to:
  /// **'Korea North'**
  String get koreaNorth;

  /// No description provided for @koreaSouth.
  ///
  /// In en, this message translates to:
  /// **'Korea South'**
  String get koreaSouth;

  /// No description provided for @kosovo.
  ///
  /// In en, this message translates to:
  /// **'Kosovo'**
  String get kosovo;

  /// No description provided for @kuwait.
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get kuwait;

  /// No description provided for @kyrgyzstan.
  ///
  /// In en, this message translates to:
  /// **'Kyrgyzstan'**
  String get kyrgyzstan;

  /// No description provided for @laos.
  ///
  /// In en, this message translates to:
  /// **'Laos'**
  String get laos;

  /// No description provided for @latvia.
  ///
  /// In en, this message translates to:
  /// **'Latvia'**
  String get latvia;

  /// No description provided for @lebanon.
  ///
  /// In en, this message translates to:
  /// **'Lebanon'**
  String get lebanon;

  /// No description provided for @lesotho.
  ///
  /// In en, this message translates to:
  /// **'Lesotho'**
  String get lesotho;

  /// No description provided for @liberia.
  ///
  /// In en, this message translates to:
  /// **'Liberia'**
  String get liberia;

  /// No description provided for @libya.
  ///
  /// In en, this message translates to:
  /// **'Libya'**
  String get libya;

  /// No description provided for @liechtenstein.
  ///
  /// In en, this message translates to:
  /// **'Liechtenstein'**
  String get liechtenstein;

  /// No description provided for @lithuania.
  ///
  /// In en, this message translates to:
  /// **'Lithuania'**
  String get lithuania;

  /// No description provided for @luxembourg.
  ///
  /// In en, this message translates to:
  /// **'Luxembourg'**
  String get luxembourg;

  /// No description provided for @macedonia.
  ///
  /// In en, this message translates to:
  /// **'Macedonia'**
  String get macedonia;

  /// No description provided for @madagascar.
  ///
  /// In en, this message translates to:
  /// **'Madagascar'**
  String get madagascar;

  /// No description provided for @malawi.
  ///
  /// In en, this message translates to:
  /// **'Malawi'**
  String get malawi;

  /// No description provided for @malaysia.
  ///
  /// In en, this message translates to:
  /// **'Malaysia'**
  String get malaysia;

  /// No description provided for @maldives.
  ///
  /// In en, this message translates to:
  /// **'Maldives'**
  String get maldives;

  /// No description provided for @mali.
  ///
  /// In en, this message translates to:
  /// **'Mali'**
  String get mali;

  /// No description provided for @malta.
  ///
  /// In en, this message translates to:
  /// **'Malta'**
  String get malta;

  /// No description provided for @marshallIslands.
  ///
  /// In en, this message translates to:
  /// **'Marshall Islands'**
  String get marshallIslands;

  /// No description provided for @mauritania.
  ///
  /// In en, this message translates to:
  /// **'Mauritania'**
  String get mauritania;

  /// No description provided for @mauritius.
  ///
  /// In en, this message translates to:
  /// **'Mauritius'**
  String get mauritius;

  /// No description provided for @mexico.
  ///
  /// In en, this message translates to:
  /// **'Mexico'**
  String get mexico;

  /// No description provided for @micronesia.
  ///
  /// In en, this message translates to:
  /// **'Micronesia'**
  String get micronesia;

  /// No description provided for @moldova.
  ///
  /// In en, this message translates to:
  /// **'Moldova'**
  String get moldova;

  /// No description provided for @monaco.
  ///
  /// In en, this message translates to:
  /// **'Monaco'**
  String get monaco;

  /// No description provided for @mongolia.
  ///
  /// In en, this message translates to:
  /// **'Mongolia'**
  String get mongolia;

  /// No description provided for @montenegro.
  ///
  /// In en, this message translates to:
  /// **'Montenegro'**
  String get montenegro;

  /// No description provided for @morocco.
  ///
  /// In en, this message translates to:
  /// **'Morocco'**
  String get morocco;

  /// No description provided for @mozambique.
  ///
  /// In en, this message translates to:
  /// **'Mozambique'**
  String get mozambique;

  /// No description provided for @myanmar.
  ///
  /// In en, this message translates to:
  /// **'Myanmar, (Burma)'**
  String get myanmar;

  /// No description provided for @namibia.
  ///
  /// In en, this message translates to:
  /// **'Namibia'**
  String get namibia;

  /// No description provided for @nauru.
  ///
  /// In en, this message translates to:
  /// **'Nauru'**
  String get nauru;

  /// No description provided for @nepal.
  ///
  /// In en, this message translates to:
  /// **'Nepal'**
  String get nepal;

  /// No description provided for @netherlands.
  ///
  /// In en, this message translates to:
  /// **'Netherlands'**
  String get netherlands;

  /// No description provided for @newZealand.
  ///
  /// In en, this message translates to:
  /// **'New Zealand'**
  String get newZealand;

  /// No description provided for @nicaragua.
  ///
  /// In en, this message translates to:
  /// **'Nicaragua'**
  String get nicaragua;

  /// No description provided for @niger.
  ///
  /// In en, this message translates to:
  /// **'Niger'**
  String get niger;

  /// No description provided for @nigeria.
  ///
  /// In en, this message translates to:
  /// **'Nigeria'**
  String get nigeria;

  /// No description provided for @norway.
  ///
  /// In en, this message translates to:
  /// **'Norway'**
  String get norway;

  /// No description provided for @oman.
  ///
  /// In en, this message translates to:
  /// **'Oman'**
  String get oman;

  /// No description provided for @pakistan.
  ///
  /// In en, this message translates to:
  /// **'Pakistan'**
  String get pakistan;

  /// No description provided for @palau.
  ///
  /// In en, this message translates to:
  /// **'Palau'**
  String get palau;

  /// No description provided for @panama.
  ///
  /// In en, this message translates to:
  /// **'Panama'**
  String get panama;

  /// No description provided for @papuaNewGuinea.
  ///
  /// In en, this message translates to:
  /// **'Papua New Guinea'**
  String get papuaNewGuinea;

  /// No description provided for @paraguay.
  ///
  /// In en, this message translates to:
  /// **'Paraguay'**
  String get paraguay;

  /// No description provided for @peru.
  ///
  /// In en, this message translates to:
  /// **'Peru'**
  String get peru;

  /// No description provided for @philippines.
  ///
  /// In en, this message translates to:
  /// **'Philippines'**
  String get philippines;

  /// No description provided for @poland.
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get poland;

  /// No description provided for @portugal.
  ///
  /// In en, this message translates to:
  /// **'Portugal'**
  String get portugal;

  /// No description provided for @qatar.
  ///
  /// In en, this message translates to:
  /// **'Qatar'**
  String get qatar;

  /// No description provided for @romania.
  ///
  /// In en, this message translates to:
  /// **'Romania'**
  String get romania;

  /// No description provided for @russianFederation.
  ///
  /// In en, this message translates to:
  /// **'Russian Federation'**
  String get russianFederation;

  /// No description provided for @rwanda.
  ///
  /// In en, this message translates to:
  /// **'Rwanda'**
  String get rwanda;

  /// No description provided for @stKittsNevis.
  ///
  /// In en, this message translates to:
  /// **'St Kitts & Nevis'**
  String get stKittsNevis;

  /// No description provided for @stLucia.
  ///
  /// In en, this message translates to:
  /// **'St Lucia'**
  String get stLucia;

  /// No description provided for @saintVincenttheGrenadines.
  ///
  /// In en, this message translates to:
  /// **'Saint Vincent & the Grenadines'**
  String get saintVincenttheGrenadines;

  /// No description provided for @samoa.
  ///
  /// In en, this message translates to:
  /// **'Samoa'**
  String get samoa;

  /// No description provided for @sanMarino.
  ///
  /// In en, this message translates to:
  /// **'San Marino'**
  String get sanMarino;

  /// No description provided for @saoTomePrincipe.
  ///
  /// In en, this message translates to:
  /// **'Sao Tome & Principe'**
  String get saoTomePrincipe;

  /// No description provided for @saudiArabia.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get saudiArabia;

  /// No description provided for @senegal.
  ///
  /// In en, this message translates to:
  /// **'Senegal'**
  String get senegal;

  /// No description provided for @serbia.
  ///
  /// In en, this message translates to:
  /// **'Serbia'**
  String get serbia;

  /// No description provided for @seychelles.
  ///
  /// In en, this message translates to:
  /// **'Seychelles'**
  String get seychelles;

  /// No description provided for @sierraLeone.
  ///
  /// In en, this message translates to:
  /// **'Sierra Leone'**
  String get sierraLeone;

  /// No description provided for @singapore.
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get singapore;

  /// No description provided for @slovakia.
  ///
  /// In en, this message translates to:
  /// **'Slovakia'**
  String get slovakia;

  /// No description provided for @slovenia.
  ///
  /// In en, this message translates to:
  /// **'Slovenia'**
  String get slovenia;

  /// No description provided for @solomonIslands.
  ///
  /// In en, this message translates to:
  /// **'Solomon Islands'**
  String get solomonIslands;

  /// No description provided for @somalia.
  ///
  /// In en, this message translates to:
  /// **'Somalia'**
  String get somalia;

  /// No description provided for @southAfrica.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get southAfrica;

  /// No description provided for @southSudan.
  ///
  /// In en, this message translates to:
  /// **'South Sudan'**
  String get southSudan;

  /// No description provided for @spain.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get spain;

  /// No description provided for @sriLanka.
  ///
  /// In en, this message translates to:
  /// **'Sri Lanka'**
  String get sriLanka;

  /// No description provided for @sudan.
  ///
  /// In en, this message translates to:
  /// **'Sudan'**
  String get sudan;

  /// No description provided for @suriname.
  ///
  /// In en, this message translates to:
  /// **'Suriname'**
  String get suriname;

  /// No description provided for @swaziland.
  ///
  /// In en, this message translates to:
  /// **'Swaziland'**
  String get swaziland;

  /// No description provided for @sweden.
  ///
  /// In en, this message translates to:
  /// **'Sweden'**
  String get sweden;

  /// No description provided for @switzerland.
  ///
  /// In en, this message translates to:
  /// **'Switzerland'**
  String get switzerland;

  /// No description provided for @syria.
  ///
  /// In en, this message translates to:
  /// **'Syria'**
  String get syria;

  /// No description provided for @taiwan.
  ///
  /// In en, this message translates to:
  /// **'Taiwan'**
  String get taiwan;

  /// No description provided for @tajikistan.
  ///
  /// In en, this message translates to:
  /// **'Tajikistan'**
  String get tajikistan;

  /// No description provided for @tanzania.
  ///
  /// In en, this message translates to:
  /// **'Tanzania'**
  String get tanzania;

  /// No description provided for @thailand.
  ///
  /// In en, this message translates to:
  /// **'Thailand'**
  String get thailand;

  /// No description provided for @togo.
  ///
  /// In en, this message translates to:
  /// **'Togo'**
  String get togo;

  /// No description provided for @tonga.
  ///
  /// In en, this message translates to:
  /// **'Tonga'**
  String get tonga;

  /// No description provided for @trinidadTobago.
  ///
  /// In en, this message translates to:
  /// **'Trinidad & Tobago'**
  String get trinidadTobago;

  /// No description provided for @tunisia.
  ///
  /// In en, this message translates to:
  /// **'Tunisia'**
  String get tunisia;

  /// No description provided for @turkey.
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get turkey;

  /// No description provided for @turkmenistan.
  ///
  /// In en, this message translates to:
  /// **'Turkmenistan'**
  String get turkmenistan;

  /// No description provided for @tuvalu.
  ///
  /// In en, this message translates to:
  /// **'Tuvalu'**
  String get tuvalu;

  /// No description provided for @uganda.
  ///
  /// In en, this message translates to:
  /// **'Uganda'**
  String get uganda;

  /// No description provided for @ukraine.
  ///
  /// In en, this message translates to:
  /// **'Ukraine'**
  String get ukraine;

  /// No description provided for @unitedArabEmirates.
  ///
  /// In en, this message translates to:
  /// **'United Arab Emirates'**
  String get unitedArabEmirates;

  /// No description provided for @unitedKingdom.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get unitedKingdom;

  /// No description provided for @unitedStates.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get unitedStates;

  /// No description provided for @uruguay.
  ///
  /// In en, this message translates to:
  /// **'Uruguay'**
  String get uruguay;

  /// No description provided for @uzbekistan.
  ///
  /// In en, this message translates to:
  /// **'Uzbekistan'**
  String get uzbekistan;

  /// No description provided for @vanuatu.
  ///
  /// In en, this message translates to:
  /// **'Vanuatu'**
  String get vanuatu;

  /// No description provided for @vaticanCity.
  ///
  /// In en, this message translates to:
  /// **'Vatican City'**
  String get vaticanCity;

  /// No description provided for @venezuela.
  ///
  /// In en, this message translates to:
  /// **'Venezuela'**
  String get venezuela;

  /// No description provided for @vietnam.
  ///
  /// In en, this message translates to:
  /// **'Vietnam'**
  String get vietnam;

  /// No description provided for @yemen.
  ///
  /// In en, this message translates to:
  /// **'Yemen'**
  String get yemen;

  /// No description provided for @zambia.
  ///
  /// In en, this message translates to:
  /// **'Zambia'**
  String get zambia;

  /// No description provided for @zimbabwe.
  ///
  /// In en, this message translates to:
  /// **'Zimbabwe'**
  String get zimbabwe;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
