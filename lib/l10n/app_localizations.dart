import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Moroccan Wedding Planner'**
  String get appTitle;

  /// No description provided for @splash_moroccanWedding.
  ///
  /// In en, this message translates to:
  /// **'Moroccan Wedding'**
  String get splash_moroccanWedding;

  /// No description provided for @splash_planner.
  ///
  /// In en, this message translates to:
  /// **'Planner'**
  String get splash_planner;

  /// No description provided for @splash_yourPerfectCelebrationAwaits.
  ///
  /// In en, this message translates to:
  /// **'Your Perfect Celebration Awaits'**
  String get splash_yourPerfectCelebrationAwaits;

  /// No description provided for @weddingDashboard_mainWedding.
  ///
  /// In en, this message translates to:
  /// **'Main Wedding'**
  String get weddingDashboard_mainWedding;

  /// No description provided for @weddingDashboard_khitba.
  ///
  /// In en, this message translates to:
  /// **'Khitba'**
  String get weddingDashboard_khitba;

  /// No description provided for @weddingDashboard_henna.
  ///
  /// In en, this message translates to:
  /// **'Henna'**
  String get weddingDashboard_henna;

  /// No description provided for @weddingDashboard_hammam.
  ///
  /// In en, this message translates to:
  /// **'Hammam'**
  String get weddingDashboard_hammam;

  /// No description provided for @weddingDashboard_draga.
  ///
  /// In en, this message translates to:
  /// **'Draga'**
  String get weddingDashboard_draga;

  /// No description provided for @weddingDashboard_guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get weddingDashboard_guest;

  /// No description provided for @weddingDashboard_added5NewGuestsToBrideFamily.
  ///
  /// In en, this message translates to:
  /// **'Added 5 new guests to bride\'s family'**
  String get weddingDashboard_added5NewGuestsToBrideFamily;

  /// No description provided for @weddingDashboard_budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get weddingDashboard_budget;

  /// No description provided for @weddingDashboard_loggedExpenseVenueDeposit15000MAD.
  ///
  /// In en, this message translates to:
  /// **'Logged expense: Venue deposit - 15,000 MAD'**
  String get weddingDashboard_loggedExpenseVenueDeposit15000MAD;

  /// No description provided for @weddingDashboard_vendor.
  ///
  /// In en, this message translates to:
  /// **'Vendor'**
  String get weddingDashboard_vendor;

  /// No description provided for @weddingDashboard_confirmedPhotographerBooking.
  ///
  /// In en, this message translates to:
  /// **'Confirmed photographer booking'**
  String get weddingDashboard_confirmedPhotographerBooking;

  /// No description provided for @weddingDashboard_tradition.
  ///
  /// In en, this message translates to:
  /// **'Tradition'**
  String get weddingDashboard_tradition;

  /// No description provided for @weddingDashboard_completedBookNeggafaService.
  ///
  /// In en, this message translates to:
  /// **'Completed: Book Neggafa service'**
  String get weddingDashboard_completedBookNeggafaService;

  /// No description provided for @weddingDashboard_dataSyncedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Data synced successfully'**
  String get weddingDashboard_dataSyncedSuccessfully;

  /// No description provided for @weddingDashboard_weddingPlanner.
  ///
  /// In en, this message translates to:
  /// **'Wedding Planner'**
  String get weddingDashboard_weddingPlanner;

  /// No description provided for @weddingDashboard_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get weddingDashboard_dashboard;

  /// No description provided for @weddingDashboard_timeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get weddingDashboard_timeline;

  /// No description provided for @weddingDashboard_guests.
  ///
  /// In en, this message translates to:
  /// **'Guests'**
  String get weddingDashboard_guests;

  /// No description provided for @weddingDashboard_vendors.
  ///
  /// In en, this message translates to:
  /// **'Vendors'**
  String get weddingDashboard_vendors;

  /// No description provided for @weddingDashboard_tabNameComingSoon.
  ///
  /// In en, this message translates to:
  /// **'{tabName} Coming Soon'**
  String weddingDashboard_tabNameComingSoon(Object tabName);

  /// No description provided for @weddingDashboard_thisFeatureIsUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'This feature is under development'**
  String get weddingDashboard_thisFeatureIsUnderDevelopment;

  /// No description provided for @weddingDashboard_quickAdd.
  ///
  /// In en, this message translates to:
  /// **'Quick Add'**
  String get weddingDashboard_quickAdd;

  /// No description provided for @weddingDashboard_quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get weddingDashboard_quickActions;

  /// No description provided for @weddingDashboard_addGuest.
  ///
  /// In en, this message translates to:
  /// **'Add Guest'**
  String get weddingDashboard_addGuest;

  /// No description provided for @weddingDashboard_logExpense.
  ///
  /// In en, this message translates to:
  /// **'Log Expense'**
  String get weddingDashboard_logExpense;

  /// No description provided for @weddingDashboard_checkTradition.
  ///
  /// In en, this message translates to:
  /// **'Check Tradition'**
  String get weddingDashboard_checkTradition;

  /// No description provided for @greetingHeader_yourDreamWeddingAwaits.
  ///
  /// In en, this message translates to:
  /// **'Your dream wedding awaits'**
  String get greetingHeader_yourDreamWeddingAwaits;

  /// No description provided for @countdownTimer_timeUntilYourBigDay.
  ///
  /// In en, this message translates to:
  /// **'Time Until Your Big Day'**
  String get countdownTimer_timeUntilYourBigDay;

  /// No description provided for @countdownTimer_days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get countdownTimer_days;

  /// No description provided for @countdownTimer_hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get countdownTimer_hours;

  /// No description provided for @countdownTimer_minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get countdownTimer_minutes;

  /// No description provided for @progressOverview_planningProgress.
  ///
  /// In en, this message translates to:
  /// **'Planning Progress'**
  String get progressOverview_planningProgress;

  /// No description provided for @progressOverview_guests.
  ///
  /// In en, this message translates to:
  /// **'Guests'**
  String get progressOverview_guests;

  /// No description provided for @progressOverview_budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get progressOverview_budget;

  /// No description provided for @progressOverview_vendors.
  ///
  /// In en, this message translates to:
  /// **'Vendors'**
  String get progressOverview_vendors;

  /// No description provided for @progressOverview_traditions.
  ///
  /// In en, this message translates to:
  /// **'Traditions'**
  String get progressOverview_traditions;

  /// No description provided for @progressOverview_categoryProgress.
  ///
  /// In en, this message translates to:
  /// **'{category} Progress'**
  String progressOverview_categoryProgress(Object category);

  /// No description provided for @progressOverview_completionPercentage.
  ///
  /// In en, this message translates to:
  /// **'Completion: {percentage}%'**
  String progressOverview_completionPercentage(Object percentage);

  /// No description provided for @progressOverview_detailedBreakdownComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Detailed breakdown coming soon'**
  String get progressOverview_detailedBreakdownComingSoon;

  /// No description provided for @progressOverview_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get progressOverview_close;

  /// No description provided for @quickActionCards_quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActionCards_quickActions;

  /// No description provided for @quickActionCards_addGuest.
  ///
  /// In en, this message translates to:
  /// **'Add Guest'**
  String get quickActionCards_addGuest;

  /// No description provided for @quickActionCards_addNewGuestsToYourWeddingList.
  ///
  /// In en, this message translates to:
  /// **'Add new guests to your wedding list'**
  String get quickActionCards_addNewGuestsToYourWeddingList;

  /// No description provided for @quickActionCards_logExpense.
  ///
  /// In en, this message translates to:
  /// **'Log Expense'**
  String get quickActionCards_logExpense;

  /// No description provided for @quickActionCards_trackYourWeddingExpenses.
  ///
  /// In en, this message translates to:
  /// **'Track your wedding expenses'**
  String get quickActionCards_trackYourWeddingExpenses;

  /// No description provided for @quickActionCards_checkTradition.
  ///
  /// In en, this message translates to:
  /// **'Check Tradition'**
  String get quickActionCards_checkTradition;

  /// No description provided for @quickActionCards_reviewMoroccanWeddingTraditions.
  ///
  /// In en, this message translates to:
  /// **'Review Moroccan wedding traditions'**
  String get quickActionCards_reviewMoroccanWeddingTraditions;

  /// No description provided for @quickActionCards_go.
  ///
  /// In en, this message translates to:
  /// **'Go'**
  String get quickActionCards_go;

  /// No description provided for @recentActivityFeed_dago.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String recentActivityFeed_dago(Object count);

  /// No description provided for @recentActivityFeed_hago.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String recentActivityFeed_hago(Object count);

  /// No description provided for @recentActivityFeed_mago.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String recentActivityFeed_mago(Object count);

  /// No description provided for @recentActivityFeed_justNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get recentActivityFeed_justNow;

  /// No description provided for @recentActivityFeed_guest.
  ///
  /// In en, this message translates to:
  /// **'guest'**
  String get recentActivityFeed_guest;

  /// No description provided for @recentActivityFeed_budget.
  ///
  /// In en, this message translates to:
  /// **'budget'**
  String get recentActivityFeed_budget;

  /// No description provided for @recentActivityFeed_vendor.
  ///
  /// In en, this message translates to:
  /// **'vendor'**
  String get recentActivityFeed_vendor;

  /// No description provided for @recentActivityFeed_tradition.
  ///
  /// In en, this message translates to:
  /// **'tradition'**
  String get recentActivityFeed_tradition;

  /// No description provided for @recentActivityFeed_recentActivity.
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get recentActivityFeed_recentActivity;

  /// No description provided for @guestListManagement_guestList.
  ///
  /// In en, this message translates to:
  /// **'Guest List'**
  String get guestListManagement_guestList;

  /// No description provided for @guestListManagement_filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get guestListManagement_filter;

  /// No description provided for @guestListManagement_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get guestListManagement_cancel;

  /// No description provided for @guestListManagement_filtersActive.
  ///
  /// In en, this message translates to:
  /// **'Filters active'**
  String get guestListManagement_filtersActive;

  /// No description provided for @guestListManagement_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get guestListManagement_clear;

  /// No description provided for @guestListManagement_selected.
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String guestListManagement_selected(Object count);

  /// No description provided for @guestListManagement_sendInvites.
  ///
  /// In en, this message translates to:
  /// **'Send Invites'**
  String get guestListManagement_sendInvites;

  /// No description provided for @guestListManagement_noGuestsFound.
  ///
  /// In en, this message translates to:
  /// **'No guests found'**
  String get guestListManagement_noGuestsFound;

  /// No description provided for @guestListManagement_noGuestsYet.
  ///
  /// In en, this message translates to:
  /// **'No guests yet'**
  String get guestListManagement_noGuestsYet;

  /// No description provided for @guestListManagement_tryAdjustingYourSearchOrFilters.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters'**
  String get guestListManagement_tryAdjustingYourSearchOrFilters;

  /// No description provided for @guestListManagement_startAddingGuestsToYourWedding.
  ///
  /// In en, this message translates to:
  /// **'Start adding guests to your wedding'**
  String get guestListManagement_startAddingGuestsToYourWedding;

  /// No description provided for @guestListManagement_guestAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Guest added successfully'**
  String get guestListManagement_guestAddedSuccessfully;

  /// No description provided for @guestListManagement_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get guestListManagement_phone;

  /// No description provided for @guestListManagement_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get guestListManagement_email;

  /// No description provided for @guestListManagement_familySide.
  ///
  /// In en, this message translates to:
  /// **'Family Side'**
  String get guestListManagement_familySide;

  /// No description provided for @guestListManagement_brideFamily.
  ///
  /// In en, this message translates to:
  /// **'Bride Family'**
  String get guestListManagement_brideFamily;

  /// No description provided for @guestListManagement_groomFamily.
  ///
  /// In en, this message translates to:
  /// **'Groom Family'**
  String get guestListManagement_groomFamily;

  /// No description provided for @guestListManagement_plusOne.
  ///
  /// In en, this message translates to:
  /// **'Plus One'**
  String get guestListManagement_plusOne;

  /// No description provided for @guestListManagement_allowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get guestListManagement_allowed;

  /// No description provided for @guestListManagement_invitationSentTo.
  ///
  /// In en, this message translates to:
  /// **'Invitation sent to {guestName}'**
  String guestListManagement_invitationSentTo(Object guestName);

  /// No description provided for @guestListManagement_markedAsConfirmed.
  ///
  /// In en, this message translates to:
  /// **'{guestName} marked as confirmed'**
  String guestListManagement_markedAsConfirmed(Object guestName);

  /// No description provided for @guestListManagement_seatingAssignmentFor.
  ///
  /// In en, this message translates to:
  /// **'Seating assignment for {guestName}'**
  String guestListManagement_seatingAssignmentFor(Object guestName);

  /// No description provided for @guestListManagement_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit {guestName}'**
  String guestListManagement_edit(Object guestName);

  /// No description provided for @guestListManagement_removeGuest.
  ///
  /// In en, this message translates to:
  /// **'Remove Guest'**
  String get guestListManagement_removeGuest;

  /// No description provided for @guestListManagement_areYouSureYouWantToRemove.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove {guestName}?'**
  String guestListManagement_areYouSureYouWantToRemove(Object guestName);

  /// No description provided for @guestListManagement_removed.
  ///
  /// In en, this message translates to:
  /// **'{guestName} removed'**
  String guestListManagement_removed(Object guestName);

  /// No description provided for @guestListManagement_remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get guestListManagement_remove;

  /// No description provided for @guestListManagement_invitationsSentTo.
  ///
  /// In en, this message translates to:
  /// **'Invitations sent to {count} guests'**
  String guestListManagement_invitationsSentTo(Object count);

  /// No description provided for @guestListManagement_sister.
  ///
  /// In en, this message translates to:
  /// **'Sister'**
  String get guestListManagement_sister;

  /// No description provided for @guestListManagement_brother.
  ///
  /// In en, this message translates to:
  /// **'Brother'**
  String get guestListManagement_brother;

  /// No description provided for @guestListManagement_closeFriend.
  ///
  /// In en, this message translates to:
  /// **'Close Friend'**
  String get guestListManagement_closeFriend;

  /// No description provided for @guestListManagement_cousin.
  ///
  /// In en, this message translates to:
  /// **'Cousin'**
  String get guestListManagement_cousin;

  /// No description provided for @guestListManagement_aunt.
  ///
  /// In en, this message translates to:
  /// **'Aunt'**
  String get guestListManagement_aunt;

  /// No description provided for @guestListManagement_uncle.
  ///
  /// In en, this message translates to:
  /// **'Uncle'**
  String get guestListManagement_uncle;

  /// No description provided for @guestListManagement_colleague.
  ///
  /// In en, this message translates to:
  /// **'Colleague'**
  String get guestListManagement_colleague;

  /// No description provided for @guestListManagement_youngWomanWithLongDarkHair.
  ///
  /// In en, this message translates to:
  /// **'Young woman with long dark hair wearing traditional Moroccan kaftan in emerald green'**
  String get guestListManagement_youngWomanWithLongDarkHair;

  /// No description provided for @guestListManagement_middleAgedManWithShortBlackHair.
  ///
  /// In en, this message translates to:
  /// **'Middle-aged man with short black hair and beard wearing traditional white djellaba'**
  String get guestListManagement_middleAgedManWithShortBlackHair;

  /// No description provided for @guestListManagement_youngWomanWithCurlyDarkHair.
  ///
  /// In en, this message translates to:
  /// **'Young woman with curly dark hair wearing gold jewelry and traditional Moroccan makeup'**
  String get guestListManagement_youngWomanWithCurlyDarkHair;

  /// No description provided for @guestListManagement_youngManWithShortDarkHair.
  ///
  /// In en, this message translates to:
  /// **'Young man with short dark hair wearing modern suit with traditional Moroccan embroidery'**
  String get guestListManagement_youngManWithShortDarkHair;

  /// No description provided for @guestListManagement_olderWomanWithGrayStreakedHair.
  ///
  /// In en, this message translates to:
  /// **'Older woman with gray-streaked hair wearing elegant traditional Moroccan takchita'**
  String get guestListManagement_olderWomanWithGrayStreakedHair;

  /// No description provided for @guestListManagement_middleAgedManWithGrayingBeard.
  ///
  /// In en, this message translates to:
  /// **'Middle-aged man with graying beard wearing traditional brown djellaba and red fez'**
  String get guestListManagement_middleAgedManWithGrayingBeard;

  /// No description provided for @guestListManagement_professionalWomanWithShoulderLength.
  ///
  /// In en, this message translates to:
  /// **'Professional woman with shoulder-length dark hair wearing modern business attire'**
  String get guestListManagement_professionalWomanWithShoulderLength;

  /// No description provided for @guestListManagement_youngManWithStyledDarkHair.
  ///
  /// In en, this message translates to:
  /// **'Young man with styled dark hair wearing navy blue suit with gold tie'**
  String get guestListManagement_youngManWithStyledDarkHair;

  /// No description provided for @addGuestDialog_addGuest.
  ///
  /// In en, this message translates to:
  /// **'Add Guest'**
  String get addGuestDialog_addGuest;

  /// No description provided for @addGuestDialog_fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name *'**
  String get addGuestDialog_fullName;

  /// No description provided for @addGuestDialog_enterGuestName.
  ///
  /// In en, this message translates to:
  /// **'Enter guest name'**
  String get addGuestDialog_enterGuestName;

  /// No description provided for @addGuestDialog_pleaseEnterGuestName.
  ///
  /// In en, this message translates to:
  /// **'Please enter guest name'**
  String get addGuestDialog_pleaseEnterGuestName;

  /// No description provided for @addGuestDialog_phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get addGuestDialog_phoneNumber;

  /// No description provided for @addGuestDialog_enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get addGuestDialog_enterPhoneNumber;

  /// No description provided for @addGuestDialog_emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get addGuestDialog_emailAddress;

  /// No description provided for @addGuestDialog_enterEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter email address'**
  String get addGuestDialog_enterEmailAddress;

  /// No description provided for @addGuestDialog_familySide.
  ///
  /// In en, this message translates to:
  /// **'Family Side *'**
  String get addGuestDialog_familySide;

  /// No description provided for @addGuestDialog_brideFamily.
  ///
  /// In en, this message translates to:
  /// **'Bride Family'**
  String get addGuestDialog_brideFamily;

  /// No description provided for @addGuestDialog_groomFamily.
  ///
  /// In en, this message translates to:
  /// **'Groom Family'**
  String get addGuestDialog_groomFamily;

  /// No description provided for @addGuestDialog_relationship.
  ///
  /// In en, this message translates to:
  /// **'Relationship *'**
  String get addGuestDialog_relationship;

  /// No description provided for @addGuestDialog_familyMember.
  ///
  /// In en, this message translates to:
  /// **'Family Member'**
  String get addGuestDialog_familyMember;

  /// No description provided for @addGuestDialog_closeFriend.
  ///
  /// In en, this message translates to:
  /// **'Close Friend'**
  String get addGuestDialog_closeFriend;

  /// No description provided for @addGuestDialog_colleague.
  ///
  /// In en, this message translates to:
  /// **'Colleague'**
  String get addGuestDialog_colleague;

  /// No description provided for @addGuestDialog_neighbor.
  ///
  /// In en, this message translates to:
  /// **'Neighbor'**
  String get addGuestDialog_neighbor;

  /// No description provided for @addGuestDialog_extendedFamily.
  ///
  /// In en, this message translates to:
  /// **'Extended Family'**
  String get addGuestDialog_extendedFamily;

  /// No description provided for @addGuestDialog_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get addGuestDialog_other;

  /// No description provided for @addGuestDialog_allowPlusOneGuest.
  ///
  /// In en, this message translates to:
  /// **'Allow +1 Guest'**
  String get addGuestDialog_allowPlusOneGuest;

  /// No description provided for @addGuestDialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addGuestDialog_cancel;

  /// No description provided for @addGuestDialog_defaultGuestProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Default guest profile photo'**
  String get addGuestDialog_defaultGuestProfilePhoto;

  /// No description provided for @familySegment_brideFamily.
  ///
  /// In en, this message translates to:
  /// **'Bride Family'**
  String get familySegment_brideFamily;

  /// No description provided for @familySegment_groomFamily.
  ///
  /// In en, this message translates to:
  /// **'Groom Family'**
  String get familySegment_groomFamily;

  /// No description provided for @familySegment_allGuests.
  ///
  /// In en, this message translates to:
  /// **'All Guests'**
  String get familySegment_allGuests;

  /// No description provided for @filterBottomSheet_filterGuests.
  ///
  /// In en, this message translates to:
  /// **'Filter Guests'**
  String get filterBottomSheet_filterGuests;

  /// No description provided for @filterBottomSheet_clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get filterBottomSheet_clearAll;

  /// No description provided for @filterBottomSheet_invitationStatus.
  ///
  /// In en, this message translates to:
  /// **'Invitation Status'**
  String get filterBottomSheet_invitationStatus;

  /// No description provided for @filterBottomSheet_invited.
  ///
  /// In en, this message translates to:
  /// **'Invited'**
  String get filterBottomSheet_invited;

  /// No description provided for @filterBottomSheet_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get filterBottomSheet_confirmed;

  /// No description provided for @filterBottomSheet_notComing.
  ///
  /// In en, this message translates to:
  /// **'Not Coming'**
  String get filterBottomSheet_notComing;

  /// No description provided for @filterBottomSheet_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get filterBottomSheet_pending;

  /// No description provided for @filterBottomSheet_familySide.
  ///
  /// In en, this message translates to:
  /// **'Family Side'**
  String get filterBottomSheet_familySide;

  /// No description provided for @filterBottomSheet_brideFamily.
  ///
  /// In en, this message translates to:
  /// **'Bride Family'**
  String get filterBottomSheet_brideFamily;

  /// No description provided for @filterBottomSheet_groomFamily.
  ///
  /// In en, this message translates to:
  /// **'Groom Family'**
  String get filterBottomSheet_groomFamily;

  /// No description provided for @filterBottomSheet_attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get filterBottomSheet_attendance;

  /// No description provided for @filterBottomSheet_attending.
  ///
  /// In en, this message translates to:
  /// **'Attending'**
  String get filterBottomSheet_attending;

  /// No description provided for @filterBottomSheet_notAttending.
  ///
  /// In en, this message translates to:
  /// **'Not Attending'**
  String get filterBottomSheet_notAttending;

  /// No description provided for @filterBottomSheet_maybe.
  ///
  /// In en, this message translates to:
  /// **'Maybe'**
  String get filterBottomSheet_maybe;

  /// No description provided for @filterBottomSheet_applyFilters.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get filterBottomSheet_applyFilters;

  /// No description provided for @guestCard_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get guestCard_confirmed;

  /// No description provided for @guestCard_invited.
  ///
  /// In en, this message translates to:
  /// **'Invited'**
  String get guestCard_invited;

  /// No description provided for @guestCard_notComing.
  ///
  /// In en, this message translates to:
  /// **'Not Coming'**
  String get guestCard_notComing;

  /// No description provided for @guestCard_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get guestCard_pending;

  /// No description provided for @guestCard_send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get guestCard_send;

  /// No description provided for @guestCard_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get guestCard_confirm;

  /// No description provided for @guestCard_seating.
  ///
  /// In en, this message translates to:
  /// **'Seating'**
  String get guestCard_seating;

  /// No description provided for @guestCard_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get guestCard_edit;

  /// No description provided for @guestCard_remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get guestCard_remove;

  /// No description provided for @guestCard_plusOneGuest.
  ///
  /// In en, this message translates to:
  /// **'+1 Guest'**
  String get guestCard_plusOneGuest;

  /// No description provided for @searchBar_searchGuests.
  ///
  /// In en, this message translates to:
  /// **'Search guests...'**
  String get searchBar_searchGuests;

  /// No description provided for @traditionsChecklist_preWeddingRituals.
  ///
  /// In en, this message translates to:
  /// **'Pre-Wedding Rituals'**
  String get traditionsChecklist_preWeddingRituals;

  /// No description provided for @traditionsChecklist_khitbaEngagement.
  ///
  /// In en, this message translates to:
  /// **'Khitba (Engagement)'**
  String get traditionsChecklist_khitbaEngagement;

  /// No description provided for @traditionsChecklist_traditionalEngagementCeremony.
  ///
  /// In en, this message translates to:
  /// **'Traditional engagement ceremony where families officially agree to the marriage. Includes exchange of gifts and sweets.'**
  String get traditionsChecklist_traditionalEngagementCeremony;

  /// No description provided for @traditionsChecklist_threeToSixMonthsBeforeWedding.
  ///
  /// In en, this message translates to:
  /// **'3-6 months before wedding'**
  String get traditionsChecklist_threeToSixMonthsBeforeWedding;

  /// No description provided for @traditionsChecklist_caterer.
  ///
  /// In en, this message translates to:
  /// **'Caterer'**
  String get traditionsChecklist_caterer;

  /// No description provided for @traditionsChecklist_photographer.
  ///
  /// In en, this message translates to:
  /// **'Photographer'**
  String get traditionsChecklist_photographer;

  /// No description provided for @traditionsChecklist_hennaCeremonyPreparation.
  ///
  /// In en, this message translates to:
  /// **'Henna Ceremony Preparation'**
  String get traditionsChecklist_hennaCeremonyPreparation;

  /// No description provided for @traditionsChecklist_sacredPreWeddingRitual.
  ///
  /// In en, this message translates to:
  /// **'Sacred pre-wedding ritual where bride receives intricate henna designs. Symbolizes beauty, joy, and protection.'**
  String get traditionsChecklist_sacredPreWeddingRitual;

  /// No description provided for @traditionsChecklist_oneToTwoDaysBeforeWedding.
  ///
  /// In en, this message translates to:
  /// **'1-2 days before wedding'**
  String get traditionsChecklist_oneToTwoDaysBeforeWedding;

  /// No description provided for @traditionsChecklist_hennaArtist.
  ///
  /// In en, this message translates to:
  /// **'Henna Artist'**
  String get traditionsChecklist_hennaArtist;

  /// No description provided for @traditionsChecklist_neggafa.
  ///
  /// In en, this message translates to:
  /// **'Neggafa'**
  String get traditionsChecklist_neggafa;

  /// No description provided for @traditionsChecklist_traditionalHammam.
  ///
  /// In en, this message translates to:
  /// **'Traditional Hammam'**
  String get traditionsChecklist_traditionalHammam;

  /// No description provided for @traditionsChecklist_purificationRitual.
  ///
  /// In en, this message translates to:
  /// **'Purification ritual at traditional bathhouse with family and friends. Includes body scrubbing and beauty treatments.'**
  String get traditionsChecklist_purificationRitual;

  /// No description provided for @traditionsChecklist_oneWeekBeforeWedding.
  ///
  /// In en, this message translates to:
  /// **'1 week before wedding'**
  String get traditionsChecklist_oneWeekBeforeWedding;

  /// No description provided for @traditionsChecklist_hammam.
  ///
  /// In en, this message translates to:
  /// **'Hammam'**
  String get traditionsChecklist_hammam;

  /// No description provided for @traditionsChecklist_beautySpecialist.
  ///
  /// In en, this message translates to:
  /// **'Beauty Specialist'**
  String get traditionsChecklist_beautySpecialist;

  /// No description provided for @traditionsChecklist_neggafaSelection.
  ///
  /// In en, this message translates to:
  /// **'Neggafa Selection'**
  String get traditionsChecklist_neggafaSelection;

  /// No description provided for @traditionsChecklist_choosingTheTraditionalWeddingCoordinator.
  ///
  /// In en, this message translates to:
  /// **'Choosing the traditional wedding coordinator who manages dress changes and ceremonies throughout the wedding day.'**
  String get traditionsChecklist_choosingTheTraditionalWeddingCoordinator;

  /// No description provided for @traditionsChecklist_twoToThreeMonthsBeforeWedding.
  ///
  /// In en, this message translates to:
  /// **'2-3 months before wedding'**
  String get traditionsChecklist_twoToThreeMonthsBeforeWedding;

  /// No description provided for @traditionsChecklist_traditionalDressFittings.
  ///
  /// In en, this message translates to:
  /// **'Traditional Dress Fittings'**
  String get traditionsChecklist_traditionalDressFittings;

  /// No description provided for @traditionsChecklist_multipleFittingsForThe7Traditional.
  ///
  /// In en, this message translates to:
  /// **'Multiple fittings for the 7 traditional Moroccan wedding dresses (caftans) representing different regions.'**
  String get traditionsChecklist_multipleFittingsForThe7Traditional;

  /// No description provided for @traditionsChecklist_oneToTwoMonthsBeforeWedding.
  ///
  /// In en, this message translates to:
  /// **'1-2 months before wedding'**
  String get traditionsChecklist_oneToTwoMonthsBeforeWedding;

  /// No description provided for @traditionsChecklist_dressDesigner.
  ///
  /// In en, this message translates to:
  /// **'Dress Designer'**
  String get traditionsChecklist_dressDesigner;

  /// No description provided for @traditionsChecklist_weddingDayCustoms.
  ///
  /// In en, this message translates to:
  /// **'Wedding Day Customs'**
  String get traditionsChecklist_weddingDayCustoms;

  /// No description provided for @traditionsChecklist_neggafaPreparation.
  ///
  /// In en, this message translates to:
  /// **'Neggafa Preparation'**
  String get traditionsChecklist_neggafaPreparation;

  /// No description provided for @traditionsChecklist_neggafaHelpsBridePrepare.
  ///
  /// In en, this message translates to:
  /// **'Neggafa helps bride prepare and manages the ceremonial dress changes throughout the day.'**
  String get traditionsChecklist_neggafaHelpsBridePrepare;

  /// No description provided for @traditionsChecklist_morningOfWedding.
  ///
  /// In en, this message translates to:
  /// **'Morning of wedding'**
  String get traditionsChecklist_morningOfWedding;

  /// No description provided for @traditionsChecklist_makeupArtist.
  ///
  /// In en, this message translates to:
  /// **'Makeup Artist'**
  String get traditionsChecklist_makeupArtist;

  /// No description provided for @traditionsChecklist_nikahMarriageContract.
  ///
  /// In en, this message translates to:
  /// **'Nikah (Marriage Contract)'**
  String get traditionsChecklist_nikahMarriageContract;

  /// No description provided for @traditionsChecklist_islamicMarriageContractSigning.
  ///
  /// In en, this message translates to:
  /// **'Islamic marriage contract signing ceremony with witnesses and religious officiant.'**
  String get traditionsChecklist_islamicMarriageContractSigning;

  /// No description provided for @traditionsChecklist_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get traditionsChecklist_afternoon;

  /// No description provided for @traditionsChecklist_religiousOfficiant.
  ///
  /// In en, this message translates to:
  /// **'Religious Officiant'**
  String get traditionsChecklist_religiousOfficiant;

  /// No description provided for @traditionsChecklist_zaffaProcession.
  ///
  /// In en, this message translates to:
  /// **'Zaffa Procession'**
  String get traditionsChecklist_zaffaProcession;

  /// No description provided for @traditionsChecklist_grandEntranceProcession.
  ///
  /// In en, this message translates to:
  /// **'Grand entrance procession with traditional music, dancers, and celebration as couple enters reception.'**
  String get traditionsChecklist_grandEntranceProcession;

  /// No description provided for @traditionsChecklist_eveningEntrance.
  ///
  /// In en, this message translates to:
  /// **'Evening entrance'**
  String get traditionsChecklist_eveningEntrance;

  /// No description provided for @traditionsChecklist_band.
  ///
  /// In en, this message translates to:
  /// **'Band'**
  String get traditionsChecklist_band;

  /// No description provided for @traditionsChecklist_dancers.
  ///
  /// In en, this message translates to:
  /// **'Dancers'**
  String get traditionsChecklist_dancers;

  /// No description provided for @traditionsChecklist_amariyaThrone.
  ///
  /// In en, this message translates to:
  /// **'Amariya Throne'**
  String get traditionsChecklist_amariyaThrone;

  /// No description provided for @traditionsChecklist_brideAndGroomCarriedOnOrnate.
  ///
  /// In en, this message translates to:
  /// **'Bride and groom carried on ornate throne-like platform by family members in ceremonial procession.'**
  String get traditionsChecklist_brideAndGroomCarriedOnOrnate;

  /// No description provided for @traditionsChecklist_duringReception.
  ///
  /// In en, this message translates to:
  /// **'During reception'**
  String get traditionsChecklist_duringReception;

  /// No description provided for @traditionsChecklist_amariyaRental.
  ///
  /// In en, this message translates to:
  /// **'Amariya Rental'**
  String get traditionsChecklist_amariyaRental;

  /// No description provided for @traditionsChecklist_decorators.
  ///
  /// In en, this message translates to:
  /// **'Decorators'**
  String get traditionsChecklist_decorators;

  /// No description provided for @traditionsChecklist_sevenTraditionalDresses.
  ///
  /// In en, this message translates to:
  /// **'Seven Traditional Dresses'**
  String get traditionsChecklist_sevenTraditionalDresses;

  /// No description provided for @traditionsChecklist_brideChangesInto7Different.
  ///
  /// In en, this message translates to:
  /// **'Bride changes into 7 different traditional caftans representing various Moroccan regions throughout the celebration.'**
  String get traditionsChecklist_brideChangesInto7Different;

  /// No description provided for @traditionsChecklist_throughoutEvening.
  ///
  /// In en, this message translates to:
  /// **'Throughout evening'**
  String get traditionsChecklist_throughoutEvening;

  /// No description provided for @traditionsChecklist_postWeddingTraditions.
  ///
  /// In en, this message translates to:
  /// **'Post-Wedding Traditions'**
  String get traditionsChecklist_postWeddingTraditions;

  /// No description provided for @traditionsChecklist_sabahMorningAfter.
  ///
  /// In en, this message translates to:
  /// **'Sabah Morning After'**
  String get traditionsChecklist_sabahMorningAfter;

  /// No description provided for @traditionsChecklist_dayAfterCelebration.
  ///
  /// In en, this message translates to:
  /// **'Day-after celebration with close family and friends, featuring traditional breakfast and gift exchanges.'**
  String get traditionsChecklist_dayAfterCelebration;

  /// No description provided for @traditionsChecklist_dayAfterWedding.
  ///
  /// In en, this message translates to:
  /// **'Day after wedding'**
  String get traditionsChecklist_dayAfterWedding;

  /// No description provided for @traditionsChecklist_familyVisits.
  ///
  /// In en, this message translates to:
  /// **'Family Visits'**
  String get traditionsChecklist_familyVisits;

  /// No description provided for @traditionsChecklist_newlywedsVisitBothFamilies.
  ///
  /// In en, this message translates to:
  /// **'Newlyweds visit both families to receive blessings and gifts in the weeks following the wedding.'**
  String get traditionsChecklist_newlywedsVisitBothFamilies;

  /// No description provided for @traditionsChecklist_oneToTwoWeeksAfterWedding.
  ///
  /// In en, this message translates to:
  /// **'1-2 weeks after wedding'**
  String get traditionsChecklist_oneToTwoWeeksAfterWedding;

  /// No description provided for @traditionsChecklist_thankYouGifts.
  ///
  /// In en, this message translates to:
  /// **'Thank You Gifts'**
  String get traditionsChecklist_thankYouGifts;

  /// No description provided for @traditionsChecklist_distributionOfThankYouGifts.
  ///
  /// In en, this message translates to:
  /// **'Distribution of thank you gifts to guests and family members who contributed to the wedding celebration.'**
  String get traditionsChecklist_distributionOfThankYouGifts;

  /// No description provided for @traditionsChecklist_twoToFourWeeksAfterWedding.
  ///
  /// In en, this message translates to:
  /// **'2-4 weeks after wedding'**
  String get traditionsChecklist_twoToFourWeeksAfterWedding;

  /// No description provided for @traditionsChecklist_taskMarkedAsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Task marked as completed'**
  String get traditionsChecklist_taskMarkedAsCompleted;

  /// No description provided for @traditionsChecklist_undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get traditionsChecklist_undo;

  /// No description provided for @traditionsChecklist_culturalContext.
  ///
  /// In en, this message translates to:
  /// **'Cultural Context'**
  String get traditionsChecklist_culturalContext;

  /// No description provided for @traditionsChecklist_recommendedTiming.
  ///
  /// In en, this message translates to:
  /// **'Recommended Timing'**
  String get traditionsChecklist_recommendedTiming;

  /// No description provided for @traditionsChecklist_relatedVendors.
  ///
  /// In en, this message translates to:
  /// **'Related Vendors'**
  String get traditionsChecklist_relatedVendors;

  /// No description provided for @traditionsChecklist_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get traditionsChecklist_close;

  /// No description provided for @traditionsChecklist_traditionsChecklist.
  ///
  /// In en, this message translates to:
  /// **'Traditions Checklist'**
  String get traditionsChecklist_traditionsChecklist;

  /// No description provided for @traditionsChecklist_searchTraditions.
  ///
  /// In en, this message translates to:
  /// **'Search traditions'**
  String get traditionsChecklist_searchTraditions;

  /// No description provided for @traditionsChecklist_sharingChecklistWithFamily.
  ///
  /// In en, this message translates to:
  /// **'Sharing checklist with family...'**
  String get traditionsChecklist_sharingChecklistWithFamily;

  /// No description provided for @traditionsChecklist_shareChecklist.
  ///
  /// In en, this message translates to:
  /// **'Share checklist'**
  String get traditionsChecklist_shareChecklist;

  /// No description provided for @traditionsChecklist_checklistSyncedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Checklist synced successfully'**
  String get traditionsChecklist_checklistSyncedSuccessfully;

  /// No description provided for @traditionsChecklist_overallProgress.
  ///
  /// In en, this message translates to:
  /// **'Overall Progress'**
  String get traditionsChecklist_overallProgress;

  /// No description provided for @traditionsChecklist_customFamilyTraditions.
  ///
  /// In en, this message translates to:
  /// **'Custom Family Traditions'**
  String get traditionsChecklist_customFamilyTraditions;

  /// No description provided for @traditionsChecklist_addCustom.
  ///
  /// In en, this message translates to:
  /// **'Add Custom'**
  String get traditionsChecklist_addCustom;

  /// No description provided for @addCustomTraditionDialog_addCustomTradition.
  ///
  /// In en, this message translates to:
  /// **'Add Custom Tradition'**
  String get addCustomTraditionDialog_addCustomTradition;

  /// No description provided for @addCustomTraditionDialog_traditionName.
  ///
  /// In en, this message translates to:
  /// **'Tradition Name'**
  String get addCustomTraditionDialog_traditionName;

  /// No description provided for @addCustomTraditionDialog_enterTraditionName.
  ///
  /// In en, this message translates to:
  /// **'Enter tradition name'**
  String get addCustomTraditionDialog_enterTraditionName;

  /// No description provided for @addCustomTraditionDialog_pleaseEnterATraditionName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a tradition name'**
  String get addCustomTraditionDialog_pleaseEnterATraditionName;

  /// No description provided for @addCustomTraditionDialog_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get addCustomTraditionDialog_description;

  /// No description provided for @addCustomTraditionDialog_enterTraditionDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter tradition description'**
  String get addCustomTraditionDialog_enterTraditionDescription;

  /// No description provided for @addCustomTraditionDialog_pleaseEnterADescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get addCustomTraditionDialog_pleaseEnterADescription;

  /// No description provided for @addCustomTraditionDialog_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addCustomTraditionDialog_cancel;

  /// No description provided for @addCustomTraditionDialog_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addCustomTraditionDialog_add;

  /// No description provided for @expenseEntry_venue.
  ///
  /// In en, this message translates to:
  /// **'Venue'**
  String get expenseEntry_venue;

  /// No description provided for @expenseEntry_catering.
  ///
  /// In en, this message translates to:
  /// **'Catering'**
  String get expenseEntry_catering;

  /// No description provided for @expenseEntry_neggafa.
  ///
  /// In en, this message translates to:
  /// **'Neggafa'**
  String get expenseEntry_neggafa;

  /// No description provided for @expenseEntry_traditionalBand.
  ///
  /// In en, this message translates to:
  /// **'Traditional Band'**
  String get expenseEntry_traditionalBand;

  /// No description provided for @expenseEntry_photographer.
  ///
  /// In en, this message translates to:
  /// **'Photographer'**
  String get expenseEntry_photographer;

  /// No description provided for @expenseEntry_hennaArtist.
  ///
  /// In en, this message translates to:
  /// **'Henna Artist'**
  String get expenseEntry_hennaArtist;

  /// No description provided for @expenseEntry_decoration.
  ///
  /// In en, this message translates to:
  /// **'Decoration'**
  String get expenseEntry_decoration;

  /// No description provided for @expenseEntry_palaisDesCongres.
  ///
  /// In en, this message translates to:
  /// **'Palais des Congrès'**
  String get expenseEntry_palaisDesCongres;

  /// No description provided for @expenseEntry_riadFes.
  ///
  /// In en, this message translates to:
  /// **'Riad Fes'**
  String get expenseEntry_riadFes;

  /// No description provided for @expenseEntry_laMamounia.
  ///
  /// In en, this message translates to:
  /// **'La Mamounia'**
  String get expenseEntry_laMamounia;

  /// No description provided for @expenseEntry_traiteurMarocain.
  ///
  /// In en, this message translates to:
  /// **'Traiteur Marocain'**
  String get expenseEntry_traiteurMarocain;

  /// No description provided for @expenseEntry_delicesDuMaroc.
  ///
  /// In en, this message translates to:
  /// **'Délices du Maroc'**
  String get expenseEntry_delicesDuMaroc;

  /// No description provided for @expenseEntry_neggafaFatima.
  ///
  /// In en, this message translates to:
  /// **'Neggafa Fatima'**
  String get expenseEntry_neggafaFatima;

  /// No description provided for @expenseEntry_neggafaKhadija.
  ///
  /// In en, this message translates to:
  /// **'Neggafa Khadija'**
  String get expenseEntry_neggafaKhadija;

  /// No description provided for @expenseEntry_orchestreAndalous.
  ///
  /// In en, this message translates to:
  /// **'Orchestre Andalous'**
  String get expenseEntry_orchestreAndalous;

  /// No description provided for @expenseEntry_groupeChaabi.
  ///
  /// In en, this message translates to:
  /// **'Groupe Chaabi'**
  String get expenseEntry_groupeChaabi;

  /// No description provided for @expenseEntry_studioPhotoMarrakech.
  ///
  /// In en, this message translates to:
  /// **'Studio Photo Marrakech'**
  String get expenseEntry_studioPhotoMarrakech;

  /// No description provided for @expenseEntry_lensAndLight.
  ///
  /// In en, this message translates to:
  /// **'Lens & Light'**
  String get expenseEntry_lensAndLight;

  /// No description provided for @expenseEntry_hennaArtCasablanca.
  ///
  /// In en, this message translates to:
  /// **'Henna Art Casablanca'**
  String get expenseEntry_hennaArtCasablanca;

  /// No description provided for @expenseEntry_traditionalHenna.
  ///
  /// In en, this message translates to:
  /// **'Traditional Henna'**
  String get expenseEntry_traditionalHenna;

  /// No description provided for @expenseEntry_decorMarocain.
  ///
  /// In en, this message translates to:
  /// **'Décor Marocain'**
  String get expenseEntry_decorMarocain;

  /// No description provided for @expenseEntry_fleursEtLumieres.
  ///
  /// In en, this message translates to:
  /// **'Fleurs & Lumières'**
  String get expenseEntry_fleursEtLumieres;

  /// No description provided for @expenseEntry_expenseSavedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Expense saved successfully'**
  String get expenseEntry_expenseSavedSuccessfully;

  /// No description provided for @expenseEntry_discardChanges.
  ///
  /// In en, this message translates to:
  /// **'Discard Changes?'**
  String get expenseEntry_discardChanges;

  /// No description provided for @expenseEntry_youHaveUnsavedChanges.
  ///
  /// In en, this message translates to:
  /// **'You have unsaved changes. Are you sure you want to discard them?'**
  String get expenseEntry_youHaveUnsavedChanges;

  /// No description provided for @expenseEntry_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get expenseEntry_cancel;

  /// No description provided for @expenseEntry_discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get expenseEntry_discard;

  /// No description provided for @expenseEntry_addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get expenseEntry_addExpense;

  /// No description provided for @expenseEntry_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get expenseEntry_done;

  /// No description provided for @expenseEntry_saveExpense.
  ///
  /// In en, this message translates to:
  /// **'Save Expense'**
  String get expenseEntry_saveExpense;

  /// No description provided for @amountInput_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amountInput_amount;

  /// No description provided for @amountInput_mad.
  ///
  /// In en, this message translates to:
  /// **'MAD'**
  String get amountInput_mad;

  /// No description provided for @amountInput_pleaseEnterAnAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter an amount'**
  String get amountInput_pleaseEnterAnAmount;

  /// No description provided for @amountInput_pleaseEnterAValidAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get amountInput_pleaseEnterAValidAmount;

  /// No description provided for @categorySelector_expenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Expense Category'**
  String get categorySelector_expenseCategory;

  /// No description provided for @expenseForm_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get expenseForm_description;

  /// No description provided for @expenseForm_enterExpenseDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter expense description...'**
  String get expenseForm_enterExpenseDescription;

  /// No description provided for @expenseForm_pleaseEnterADescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter a description'**
  String get expenseForm_pleaseEnterADescription;

  /// No description provided for @expenseForm_date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get expenseForm_date;

  /// No description provided for @expenseForm_vendor.
  ///
  /// In en, this message translates to:
  /// **'Vendor'**
  String get expenseForm_vendor;

  /// No description provided for @expenseForm_selectVendorOptional.
  ///
  /// In en, this message translates to:
  /// **'Select vendor (optional)'**
  String get expenseForm_selectVendorOptional;

  /// No description provided for @paymentMethod_paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod_paymentMethod;

  /// No description provided for @paymentMethod_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentMethod_cash;

  /// No description provided for @paymentMethod_payWithCash.
  ///
  /// In en, this message translates to:
  /// **'Pay with cash'**
  String get paymentMethod_payWithCash;

  /// No description provided for @paymentMethod_bankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get paymentMethod_bankTransfer;

  /// No description provided for @paymentMethod_transferFromBankAccount.
  ///
  /// In en, this message translates to:
  /// **'Transfer from bank account'**
  String get paymentMethod_transferFromBankAccount;

  /// No description provided for @paymentMethod_installment.
  ///
  /// In en, this message translates to:
  /// **'Installment'**
  String get paymentMethod_installment;

  /// No description provided for @paymentMethod_payInMultipleInstallments.
  ///
  /// In en, this message translates to:
  /// **'Pay in multiple installments'**
  String get paymentMethod_payInMultipleInstallments;

  /// No description provided for @receiptCapture_failedToCaptureImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to capture image. Please try again.'**
  String get receiptCapture_failedToCaptureImage;

  /// No description provided for @receiptCapture_takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get receiptCapture_takePhoto;

  /// No description provided for @receiptCapture_chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get receiptCapture_chooseFromGallery;

  /// No description provided for @receiptCapture_receiptPhotoOptional.
  ///
  /// In en, this message translates to:
  /// **'Receipt Photo (Optional)'**
  String get receiptCapture_receiptPhotoOptional;

  /// No description provided for @receiptCapture_addReceiptPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Receipt Photo'**
  String get receiptCapture_addReceiptPhoto;

  /// No description provided for @budgetOverview_budgetOverview.
  ///
  /// In en, this message translates to:
  /// **'Budget Overview'**
  String get budgetOverview_budgetOverview;

  /// No description provided for @budgetOverview_switchToBarChart.
  ///
  /// In en, this message translates to:
  /// **'Switch to Bar Chart'**
  String get budgetOverview_switchToBarChart;

  /// No description provided for @budgetOverview_switchToPieChart.
  ///
  /// In en, this message translates to:
  /// **'Switch to Pie Chart'**
  String get budgetOverview_switchToPieChart;

  /// No description provided for @budgetOverview_expenseCategories.
  ///
  /// In en, this message translates to:
  /// **'Expense Categories'**
  String get budgetOverview_expenseCategories;

  /// No description provided for @budgetOverview_recentExpenses.
  ///
  /// In en, this message translates to:
  /// **'Recent Expenses'**
  String get budgetOverview_recentExpenses;

  /// No description provided for @budgetOverview_viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get budgetOverview_viewAll;

  /// No description provided for @budgetOverview_expenseDeleted.
  ///
  /// In en, this message translates to:
  /// **'Expense deleted'**
  String get budgetOverview_expenseDeleted;

  /// No description provided for @budgetOverview_undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get budgetOverview_undo;

  /// No description provided for @budgetOverview_addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get budgetOverview_addExpense;

  /// No description provided for @budgetOverview_budgetDataRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Budget data refreshed'**
  String get budgetOverview_budgetDataRefreshed;

  /// No description provided for @budgetOverview_venue.
  ///
  /// In en, this message translates to:
  /// **'Venue'**
  String get budgetOverview_venue;

  /// No description provided for @budgetOverview_catering.
  ///
  /// In en, this message translates to:
  /// **'Catering'**
  String get budgetOverview_catering;

  /// No description provided for @budgetOverview_neggafa.
  ///
  /// In en, this message translates to:
  /// **'Neggafa'**
  String get budgetOverview_neggafa;

  /// No description provided for @budgetOverview_band.
  ///
  /// In en, this message translates to:
  /// **'Band'**
  String get budgetOverview_band;

  /// No description provided for @budgetOverview_photographer.
  ///
  /// In en, this message translates to:
  /// **'Photographer'**
  String get budgetOverview_photographer;

  /// No description provided for @budgetOverview_decor.
  ///
  /// In en, this message translates to:
  /// **'Decor'**
  String get budgetOverview_decor;

  /// No description provided for @budgetOverview_riadFesFullVenueBooking.
  ///
  /// In en, this message translates to:
  /// **'Riad Fes - Full venue booking'**
  String get budgetOverview_riadFesFullVenueBooking;

  /// No description provided for @budgetOverview_traditionalMoroccanMenu200Guests.
  ///
  /// In en, this message translates to:
  /// **'Traditional Moroccan menu - 200 guests'**
  String get budgetOverview_traditionalMoroccanMenu200Guests;

  /// No description provided for @budgetOverview_neggafaServices5OutfitChanges.
  ///
  /// In en, this message translates to:
  /// **'Neggafa services - 5 outfit changes'**
  String get budgetOverview_neggafaServices5OutfitChanges;

  /// No description provided for @budgetOverview_depositForChaabiBand.
  ///
  /// In en, this message translates to:
  /// **'Deposit for Chaabi band'**
  String get budgetOverview_depositForChaabiBand;

  /// No description provided for @budgetOverview_bookingDepositPhotoAndVideo.
  ///
  /// In en, this message translates to:
  /// **'Booking deposit - Photo & Video'**
  String get budgetOverview_bookingDepositPhotoAndVideo;

  /// No description provided for @addExpenseBottomSheet_addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get addExpenseBottomSheet_addExpense;

  /// No description provided for @addExpenseBottomSheet_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get addExpenseBottomSheet_category;

  /// No description provided for @addExpenseBottomSheet_amountMAD.
  ///
  /// In en, this message translates to:
  /// **'Amount (MAD)'**
  String get addExpenseBottomSheet_amountMAD;

  /// No description provided for @addExpenseBottomSheet_enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get addExpenseBottomSheet_enterAmount;

  /// No description provided for @addExpenseBottomSheet_mad.
  ///
  /// In en, this message translates to:
  /// **'MAD'**
  String get addExpenseBottomSheet_mad;

  /// No description provided for @addExpenseBottomSheet_pleaseEnterAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount'**
  String get addExpenseBottomSheet_pleaseEnterAmount;

  /// No description provided for @addExpenseBottomSheet_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get addExpenseBottomSheet_description;

  /// No description provided for @addExpenseBottomSheet_enterDescription.
  ///
  /// In en, this message translates to:
  /// **'Enter description'**
  String get addExpenseBottomSheet_enterDescription;

  /// No description provided for @addExpenseBottomSheet_pleaseEnterDescription.
  ///
  /// In en, this message translates to:
  /// **'Please enter description'**
  String get addExpenseBottomSheet_pleaseEnterDescription;

  /// No description provided for @addExpenseBottomSheet_receiptPhotoOptional.
  ///
  /// In en, this message translates to:
  /// **'Receipt Photo (Optional)'**
  String get addExpenseBottomSheet_receiptPhotoOptional;

  /// No description provided for @addExpenseBottomSheet_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get addExpenseBottomSheet_camera;

  /// No description provided for @addExpenseBottomSheet_gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get addExpenseBottomSheet_gallery;

  /// No description provided for @addExpenseBottomSheet_receiptPhotoPreview.
  ///
  /// In en, this message translates to:
  /// **'Receipt photo preview'**
  String get addExpenseBottomSheet_receiptPhotoPreview;

  /// No description provided for @addExpenseBottomSheet_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get addExpenseBottomSheet_cancel;

  /// No description provided for @addExpenseBottomSheet_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get addExpenseBottomSheet_save;

  /// No description provided for @addExpenseBottomSheet_failedToCapturePhoto.
  ///
  /// In en, this message translates to:
  /// **'Failed to capture photo'**
  String get addExpenseBottomSheet_failedToCapturePhoto;

  /// No description provided for @addExpenseBottomSheet_failedToSelectPhoto.
  ///
  /// In en, this message translates to:
  /// **'Failed to select photo'**
  String get addExpenseBottomSheet_failedToSelectPhoto;

  /// No description provided for @addExpenseBottomSheet_pleaseSelectACategory.
  ///
  /// In en, this message translates to:
  /// **'Please select a category'**
  String get addExpenseBottomSheet_pleaseSelectACategory;

  /// No description provided for @addExpenseBottomSheet_receiptPhotoFor.
  ///
  /// In en, this message translates to:
  /// **'Receipt photo for {description}'**
  String addExpenseBottomSheet_receiptPhotoFor(Object description);

  /// No description provided for @addExpenseBottomSheet_expenseAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Expense added successfully'**
  String get addExpenseBottomSheet_expenseAddedSuccessfully;

  /// No description provided for @budgetSummaryCard_totalBudget.
  ///
  /// In en, this message translates to:
  /// **'Total Budget'**
  String get budgetSummaryCard_totalBudget;

  /// No description provided for @budgetSummaryCard_mad.
  ///
  /// In en, this message translates to:
  /// **'MAD'**
  String get budgetSummaryCard_mad;

  /// No description provided for @budgetSummaryCard_spent.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get budgetSummaryCard_spent;

  /// No description provided for @budgetSummaryCard_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get budgetSummaryCard_total;

  /// No description provided for @budgetSummaryCard_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get budgetSummaryCard_remaining;

  /// No description provided for @budgetSummaryCard_budgetDistributionPieChart.
  ///
  /// In en, this message translates to:
  /// **'Budget Distribution Pie Chart'**
  String get budgetSummaryCard_budgetDistributionPieChart;

  /// No description provided for @budgetSummaryCard_budgetDistributionBarChart.
  ///
  /// In en, this message translates to:
  /// **'Budget Distribution Bar Chart'**
  String get budgetSummaryCard_budgetDistributionBarChart;

  /// No description provided for @categoryDetailBottomSheet_allocated.
  ///
  /// In en, this message translates to:
  /// **'Allocated'**
  String get categoryDetailBottomSheet_allocated;

  /// No description provided for @categoryDetailBottomSheet_spent.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get categoryDetailBottomSheet_spent;

  /// No description provided for @categoryDetailBottomSheet_remaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get categoryDetailBottomSheet_remaining;

  /// No description provided for @categoryDetailBottomSheet_expenseHistory.
  ///
  /// In en, this message translates to:
  /// **'Expense History'**
  String get categoryDetailBottomSheet_expenseHistory;

  /// No description provided for @categoryDetailBottomSheet_items.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String categoryDetailBottomSheet_items(Object count);

  /// No description provided for @categoryDetailBottomSheet_noExpensesYet.
  ///
  /// In en, this message translates to:
  /// **'No expenses yet'**
  String get categoryDetailBottomSheet_noExpensesYet;

  /// No description provided for @categoryDetailBottomSheet_mad.
  ///
  /// In en, this message translates to:
  /// **'MAD'**
  String get categoryDetailBottomSheet_mad;

  /// No description provided for @categoryDetailBottomSheet_receiptImageForExpense.
  ///
  /// In en, this message translates to:
  /// **'Receipt image for expense'**
  String get categoryDetailBottomSheet_receiptImageForExpense;

  /// No description provided for @expenseCategoryCard_allocated.
  ///
  /// In en, this message translates to:
  /// **'Allocated'**
  String get expenseCategoryCard_allocated;

  /// No description provided for @expenseCategoryCard_mad.
  ///
  /// In en, this message translates to:
  /// **'MAD'**
  String get expenseCategoryCard_mad;

  /// No description provided for @expenseCategoryCard_spent.
  ///
  /// In en, this message translates to:
  /// **'Spent'**
  String get expenseCategoryCard_spent;

  /// No description provided for @expenseCategoryCard_left.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get expenseCategoryCard_left;

  /// No description provided for @recentExpenseItem_receiptImageForExpense.
  ///
  /// In en, this message translates to:
  /// **'Receipt image for {category} expense'**
  String recentExpenseItem_receiptImageForExpense(Object category);

  /// No description provided for @recentExpenseItem_mad.
  ///
  /// In en, this message translates to:
  /// **'MAD'**
  String get recentExpenseItem_mad;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
