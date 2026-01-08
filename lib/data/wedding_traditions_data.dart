/// Wedding traditions data organized by country
/// Each country has its own set of traditions with multilingual support

class WeddingTraditionsData {
  static const Map<String, Map<String, dynamic>> countries = {
    'MA': {
      'code': 'MA',
      'name': 'Morocco',
      'nameFr': 'Maroc',
      'nameAr': 'المغرب',
      'flag': '🇲🇦',
      'traditions': [
        {
          'id': 'pre_wedding',
          'title': 'طقوس ما قبل الزفاف',
          'titleFr': 'Rituels Pré-Mariage',
          'titleEn': 'Pre-Wedding Rituals',
          'tasks': [
            {
              'id': 'khitba',
              'name': 'الخطبة',
              'nameFr': 'Khitba (Fiançailles)',
              'nameEn': 'Khitba (Engagement)',
              'culturalContext':
                  'Traditional engagement ceremony where families officially agree to the marriage. Includes exchange of gifts and sweets.',
              'timing': '3-6 months before wedding',
              'relatedVendors': ['Caterer', 'Photographer'],
            },
            {
              'id': 'henna_prep',
              'name': 'تحضير حفل الحناء',
              'nameFr': 'Préparation Cérémonie Henné',
              'nameEn': 'Henna Ceremony Preparation',
              'culturalContext':
                  'Sacred pre-wedding ritual where bride receives intricate henna designs. Symbolizes beauty, joy, and protection.',
              'timing': '1-2 days before wedding',
              'relatedVendors': ['Henna Artist', 'Neggafa'],
            },
            {
              'id': 'hammam',
              'name': 'الحمام المغربي',
              'nameFr': 'Hammam Traditionnel',
              'nameEn': 'Traditional Hammam',
              'culturalContext':
                  'Purification ritual at traditional bathhouse with family and friends. Includes body scrubbing and beauty treatments.',
              'timing': '1 week before wedding',
              'relatedVendors': ['Hammam', 'Beauty Specialist'],
            },
            {
              'id': 'neggafa_selection',
              'name': 'اختيار النكافة',
              'nameFr': 'Sélection de la Neggafa',
              'nameEn': 'Neggafa Selection',
              'culturalContext':
                  'Choosing the traditional wedding coordinator who manages dress changes and ceremonies throughout the wedding day.',
              'timing': '2-3 months before wedding',
              'relatedVendors': ['Neggafa'],
            },
            {
              'id': 'dress_fittings',
              'name': 'قياس الأزياء التقليدية',
              'nameFr': 'Essayages Robes Traditionnelles',
              'nameEn': 'Traditional Dress Fittings',
              'culturalContext':
                  'Multiple fittings for the 7 traditional Moroccan wedding dresses (caftans) representing different regions.',
              'timing': '1-2 months before wedding',
              'relatedVendors': ['Dress Designer', 'Neggafa'],
            },
          ],
        },
        {
          'id': 'wedding_day',
          'title': 'طقوس يوم الزفاف',
          'titleFr': 'Rituels Jour du Mariage',
          'titleEn': 'Wedding Day Customs',
          'tasks': [
            {
              'id': 'neggafa_prep',
              'name': 'تحضير النكافة',
              'nameFr': 'Préparation avec Neggafa',
              'nameEn': 'Neggafa Preparation',
              'culturalContext':
                  'Neggafa helps bride prepare and manages the ceremonial dress changes throughout the day.',
              'timing': 'Morning of wedding',
              'relatedVendors': ['Neggafa', 'Makeup Artist'],
            },
            {
              'id': 'nikah',
              'name': 'عقد القران',
              'nameFr': 'Nikah (Contrat Mariage)',
              'nameEn': 'Nikah (Marriage Contract)',
              'culturalContext':
                  'Islamic marriage contract signing ceremony with witnesses and religious officiant.',
              'timing': 'Afternoon',
              'relatedVendors': ['Religious Officiant'],
            },
            {
              'id': 'zaffa',
              'name': 'الزفة',
              'nameFr': 'Zaffa (Procession)',
              'nameEn': 'Zaffa Procession',
              'culturalContext':
                  'Grand entrance procession with traditional music, dancers, and celebration as couple enters reception.',
              'timing': 'Evening entrance',
              'relatedVendors': ['Band', 'Dancers', 'Photographer'],
            },
            {
              'id': 'amariya',
              'name': 'العمارية',
              'nameFr': 'Amariya (Trône)',
              'nameEn': 'Amariya Throne',
              'culturalContext':
                  'Bride and groom carried on ornate throne-like platform by family members in ceremonial procession.',
              'timing': 'During reception',
              'relatedVendors': ['Amariya Rental', 'Decorators'],
            },
            {
              'id': 'seven_dresses',
              'name': 'الأزياء السبعة',
              'nameFr': 'Sept Robes Traditionnelles',
              'nameEn': 'Seven Traditional Dresses',
              'culturalContext':
                  'Bride changes into 7 different traditional caftans representing various Moroccan regions throughout the celebration.',
              'timing': 'Throughout evening',
              'relatedVendors': ['Neggafa', 'Dress Designer'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'طقوس ما بعد الزفاف',
          'titleFr': 'Rituels Post-Mariage',
          'titleEn': 'Post-Wedding Traditions',
          'tasks': [
            {
              'id': 'sabah',
              'name': 'صباحية',
              'nameFr': 'Sabah (Lendemain)',
              'nameEn': 'Sabah Morning After',
              'culturalContext':
                  'Day-after celebration with close family and friends, featuring traditional breakfast and gift exchanges.',
              'timing': 'Day after wedding',
              'relatedVendors': ['Caterer'],
            },
            {
              'id': 'family_visits',
              'name': 'زيارات العائلة',
              'nameFr': 'Visites Familiales',
              'nameEn': 'Family Visits',
              'culturalContext':
                  'Newlyweds visit both families to receive blessings and gifts in the weeks following the wedding.',
              'timing': '1-2 weeks after wedding',
              'relatedVendors': [],
            },
            {
              'id': 'thank_you_gifts',
              'name': 'هدايا الشكر',
              'nameFr': 'Cadeaux de Remerciement',
              'nameEn': 'Thank You Gifts',
              'culturalContext':
                  'Distribution of thank you gifts to guests and family members who contributed to the wedding celebration.',
              'timing': '2-4 weeks after wedding',
              'relatedVendors': [],
            },
          ],
        },
      ],
    },
    'US': {
      'code': 'US',
      'name': 'United States',
      'nameFr': 'États-Unis',
      'nameAr': 'الولايات المتحدة',
      'flag': '🇺🇸',
      'traditions': [
        {
          'id': 'pre_wedding',
          'title': 'Pre-Wedding Events',
          'titleFr': 'Événements Pré-Mariage',
          'titleEn': 'Pre-Wedding Events',
          'tasks': [
            {
              'id': 'engagement_party',
              'name': 'Engagement Party',
              'nameFr': 'Fête de Fiançailles',
              'nameEn': 'Engagement Party',
              'culturalContext':
                  'Celebration to announce the engagement, usually hosted by parents or friends. Informal gathering with close family and friends.',
              'timing': '1-3 months after engagement',
              'relatedVendors': ['Venue', 'Caterer', 'Photographer'],
            },
            {
              'id': 'bridal_shower',
              'name': 'Bridal Shower',
              'nameFr': 'Cadeaux de Mariée',
              'nameEn': 'Bridal Shower',
              'culturalContext':
                  'Gift-giving party for the bride, typically organized by maid of honor or bridesmaids. Includes games and gift opening.',
              'timing': '1-3 months before wedding',
              'relatedVendors': ['Venue', 'Caterer', 'Decorator'],
            },
            {
              'id': 'bachelor_party',
              'name': 'Bachelor/Bachelorette Party',
              'nameFr': 'Enterrement de Vie de Garçon/Fille',
              'nameEn': 'Bachelor/Bachelorette Party',
              'culturalContext':
                  'Single-gender celebration party for bride or groom with friends, often involving travel or special activities.',
              'timing': '1-4 weeks before wedding',
              'relatedVendors': ['Venue', 'Travel Agent', 'Activity Planner'],
            },
            {
              'id': 'rehearsal_dinner',
              'name': 'Rehearsal Dinner',
              'nameFr': 'Dîner de Répétition',
              'nameEn': 'Rehearsal Dinner',
              'culturalContext':
                  'Dinner held after the wedding rehearsal, typically hosted by groom\'s family. Includes wedding party and close family.',
              'timing': 'Day before wedding',
              'relatedVendors': ['Venue', 'Caterer'],
            },
          ],
        },
        {
          'id': 'wedding_day',
          'title': 'Wedding Day',
          'titleFr': 'Jour du Mariage',
          'titleEn': 'Wedding Day',
          'tasks': [
            {
              'id': 'getting_ready',
              'name': 'Getting Ready',
              'nameFr': 'Préparation',
              'nameEn': 'Getting Ready',
              'culturalContext':
                  'Separate preparation for bride and groom with their respective parties. Includes hair, makeup, and dressing.',
              'timing': 'Morning of wedding',
              'relatedVendors': ['Hair Stylist', 'Makeup Artist', 'Photographer'],
            },
            {
              'id': 'first_look',
              'name': 'First Look',
              'nameFr': 'Premier Regard',
              'nameEn': 'First Look',
              'culturalContext':
                  'Private moment where bride and groom see each other before the ceremony. Often followed by photo session.',
              'timing': 'Before ceremony',
              'relatedVendors': ['Photographer', 'Videographer'],
            },
            {
              'id': 'ceremony',
              'name': 'Wedding Ceremony',
              'nameFr': 'Cérémonie de Mariage',
              'nameEn': 'Wedding Ceremony',
              'culturalContext':
                  'The main wedding ceremony, can be religious or secular. Includes vows, ring exchange, and pronouncement.',
              'timing': 'Scheduled ceremony time',
              'relatedVendors': ['Officiant', 'Florist', 'Musician'],
            },
            {
              'id': 'cocktail_hour',
              'name': 'Cocktail Hour',
              'nameFr': 'Heure du Cocktail',
              'nameEn': 'Cocktail Hour',
              'culturalContext':
                  'Social hour after ceremony with drinks and appetizers while couple takes photos. Guests mingle and enjoy.',
              'timing': 'After ceremony, before reception',
              'relatedVendors': ['Caterer', 'Bartender', 'Musician'],
            },
            {
              'id': 'reception',
              'name': 'Reception',
              'nameFr': 'Réception',
              'nameEn': 'Reception',
              'culturalContext':
                  'Main celebration with dinner, speeches, first dance, cake cutting, and dancing. The festive part of the celebration.',
              'timing': 'Evening after ceremony',
              'relatedVendors': ['Venue', 'Caterer', 'DJ/Band', 'Florist', 'Baker'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'Post-Wedding',
          'titleFr': 'Post-Mariage',
          'titleEn': 'Post-Wedding',
          'tasks': [
            {
              'id': 'send_off',
              'name': 'Send Off',
              'nameFr': 'Départ',
              'nameEn': 'Send Off',
              'culturalContext':
                  'Celebratory exit from reception, often with sparklers, confetti, or bubbles. Marks the end of the celebration.',
              'timing': 'End of reception',
              'relatedVendors': ['Photographer', 'Videographer'],
            },
            {
              'id': 'thank_you_cards',
              'name': 'Thank You Cards',
              'nameFr': 'Cartes de Remerciement',
              'nameEn': 'Thank You Cards',
              'culturalContext':
                  'Personal thank you notes sent to guests for attending and gifts. Typically sent within 3 months of wedding.',
              'timing': 'Within 3 months after wedding',
              'relatedVendors': ['Stationer'],
            },
            {
              'id': 'brunch',
              'name': 'Day After Brunch',
              'nameFr': 'Brunch du Lendemain',
              'nameEn': 'Day After Brunch',
              'culturalContext':
                  'Casual gathering the morning after the wedding for out-of-town guests and close family. Optional but common.',
              'timing': 'Day after wedding',
              'relatedVendors': ['Venue', 'Caterer'],
            },
          ],
        },
      ],
    },
    'IN': {
      'code': 'IN',
      'name': 'India',
      'nameFr': 'Inde',
      'nameAr': 'الهند',
      'flag': '🇮🇳',
      'traditions': [
        {
          'id': 'pre_wedding',
          'title': 'Pre-Wedding Rituals',
          'titleFr': 'Rituels Pré-Mariage',
          'titleEn': 'Pre-Wedding Rituals',
          'tasks': [
            {
              'id': 'roka',
              'name': 'Roka Ceremony',
              'nameFr': 'Cérémonie Roka',
              'nameEn': 'Roka Ceremony',
              'culturalContext':
                  'Official engagement ceremony where both families meet and exchange gifts. Marks the formal beginning of wedding preparations.',
              'timing': '6-12 months before wedding',
              'relatedVendors': ['Photographer', 'Caterer'],
            },
            {
              'id': 'haldi',
              'name': 'Haldi Ceremony',
              'nameFr': 'Cérémonie Haldi',
              'nameEn': 'Haldi Ceremony',
              'culturalContext':
                  'Turmeric paste applied to bride and groom by family members for good luck and beautiful glowing skin before the wedding.',
              'timing': '1-2 days before wedding',
              'relatedVendors': ['Photographer', 'Decorator'],
            },
            {
              'id': 'mehendi',
              'name': 'Mehendi Ceremony',
              'nameFr': 'Cérémonie Mehendi',
              'nameEn': 'Mehendi Ceremony',
              'culturalContext':
                  'Intricate henna designs applied to bride\'s hands and feet. Fun celebration with music, dancing, and traditional songs.',
              'timing': '1-2 days before wedding',
              'relatedVendors': ['Mehendi Artist', 'Photographer', 'Musician'],
            },
            {
              'id': 'sangam',
              'name': 'Sangam/Sagan',
              'nameFr': 'Sangam/Sagan',
              'nameEn': 'Sangam/Sagan',
              'culturalContext':
                  'Gift exchange ceremony between families. Includes jewelry, clothes, and other traditional items.',
              'timing': 'Day before wedding',
              'relatedVendors': ['Jeweler', 'Photographer'],
            },
          ],
        },
        {
          'id': 'wedding_day',
          'title': 'Wedding Day',
          'titleFr': 'Jour du Mariage',
          'titleEn': 'Wedding Day',
          'tasks': [
            {
              'id': 'baraat',
              'name': 'Baraat Procession',
              'nameFr': 'Procession Baraat',
              'nameEn': 'Baraat Procession',
              'culturalContext':
                  'Groom\'s grand entrance on a decorated horse or car, accompanied by family and friends with music and dancing.',
              'timing': 'Before ceremony',
              'relatedVendors': ['Band', 'Photographer', 'Videographer'],
            },
            {
              'id': 'jaimala',
              'name': 'Jaimala (Exchange of Garlands)',
              'nameFr': 'Jaimala (Échange de Guirlandes)',
              'nameEn': 'Jaimala (Exchange of Garlands)',
              'culturalContext':
                  'Bride and groom exchange floral garlands, symbolizing acceptance of each other. Often playful with family trying to prevent it.',
              'timing': 'During ceremony',
              'relatedVendors': ['Florist', 'Photographer'],
            },
            {
              'id': 'kanyadaan',
              'name': 'Kanyadaan',
              'nameFr': 'Kanyadaan',
              'nameEn': 'Kanyadaan',
              'culturalContext':
                  'Sacred ritual where bride\'s father gives away his daughter to the groom. Emotional moment symbolizing the transfer of responsibility.',
              'timing': 'During ceremony',
              'relatedVendors': ['Priest', 'Photographer'],
            },
            {
              'id': 'phere',
              'name': 'Saat Phere (Seven Circles)',
              'nameFr': 'Saat Phere (Sept Cercles)',
              'nameEn': 'Saat Phere (Seven Circles)',
              'culturalContext':
                  'Couple takes seven vows walking around the sacred fire, each vow representing a promise for their married life.',
              'timing': 'Main ceremony',
              'relatedVendors': ['Priest', 'Photographer'],
            },
            {
              'id': 'sindoor',
              'name': 'Sindoor Daan',
              'nameFr': 'Sindoor Daan',
              'nameEn': 'Sindoor Daan',
              'culturalContext':
                  'Groom applies vermillion powder in the bride\'s hair parting, marking her as married woman. Important cultural symbol.',
              'timing': 'End of ceremony',
              'relatedVendors': ['Photographer'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'Post-Wedding',
          'titleFr': 'Post-Mariage',
          'titleEn': 'Post-Wedding',
          'tasks': [
            {
              'id': 'vidai',
              'name': 'Vidai Ceremony',
              'nameFr': 'Cérémonie Vidai',
              'nameEn': 'Vidai Ceremony',
              'culturalContext':
                  'Emotional farewell where bride leaves her parental home. Family members bless her as she begins her new journey.',
              'timing': 'After ceremony',
              'relatedVendors': ['Photographer', 'Videographer'],
            },
            {
              'id': 'griha_pravesh',
              'name': 'Griha Pravesh',
              'nameFr': 'Griha Pravesh',
              'nameEn': 'Griha Pravesh',
              'culturalContext':
                  'Welcome ceremony at groom\'s home. Bride enters with rituals and blessings, marking her entry into her new family.',
              'timing': 'After wedding, at groom\'s home',
              'relatedVendors': ['Photographer'],
            },
            {
              'id': 'reception',
              'name': 'Reception',
              'nameFr': 'Réception',
              'nameEn': 'Reception',
              'culturalContext':
                  'Large celebration with extended family and friends. Includes dinner, dancing, and celebration of the union.',
              'timing': 'Evening after ceremony or next day',
              'relatedVendors': ['Venue', 'Caterer', 'DJ', 'Decorator'],
            },
          ],
        },
      ],
    },
    'FR': {
      'code': 'FR',
      'name': 'France',
      'nameFr': 'France',
      'nameAr': 'فرنسا',
      'flag': '🇫🇷',
      'traditions': [
        {
          'id': 'pre_wedding',
          'title': 'Avant le Mariage',
          'titleFr': 'Avant le Mariage',
          'titleEn': 'Pre-Wedding',
          'tasks': [
            {
              'id': 'fiançailles',
              'name': 'Fiançailles',
              'nameFr': 'Fiançailles',
              'nameEn': 'Engagement',
              'culturalContext':
                  'Formal engagement party where families meet and exchange rings. Often includes a small ceremony and celebration.',
              'timing': '6-12 months before wedding',
              'relatedVendors': ['Photographer', 'Venue', 'Caterer'],
            },
            {
              'id': 'enterrement_vie_garcon',
              'name': 'Enterrement de Vie de Garçon/Fille',
              'nameFr': 'Enterrement de Vie de Garçon/Fille',
              'nameEn': 'Bachelor/Bachelorette Party',
              'culturalContext':
                  'Celebration party for the bride or groom with friends, often involving travel or special activities before marriage.',
              'timing': '2-4 weeks before wedding',
              'relatedVendors': ['Venue', 'Travel Agent'],
            },
            {
              'id': 'couture',
              'name': 'Essayage de la Robe',
              'nameFr': 'Essayage de la Robe',
              'nameEn': 'Dress Fitting',
              'culturalContext':
                  'Multiple fittings for the wedding dress. French brides often choose elegant, sophisticated designs.',
              'timing': '2-3 months before wedding',
              'relatedVendors': ['Dress Designer', 'Bridal Boutique'],
            },
          ],
        },
        {
          'id': 'wedding_day',
          'title': 'Jour du Mariage',
          'titleFr': 'Jour du Mariage',
          'titleEn': 'Wedding Day',
          'tasks': [
            {
              'id': 'mairie',
              'name': 'Cérémonie à la Mairie',
              'nameFr': 'Cérémonie à la Mairie',
              'nameEn': 'City Hall Ceremony',
              'culturalContext':
                  'Legal civil ceremony at the town hall (mairie) conducted by the mayor. Required by law before any religious ceremony.',
              'timing': 'Morning or afternoon',
              'relatedVendors': ['Officiant (Mayor)', 'Photographer'],
            },
            {
              'id': 'eglise',
              'name': 'Cérémonie Religieuse',
              'nameFr': 'Cérémonie Religieuse',
              'nameEn': 'Religious Ceremony',
              'culturalContext':
                  'Optional religious ceremony in church for couples who want a religious blessing after the civil ceremony.',
              'timing': 'After civil ceremony',
              'relatedVendors': ['Priest', 'Church', 'Musician'],
            },
            {
              'id': 'vin_honneur',
              'name': 'Vin d\'Honneur',
              'nameFr': 'Vin d\'Honneur',
              'nameEn': 'Cocktail Reception',
              'culturalContext':
                  'Drinks and appetizers reception between ceremony and dinner. Guests toast the couple with champagne.',
              'timing': 'Between ceremony and dinner',
              'relatedVendors': ['Venue', 'Caterer', 'Bartender'],
            },
            {
              'id': 'diner',
              'name': 'Dîner de Mariage',
              'nameFr': 'Dîner de Mariage',
              'nameEn': 'Wedding Dinner',
              'culturalContext':
                  'Multi-course French dinner with wine pairings. Elegant and refined dining experience for all guests.',
              'timing': 'Evening',
              'relatedVendors': ['Venue', 'Caterer', 'Sommelier'],
            },
            {
              'id': 'piece_montée',
              'name': 'Pièce Montée',
              'nameFr': 'Pièce Montée',
              'nameEn': 'Croquembouche',
              'culturalContext':
                  'Traditional French wedding cake made of cream puffs stacked in a cone shape and held together with caramel.',
              'timing': 'After dinner',
              'relatedVendors': ['Pastry Chef', 'Baker'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'Après le Mariage',
          'titleFr': 'Après le Mariage',
          'titleEn': 'Post-Wedding',
          'tasks': [
            {
              'id': 'reste_de_mariee',
              'name': 'Le Reste de Mariée',
              'nameFr': 'Le Reste de Mariée',
              'nameEn': 'Day After Brunch',
              'culturalContext':
                  'Casual gathering the day after for close family and friends who stayed overnight. Often includes leftover wedding food.',
              'timing': 'Day after wedding',
              'relatedVendors': ['Venue', 'Caterer'],
            },
            {
              'id': 'carte_remerciement',
              'name': 'Cartes de Remerciement',
              'nameFr': 'Cartes de Remerciement',
              'nameEn': 'Thank You Cards',
              'culturalContext':
                  'Elegant thank you notes sent to guests for attending the wedding and for gifts received.',
              'timing': 'Within 2 months after wedding',
              'relatedVendors': ['Stationer'],
            },
          ],
        },
      ],
    },
  };

  /// Get traditions for a specific country
  static List<Map<String, dynamic>> getTraditionsForCountry(String countryCode) {
    final country = countries[countryCode];
    if (country == null) {
      // Default to Morocco if country not found
      return countries['MA']!['traditions'] as List<Map<String, dynamic>>;
    }
    return country['traditions'] as List<Map<String, dynamic>>;
  }

  /// Get all available countries
  static List<Map<String, String>> getAvailableCountries() {
    return countries.values.map((country) {
      return {
        'code': country['code'] as String,
        'name': country['name'] as String,
        'nameFr': country['nameFr'] as String,
        'nameAr': country['nameAr'] as String,
        'flag': country['flag'] as String,
      };
    }).toList();
  }

  /// Get country name by code
  static String getCountryName(String countryCode, String language) {
    final country = countries[countryCode];
    if (country == null) return 'Unknown';
    
    switch (language) {
      case 'fr':
        return country['nameFr'] as String;
      case 'ar':
        return country['nameAr'] as String;
      default:
        return country['name'] as String;
    }
  }
}
