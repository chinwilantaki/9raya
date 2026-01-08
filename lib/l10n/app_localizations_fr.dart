// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Organisateur de Mariage Marocain';

  @override
  String get splash_moroccanWedding => 'Mariage Marocain';

  @override
  String get splash_planner => 'Planificateur';

  @override
  String get splash_yourPerfectCelebrationAwaits =>
      'Votre Célébration Parfaite Vous Attend';

  @override
  String get weddingDashboard_mainWedding => 'Mariage Principal';

  @override
  String get weddingDashboard_khitba => 'Khitba';

  @override
  String get weddingDashboard_henna => 'Henné';

  @override
  String get weddingDashboard_hammam => 'Hammam';

  @override
  String get weddingDashboard_draga => 'Draga';

  @override
  String get weddingDashboard_guest => 'Invité';

  @override
  String get weddingDashboard_added5NewGuestsToBrideFamily =>
      '5 nouveaux invités ajoutés à la famille de la mariée';

  @override
  String get weddingDashboard_budget => 'Budget';

  @override
  String get weddingDashboard_loggedExpenseVenueDeposit15000MAD =>
      'Dépense enregistrée : Acompte pour le lieu - 15 000 MAD';

  @override
  String get weddingDashboard_vendor => 'Fournisseur';

  @override
  String get weddingDashboard_confirmedPhotographerBooking =>
      'Réservation du photographe confirmée';

  @override
  String get weddingDashboard_tradition => 'Tradition';

  @override
  String get weddingDashboard_completedBookNeggafaService =>
      'Terminé : Réserver le service Neggafa';

  @override
  String get weddingDashboard_dataSyncedSuccessfully =>
      'Données synchronisées avec succès';

  @override
  String get weddingDashboard_weddingPlanner => 'Organisateur de mariage';

  @override
  String get weddingDashboard_dashboard => 'Tableau de bord';

  @override
  String get weddingDashboard_timeline => 'Chronologie';

  @override
  String get weddingDashboard_guests => 'Invités';

  @override
  String get weddingDashboard_vendors => 'Fournisseurs';

  @override
  String weddingDashboard_tabNameComingSoon(Object tabName) {
    return '$tabName Bientôt disponible';
  }

  @override
  String get weddingDashboard_thisFeatureIsUnderDevelopment =>
      'Cette fonctionnalité est en cours de développement';

  @override
  String get weddingDashboard_quickAdd => 'Ajout rapide';

  @override
  String get weddingDashboard_quickActions => 'Actions rapides';

  @override
  String get weddingDashboard_addGuest => 'Ajouter un invité';

  @override
  String get weddingDashboard_logExpense => 'Enregistrer une dépense';

  @override
  String get weddingDashboard_checkTradition => 'Vérifier la tradition';

  @override
  String get greetingHeader_yourDreamWeddingAwaits =>
      'Le mariage de vos rêves vous attend';

  @override
  String get countdownTimer_timeUntilYourBigDay =>
      'Temps jusqu\'à votre grand jour';

  @override
  String get countdownTimer_days => 'Jours';

  @override
  String get countdownTimer_hours => 'Heures';

  @override
  String get countdownTimer_minutes => 'Minutes';

  @override
  String get progressOverview_planningProgress =>
      'Progression de la planification';

  @override
  String get progressOverview_guests => 'Invités';

  @override
  String get progressOverview_budget => 'Budget';

  @override
  String get progressOverview_vendors => 'Fournisseurs';

  @override
  String get progressOverview_traditions => 'Traditions';

  @override
  String progressOverview_categoryProgress(Object category) {
    return 'Progression de la catégorie $category';
  }

  @override
  String progressOverview_completionPercentage(Object percentage) {
    return 'Achèvement : $percentage%';
  }

  @override
  String get progressOverview_detailedBreakdownComingSoon =>
      'Répartition détaillée bientôt disponible';

  @override
  String get progressOverview_close => 'Fermer';

  @override
  String get quickActionCards_quickActions => 'Actions rapides';

  @override
  String get quickActionCards_addGuest => 'Ajouter un invité';

  @override
  String get quickActionCards_addNewGuestsToYourWeddingList =>
      'Ajoutez de nouveaux invités à votre liste de mariage';

  @override
  String get quickActionCards_logExpense => 'Enregistrer une dépense';

  @override
  String get quickActionCards_trackYourWeddingExpenses =>
      'Suivez les dépenses de votre mariage';

  @override
  String get quickActionCards_checkTradition => 'Vérifier la tradition';

  @override
  String get quickActionCards_reviewMoroccanWeddingTraditions =>
      'Passez en revue les traditions de mariage marocaines';

  @override
  String get quickActionCards_go => 'Aller';

  @override
  String recentActivityFeed_dago(Object count) {
    return 'Il y a ${count}j';
  }

  @override
  String recentActivityFeed_hago(Object count) {
    return 'Il y a ${count}h';
  }

  @override
  String recentActivityFeed_mago(Object count) {
    return 'Il y a ${count}m';
  }

  @override
  String get recentActivityFeed_justNow => 'À l\'instant';

  @override
  String get recentActivityFeed_guest => 'invité';

  @override
  String get recentActivityFeed_budget => 'budget';

  @override
  String get recentActivityFeed_vendor => 'fournisseur';

  @override
  String get recentActivityFeed_tradition => 'tradition';

  @override
  String get recentActivityFeed_recentActivity => 'Activité récente';

  @override
  String get guestListManagement_guestList => 'Liste des invités';

  @override
  String get guestListManagement_filter => 'Filtrer';

  @override
  String get guestListManagement_cancel => 'Annuler';

  @override
  String get guestListManagement_filtersActive => 'Filtres actifs';

  @override
  String get guestListManagement_clear => 'Effacer';

  @override
  String guestListManagement_selected(Object count) {
    return '$count sélectionnés';
  }

  @override
  String get guestListManagement_sendInvites => 'Envoyer les invitations';

  @override
  String get guestListManagement_noGuestsFound => 'Aucun invité trouvé';

  @override
  String get guestListManagement_noGuestsYet => 'Aucun invité pour le moment';

  @override
  String get guestListManagement_tryAdjustingYourSearchOrFilters =>
      'Essayez d\'ajuster votre recherche ou vos filtres';

  @override
  String get guestListManagement_startAddingGuestsToYourWedding =>
      'Commencez à ajouter des invités à votre mariage';

  @override
  String get guestListManagement_guestAddedSuccessfully =>
      'Invité ajouté avec succès';

  @override
  String get guestListManagement_phone => 'Téléphone';

  @override
  String get guestListManagement_email => 'E-mail';

  @override
  String get guestListManagement_familySide => 'Côté famille';

  @override
  String get guestListManagement_brideFamily => 'Famille de la mariée';

  @override
  String get guestListManagement_groomFamily => 'Famille du marié';

  @override
  String get guestListManagement_plusOne => 'Plus un';

  @override
  String get guestListManagement_allowed => 'Autorisé';

  @override
  String guestListManagement_invitationSentTo(Object guestName) {
    return 'Invitation envoyée à $guestName';
  }

  @override
  String guestListManagement_markedAsConfirmed(Object guestName) {
    return '$guestName marqué comme confirmé';
  }

  @override
  String guestListManagement_seatingAssignmentFor(Object guestName) {
    return 'Attribution des places pour $guestName';
  }

  @override
  String guestListManagement_edit(Object guestName) {
    return 'Modifier $guestName';
  }

  @override
  String get guestListManagement_removeGuest => 'Supprimer l\'invité';

  @override
  String guestListManagement_areYouSureYouWantToRemove(Object guestName) {
    return 'Êtes-vous sûr de vouloir supprimer $guestName ?';
  }

  @override
  String guestListManagement_removed(Object guestName) {
    return '$guestName supprimé';
  }

  @override
  String get guestListManagement_remove => 'Supprimer';

  @override
  String guestListManagement_invitationsSentTo(Object count) {
    return 'Invitations envoyées à $count invités';
  }

  @override
  String get guestListManagement_sister => 'Sœur';

  @override
  String get guestListManagement_brother => 'Frère';

  @override
  String get guestListManagement_closeFriend => 'Ami proche';

  @override
  String get guestListManagement_cousin => 'Cousin';

  @override
  String get guestListManagement_aunt => 'Tante';

  @override
  String get guestListManagement_uncle => 'Oncle';

  @override
  String get guestListManagement_colleague => 'Collègue';

  @override
  String get guestListManagement_youngWomanWithLongDarkHair =>
      'Jeune femme aux longs cheveux noirs portant un caftan marocain traditionnel vert émeraude';

  @override
  String get guestListManagement_middleAgedManWithShortBlackHair =>
      'Homme d\'âge mûr aux cheveux noirs courts et à la barbe portant une djellaba blanche traditionnelle';

  @override
  String get guestListManagement_youngWomanWithCurlyDarkHair =>
      'Jeune femme aux cheveux noirs bouclés portant des bijoux en or et un maquillage marocain traditionnel';

  @override
  String get guestListManagement_youngManWithShortDarkHair =>
      'Jeune homme aux cheveux noirs courts portant un costume moderne avec une broderie marocaine traditionnelle';

  @override
  String get guestListManagement_olderWomanWithGrayStreakedHair =>
      'Femme plus âgée aux cheveux grisonnants portant une élégante takchita marocaine traditionnelle';

  @override
  String get guestListManagement_middleAgedManWithGrayingBeard =>
      'Homme d\'âge mûr à la barbe grisonnante portant une djellaba marron traditionnelle et un fez rouge';

  @override
  String get guestListManagement_professionalWomanWithShoulderLength =>
      'Femme professionnelle aux cheveux noirs mi-longs portant une tenue de ville moderne';

  @override
  String get guestListManagement_youngManWithStyledDarkHair =>
      'Jeune homme aux cheveux noirs coiffés portant un costume bleu marine avec une cravate dorée';

  @override
  String get addGuestDialog_addGuest => 'Ajouter un invité';

  @override
  String get addGuestDialog_fullName => 'Nom complet *';

  @override
  String get addGuestDialog_enterGuestName => 'Entrez le nom de l\'invité';

  @override
  String get addGuestDialog_pleaseEnterGuestName =>
      'Veuillez entrer le nom de l\'invité';

  @override
  String get addGuestDialog_phoneNumber => 'Numéro de téléphone';

  @override
  String get addGuestDialog_enterPhoneNumber => 'Entrez le numéro de téléphone';

  @override
  String get addGuestDialog_emailAddress => 'Adresse e-mail';

  @override
  String get addGuestDialog_enterEmailAddress => 'Entrez l\'adresse e-mail';

  @override
  String get addGuestDialog_familySide => 'Côté famille *';

  @override
  String get addGuestDialog_brideFamily => 'Famille de la mariée';

  @override
  String get addGuestDialog_groomFamily => 'Famille du marié';

  @override
  String get addGuestDialog_relationship => 'Relation *';

  @override
  String get addGuestDialog_familyMember => 'Membre de la famille';

  @override
  String get addGuestDialog_closeFriend => 'Ami proche';

  @override
  String get addGuestDialog_colleague => 'Collègue';

  @override
  String get addGuestDialog_neighbor => 'Voisin';

  @override
  String get addGuestDialog_extendedFamily => 'Famille élargie';

  @override
  String get addGuestDialog_other => 'Autre';

  @override
  String get addGuestDialog_allowPlusOneGuest => 'Autoriser +1 invité';

  @override
  String get addGuestDialog_cancel => 'Annuler';

  @override
  String get addGuestDialog_defaultGuestProfilePhoto =>
      'Photo de profil de l\'invité par défaut';

  @override
  String get familySegment_brideFamily => 'Famille de la mariée';

  @override
  String get familySegment_groomFamily => 'Famille du marié';

  @override
  String get familySegment_allGuests => 'Tous les invités';

  @override
  String get filterBottomSheet_filterGuests => 'Filtrer les invités';

  @override
  String get filterBottomSheet_clearAll => 'Tout effacer';

  @override
  String get filterBottomSheet_invitationStatus => 'Statut de l\'invitation';

  @override
  String get filterBottomSheet_invited => 'Invité';

  @override
  String get filterBottomSheet_confirmed => 'Confirmé';

  @override
  String get filterBottomSheet_notComing => 'Ne vient pas';

  @override
  String get filterBottomSheet_pending => 'En attente';

  @override
  String get filterBottomSheet_familySide => 'Côté famille';

  @override
  String get filterBottomSheet_brideFamily => 'Famille de la mariée';

  @override
  String get filterBottomSheet_groomFamily => 'Famille du marié';

  @override
  String get filterBottomSheet_attendance => 'Présence';

  @override
  String get filterBottomSheet_attending => 'Présent';

  @override
  String get filterBottomSheet_notAttending => 'Non présent';

  @override
  String get filterBottomSheet_maybe => 'Peut-être';

  @override
  String get filterBottomSheet_applyFilters => 'Appliquer les filtres';

  @override
  String get guestCard_confirmed => 'Confirmé';

  @override
  String get guestCard_invited => 'Invité';

  @override
  String get guestCard_notComing => 'Ne vient pas';

  @override
  String get guestCard_pending => 'En attente';

  @override
  String get guestCard_send => 'Envoyer';

  @override
  String get guestCard_confirm => 'Confirmer';

  @override
  String get guestCard_seating => 'Placement';

  @override
  String get guestCard_edit => 'Modifier';

  @override
  String get guestCard_remove => 'Supprimer';

  @override
  String get guestCard_plusOneGuest => '+1 invité';

  @override
  String get searchBar_searchGuests => 'Rechercher des invités...';

  @override
  String get traditionsChecklist_preWeddingRituals => 'Rituels pré-mariage';

  @override
  String get traditionsChecklist_khitbaEngagement => 'Khitba (Fiançailles)';

  @override
  String get traditionsChecklist_traditionalEngagementCeremony =>
      'Cérémonie de fiançailles traditionnelle où les familles acceptent officiellement le mariage. Comprend un échange de cadeaux et de sucreries.';

  @override
  String get traditionsChecklist_threeToSixMonthsBeforeWedding =>
      '3-6 mois avant le mariage';

  @override
  String get traditionsChecklist_caterer => 'Traiteur';

  @override
  String get traditionsChecklist_photographer => 'Photographe';

  @override
  String get traditionsChecklist_hennaCeremonyPreparation =>
      'Préparation de la cérémonie du henné';

  @override
  String get traditionsChecklist_sacredPreWeddingRitual =>
      'Rituel sacré avant le mariage où la mariée reçoit des dessins complexes au henné. Symbolise la beauté, la joie et la protection.';

  @override
  String get traditionsChecklist_oneToTwoDaysBeforeWedding =>
      '1-2 jours avant le mariage';

  @override
  String get traditionsChecklist_hennaArtist => 'Artiste du henné';

  @override
  String get traditionsChecklist_neggafa => 'Neggafa';

  @override
  String get traditionsChecklist_traditionalHammam => 'Hammam traditionnel';

  @override
  String get traditionsChecklist_purificationRitual =>
      'Rituel de purification au bain public traditionnel avec la famille et les amis. Comprend un gommage corporel et des soins de beauté.';

  @override
  String get traditionsChecklist_oneWeekBeforeWedding =>
      '1 semaine avant le mariage';

  @override
  String get traditionsChecklist_hammam => 'Hammam';

  @override
  String get traditionsChecklist_beautySpecialist => 'Spécialiste de la beauté';

  @override
  String get traditionsChecklist_neggafaSelection => 'Sélection de la Neggafa';

  @override
  String get traditionsChecklist_choosingTheTraditionalWeddingCoordinator =>
      'Choisir le coordinateur de mariage traditionnel qui gère les changements de robe et les cérémonies tout au long du jour du mariage.';

  @override
  String get traditionsChecklist_twoToThreeMonthsBeforeWedding =>
      '2-3 mois avant le mariage';

  @override
  String get traditionsChecklist_traditionalDressFittings =>
      'Essayages de robes traditionnelles';

  @override
  String get traditionsChecklist_multipleFittingsForThe7Traditional =>
      'Plusieurs essayages pour les 7 robes de mariée marocaines traditionnelles (caftans) représentant différentes régions.';

  @override
  String get traditionsChecklist_oneToTwoMonthsBeforeWedding =>
      '1-2 mois avant le mariage';

  @override
  String get traditionsChecklist_dressDesigner => 'Créateur de robes';

  @override
  String get traditionsChecklist_weddingDayCustoms =>
      'Coutumes du jour du mariage';

  @override
  String get traditionsChecklist_neggafaPreparation =>
      'Préparation avec la Neggafa';

  @override
  String get traditionsChecklist_neggafaHelpsBridePrepare =>
      'La Neggafa aide la mariée à se préparer et gère les changements de robe de cérémonie tout au long de la journée.';

  @override
  String get traditionsChecklist_morningOfWedding => 'Matin du mariage';

  @override
  String get traditionsChecklist_makeupArtist => 'Maquilleur';

  @override
  String get traditionsChecklist_nikahMarriageContract =>
      'Nikah (Contrat de mariage)';

  @override
  String get traditionsChecklist_islamicMarriageContractSigning =>
      'Cérémonie de signature du contrat de mariage islamique avec des témoins et un officiant religieux.';

  @override
  String get traditionsChecklist_afternoon => 'Après-midi';

  @override
  String get traditionsChecklist_religiousOfficiant => 'Officiant religieux';

  @override
  String get traditionsChecklist_zaffaProcession => 'Procession de la Zaffa';

  @override
  String get traditionsChecklist_grandEntranceProcession =>
      'Grande procession d\'entrée avec musique traditionnelle, danseurs et célébration à l\'arrivée du couple à la réception.';

  @override
  String get traditionsChecklist_eveningEntrance => 'Entrée du soir';

  @override
  String get traditionsChecklist_band => 'Groupe de musique';

  @override
  String get traditionsChecklist_dancers => 'Danseurs';

  @override
  String get traditionsChecklist_amariyaThrone => 'Trône de l\'Amariya';

  @override
  String get traditionsChecklist_brideAndGroomCarriedOnOrnate =>
      'La mariée et le marié sont portés sur une plate-forme ornée ressemblant à un trône par des membres de la famille lors d\'une procession de cérémonie.';

  @override
  String get traditionsChecklist_duringReception => 'Pendant la réception';

  @override
  String get traditionsChecklist_amariyaRental => 'Location d\'Amariya';

  @override
  String get traditionsChecklist_decorators => 'Décorateurs';

  @override
  String get traditionsChecklist_sevenTraditionalDresses =>
      'Sept robes traditionnelles';

  @override
  String get traditionsChecklist_brideChangesInto7Different =>
      'La mariée se change en 7 caftans traditionnels différents représentant diverses régions du Maroc tout au long de la célébration.';

  @override
  String get traditionsChecklist_throughoutEvening =>
      'Tout au long de la soirée';

  @override
  String get traditionsChecklist_postWeddingTraditions =>
      'Traditions d\'après-mariage';

  @override
  String get traditionsChecklist_sabahMorningAfter =>
      'Sabah (le lendemain matin)';

  @override
  String get traditionsChecklist_dayAfterCelebration =>
      'Célébration le lendemain avec la famille proche et les amis, avec un petit-déjeuner traditionnel et un échange de cadeaux.';

  @override
  String get traditionsChecklist_dayAfterWedding => 'Le lendemain du mariage';

  @override
  String get traditionsChecklist_familyVisits => 'Visites familiales';

  @override
  String get traditionsChecklist_newlywedsVisitBothFamilies =>
      'Les jeunes mariés rendent visite aux deux familles pour recevoir des bénédictions et des cadeaux dans les semaines qui suivent le mariage.';

  @override
  String get traditionsChecklist_oneToTwoWeeksAfterWedding =>
      '1-2 semaines après le mariage';

  @override
  String get traditionsChecklist_thankYouGifts => 'Cadeaux de remerciement';

  @override
  String get traditionsChecklist_distributionOfThankYouGifts =>
      'Distribution de cadeaux de remerciement aux invités et aux membres de la famille qui ont contribué à la célébration du mariage.';

  @override
  String get traditionsChecklist_twoToFourWeeksAfterWedding =>
      '2-4 semaines après le mariage';

  @override
  String get traditionsChecklist_taskMarkedAsCompleted =>
      'Tâche marquée comme terminée';

  @override
  String get traditionsChecklist_undo => 'Annuler';

  @override
  String get traditionsChecklist_culturalContext => 'Contexte culturel';

  @override
  String get traditionsChecklist_recommendedTiming => 'Calendrier recommandé';

  @override
  String get traditionsChecklist_relatedVendors => 'Fournisseurs associés';

  @override
  String get traditionsChecklist_close => 'Fermer';

  @override
  String get traditionsChecklist_traditionsChecklist =>
      'Liste de contrôle des traditions';

  @override
  String get traditionsChecklist_searchTraditions =>
      'Rechercher des traditions';

  @override
  String get traditionsChecklist_sharingChecklistWithFamily =>
      'Partage de la liste de contrôle avec la famille...';

  @override
  String get traditionsChecklist_shareChecklist =>
      'Partager la liste de contrôle';

  @override
  String get traditionsChecklist_checklistSyncedSuccessfully =>
      'Liste de contrôle synchronisée avec succès';

  @override
  String get traditionsChecklist_overallProgress => 'Progression globale';

  @override
  String get traditionsChecklist_customFamilyTraditions =>
      'Traditions familiales personnalisées';

  @override
  String get traditionsChecklist_addCustom => 'Ajouter une personnalisation';

  @override
  String get addCustomTraditionDialog_addCustomTradition =>
      'Ajouter une tradition personnalisée';

  @override
  String get addCustomTraditionDialog_traditionName => 'Nom de la tradition';

  @override
  String get addCustomTraditionDialog_enterTraditionName =>
      'Entrez le nom de la tradition';

  @override
  String get addCustomTraditionDialog_pleaseEnterATraditionName =>
      'Veuillez entrer un nom de tradition';

  @override
  String get addCustomTraditionDialog_description => 'Description';

  @override
  String get addCustomTraditionDialog_enterTraditionDescription =>
      'Entrez la description de la tradition';

  @override
  String get addCustomTraditionDialog_pleaseEnterADescription =>
      'Veuillez entrer une description';

  @override
  String get addCustomTraditionDialog_cancel => 'Annuler';

  @override
  String get addCustomTraditionDialog_add => 'Ajouter';

  @override
  String get expenseEntry_venue => 'Lieu';

  @override
  String get expenseEntry_catering => 'Traiteur';

  @override
  String get expenseEntry_neggafa => 'Neggafa';

  @override
  String get expenseEntry_traditionalBand => 'Groupe de musique traditionnel';

  @override
  String get expenseEntry_photographer => 'Photographe';

  @override
  String get expenseEntry_hennaArtist => 'Artiste du henné';

  @override
  String get expenseEntry_decoration => 'Décoration';

  @override
  String get expenseEntry_palaisDesCongres => 'Palais des Congrès';

  @override
  String get expenseEntry_riadFes => 'Riad Fès';

  @override
  String get expenseEntry_laMamounia => 'La Mamounia';

  @override
  String get expenseEntry_traiteurMarocain => 'Traiteur Marocain';

  @override
  String get expenseEntry_delicesDuMaroc => 'Délices du Maroc';

  @override
  String get expenseEntry_neggafaFatima => 'Neggafa Fatima';

  @override
  String get expenseEntry_neggafaKhadija => 'Neggafa Khadija';

  @override
  String get expenseEntry_orchestreAndalous => 'Orchestre Andalous';

  @override
  String get expenseEntry_groupeChaabi => 'Groupe Chaabi';

  @override
  String get expenseEntry_studioPhotoMarrakech => 'Studio Photo Marrakech';

  @override
  String get expenseEntry_lensAndLight => 'Lens & Light';

  @override
  String get expenseEntry_hennaArtCasablanca => 'Henna Art Casablanca';

  @override
  String get expenseEntry_traditionalHenna => 'Henné traditionnel';

  @override
  String get expenseEntry_decorMarocain => 'Décor Marocain';

  @override
  String get expenseEntry_fleursEtLumieres => 'Fleurs & Lumières';

  @override
  String get expenseEntry_expenseSavedSuccessfully =>
      'Dépense enregistrée avec succès';

  @override
  String get expenseEntry_discardChanges => 'Annuler les modifications ?';

  @override
  String get expenseEntry_youHaveUnsavedChanges =>
      'Vous avez des modifications non enregistrées. Êtes-vous sûr de vouloir les annuler ?';

  @override
  String get expenseEntry_cancel => 'Annuler';

  @override
  String get expenseEntry_discard => 'Annuler';

  @override
  String get expenseEntry_addExpense => 'Ajouter une dépense';

  @override
  String get expenseEntry_done => 'Terminé';

  @override
  String get expenseEntry_saveExpense => 'Enregistrer la dépense';

  @override
  String get amountInput_amount => 'Montant';

  @override
  String get amountInput_mad => 'MAD';

  @override
  String get amountInput_pleaseEnterAnAmount => 'Veuillez entrer un montant';

  @override
  String get amountInput_pleaseEnterAValidAmount =>
      'Veuillez entrer un montant valide';

  @override
  String get categorySelector_expenseCategory => 'Catégorie de dépenses';

  @override
  String get expenseForm_description => 'Description';

  @override
  String get expenseForm_enterExpenseDescription =>
      'Entrez la description de la dépense...';

  @override
  String get expenseForm_pleaseEnterADescription =>
      'Veuillez entrer une description';

  @override
  String get expenseForm_date => 'Date';

  @override
  String get expenseForm_vendor => 'Fournisseur';

  @override
  String get expenseForm_selectVendorOptional =>
      'Sélectionnez un fournisseur (facultatif)';

  @override
  String get paymentMethod_paymentMethod => 'Mode de paiement';

  @override
  String get paymentMethod_cash => 'Espèces';

  @override
  String get paymentMethod_payWithCash => 'Payer en espèces';

  @override
  String get paymentMethod_bankTransfer => 'Virement bancaire';

  @override
  String get paymentMethod_transferFromBankAccount =>
      'Virement depuis un compte bancaire';

  @override
  String get paymentMethod_installment => 'Versement';

  @override
  String get paymentMethod_payInMultipleInstallments =>
      'Payer en plusieurs versements';

  @override
  String get receiptCapture_failedToCaptureImage =>
      'Échec de la capture de l\'image. Veuillez réessayer.';

  @override
  String get receiptCapture_takePhoto => 'Prendre une photo';

  @override
  String get receiptCapture_chooseFromGallery => 'Choisir dans la galerie';

  @override
  String get receiptCapture_receiptPhotoOptional =>
      'Photo du reçu (facultatif)';

  @override
  String get receiptCapture_addReceiptPhoto => 'Ajouter une photo du reçu';

  @override
  String get budgetOverview_budgetOverview => 'Aperçu du budget';

  @override
  String get budgetOverview_switchToBarChart => 'Passer au diagramme à barres';

  @override
  String get budgetOverview_switchToPieChart =>
      'Passer au diagramme circulaire';

  @override
  String get budgetOverview_expenseCategories => 'Catégories de dépenses';

  @override
  String get budgetOverview_recentExpenses => 'Dépenses récentes';

  @override
  String get budgetOverview_viewAll => 'Voir tout';

  @override
  String get budgetOverview_expenseDeleted => 'Dépense supprimée';

  @override
  String get budgetOverview_undo => 'Annuler';

  @override
  String get budgetOverview_addExpense => 'Ajouter une dépense';

  @override
  String get budgetOverview_budgetDataRefreshed =>
      'Données budgétaires actualisées';

  @override
  String get budgetOverview_venue => 'Lieu';

  @override
  String get budgetOverview_catering => 'Traiteur';

  @override
  String get budgetOverview_neggafa => 'Neggafa';

  @override
  String get budgetOverview_band => 'Groupe de musique';

  @override
  String get budgetOverview_photographer => 'Photographe';

  @override
  String get budgetOverview_decor => 'Décor';

  @override
  String get budgetOverview_riadFesFullVenueBooking =>
      'Riad Fès - Réservation complète du lieu';

  @override
  String get budgetOverview_traditionalMoroccanMenu200Guests =>
      'Menu marocain traditionnel - 200 invités';

  @override
  String get budgetOverview_neggafaServices5OutfitChanges =>
      'Services Neggafa - 5 changements de tenue';

  @override
  String get budgetOverview_depositForChaabiBand =>
      'Acompte pour le groupe Chaabi';

  @override
  String get budgetOverview_bookingDepositPhotoAndVideo =>
      'Acompte de réservation - Photo et vidéo';

  @override
  String get addExpenseBottomSheet_addExpense => 'Ajouter une dépense';

  @override
  String get addExpenseBottomSheet_category => 'Catégorie';

  @override
  String get addExpenseBottomSheet_amountMAD => 'Montant (MAD)';

  @override
  String get addExpenseBottomSheet_enterAmount => 'Entrez le montant';

  @override
  String get addExpenseBottomSheet_mad => 'MAD';

  @override
  String get addExpenseBottomSheet_pleaseEnterAmount =>
      'Veuillez entrer le montant';

  @override
  String get addExpenseBottomSheet_description => 'Description';

  @override
  String get addExpenseBottomSheet_enterDescription => 'Entrez la description';

  @override
  String get addExpenseBottomSheet_pleaseEnterDescription =>
      'Veuillez entrer la description';

  @override
  String get addExpenseBottomSheet_receiptPhotoOptional =>
      'Photo du reçu (facultatif)';

  @override
  String get addExpenseBottomSheet_camera => 'Appareil photo';

  @override
  String get addExpenseBottomSheet_gallery => 'Galerie';

  @override
  String get addExpenseBottomSheet_receiptPhotoPreview =>
      'Aperçu de la photo du reçu';

  @override
  String get addExpenseBottomSheet_cancel => 'Annuler';

  @override
  String get addExpenseBottomSheet_save => 'Enregistrer';

  @override
  String get addExpenseBottomSheet_failedToCapturePhoto =>
      'Échec de la capture de la photo';

  @override
  String get addExpenseBottomSheet_failedToSelectPhoto =>
      'Échec de la sélection de la photo';

  @override
  String get addExpenseBottomSheet_pleaseSelectACategory =>
      'Veuillez sélectionner une catégorie';

  @override
  String addExpenseBottomSheet_receiptPhotoFor(Object description) {
    return 'Photo du reçu pour $description';
  }

  @override
  String get addExpenseBottomSheet_expenseAddedSuccessfully =>
      'Dépense ajoutée avec succès';

  @override
  String get budgetSummaryCard_totalBudget => 'Budget total';

  @override
  String get budgetSummaryCard_mad => 'MAD';

  @override
  String get budgetSummaryCard_spent => 'Dépensé';

  @override
  String get budgetSummaryCard_total => 'Total';

  @override
  String get budgetSummaryCard_remaining => 'Restant';

  @override
  String get budgetSummaryCard_budgetDistributionPieChart =>
      'Diagramme circulaire de la répartition du budget';

  @override
  String get budgetSummaryCard_budgetDistributionBarChart =>
      'Diagramme à barres de la répartition du budget';

  @override
  String get categoryDetailBottomSheet_allocated => 'Alloué';

  @override
  String get categoryDetailBottomSheet_spent => 'Dépensé';

  @override
  String get categoryDetailBottomSheet_remaining => 'Restant';

  @override
  String get categoryDetailBottomSheet_expenseHistory =>
      'Historique des dépenses';

  @override
  String categoryDetailBottomSheet_items(Object count) {
    return '$count éléments';
  }

  @override
  String get categoryDetailBottomSheet_noExpensesYet =>
      'Aucune dépense pour le moment';

  @override
  String get categoryDetailBottomSheet_mad => 'MAD';

  @override
  String get categoryDetailBottomSheet_receiptImageForExpense =>
      'Image du reçu pour la dépense';

  @override
  String get expenseCategoryCard_allocated => 'Alloué';

  @override
  String get expenseCategoryCard_mad => 'MAD';

  @override
  String get expenseCategoryCard_spent => 'Dépensé';

  @override
  String get expenseCategoryCard_left => 'Restant';

  @override
  String recentExpenseItem_receiptImageForExpense(Object category) {
    return 'Image du reçu pour la dépense $category';
  }

  @override
  String get recentExpenseItem_mad => 'MAD';

  @override
  String get countrySelection_selectCountry => 'Sélectionner le pays';

  @override
  String get countrySelection_countryUpdated =>
      'Pays mis à jour ! Les traditions ont été mises à jour.';

  @override
  String get countrySelection_confirmSelection => 'Confirmer la sélection';

  @override
  String get countrySelection_changeCountry => 'Changer de pays';

  @override
  String get languageSelection_selectLanguage => 'Sélectionner la langue';

  @override
  String get languageSelection_language => 'Langue';

  @override
  String get languageSelection_languageUpdated => 'Langue mise à jour';

  @override
  String get common_change => 'Changer';

  @override
  String get common_cancel => 'Annuler';

  @override
  String get common_confirm => 'Confirmer';

  @override
  String get common_close => 'Fermer';

  @override
  String get common_save => 'Enregistrer';

  @override
  String get common_edit => 'Modifier';

  @override
  String get common_delete => 'Supprimer';

  @override
  String get common_search => 'Rechercher';

  @override
  String get common_share => 'Partager';
}
