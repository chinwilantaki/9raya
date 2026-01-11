/// Wedding traditions data organized by country
/// Each country has its own set of traditions with multilingual support

class WeddingTraditionsData {
  static Map<String, Map<String, dynamic>> countries = {
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
              'id': 'khotba',
              'name': 'الخطبة',
              'nameFr': 'Khitba (Fiançailles)',
              'nameEn': 'Khitba (Engagement)',
              'culturalContext':
                  'Traditional engagement ceremony where families officially agree to the marriage. This marks the formal beginning of wedding preparations.',
              'timing': '3-6 months before wedding',
              'relatedVendors': ['Caterer', 'Photographer'],
            },
            {
              'id': 'dfia_hdiya',
              'name': 'دفية / هدية',
              'nameFr': 'Dfia / Hdiya (Cadeaux du Marié)',
              'nameEn': 'Dfia / Hdiya (Gifts from Groom to Bride)',
              'culturalContext':
                  'The groom presents gifts (Dfia/Hdiya) to the bride, typically including jewelry, clothing, and other traditional items. This symbolizes commitment and respect.',
              'timing': '2-4 months before wedding',
              'relatedVendors': ['Jeweler', 'Clothing Store'],
            },
            {
              'id': 'family_gathering_fatiha',
              'name': 'تجمع العائلة و الفاتحة',
              'nameFr': 'Rassemblement Familial et Fatiha',
              'nameEn': 'Family Gathering & Fatiha',
              'culturalContext':
                  'Family members gather to recite the Fatiha (opening chapter of the Quran) as a blessing for the upcoming marriage. Strengthens family bonds.',
              'timing': '1-2 months before wedding',
              'relatedVendors': ['Religious Officiant', 'Caterer'],
            },
            {
              'id': 'hammam_day',
              'name': 'يوم الحمام',
              'nameFr': 'Jour du Hammam',
              'nameEn': 'Hammam Day',
              'culturalContext':
                  'A purification ritual where the bride visits a traditional bathhouse with female friends and relatives.',
              'timing': 'A few days before the wedding',
              'relatedVendors': ['Hammam'],
            },
            {
              'id': 'henna_night',
              'name': 'ليلة الحناء',
              'nameFr': 'Laylat Al Henna (Nuit du Henné)',
              'nameEn': 'Henna Night (Laylat Al Henna)',
              'culturalContext':
                  'Sacred pre-wedding ritual where bride receives intricate henna designs on hands and feet. Symbolizes beauty, joy, protection, and fertility. Accompanied by music and celebration.',
              'timing': '1-2 days before wedding',
              'relatedVendors': ['Henna Artist', 'Neggafa', 'Musician'],
            },
            {
              'id': 'neggafa_selection',
              'name': 'اختيار النكافة',
              'nameFr': 'Sélection de la Neggafa',
              'nameEn': 'Neggafa Selection',
              'culturalContext':
                  'Choosing the traditional wedding coordinator (Neggafa) who manages dress changes, jewelry, and ceremonies throughout the wedding day. Essential for Moroccan weddings.',
              'timing': '2-3 months before wedding',
              'relatedVendors': ['Neggafa'],
            },
            {
              'id': 'dress_fittings',
              'name': 'قياس الأزياء التقليدية',
              'nameFr': 'Essayages Robes Traditionnelles',
              'nameEn': 'Traditional Dress Fittings',
              'culturalContext':
                  'Multiple fittings for traditional Moroccan wedding dresses (caftans/takchitas) representing different regions. The bride typically changes into multiple outfits throughout the celebration.',
              'timing': '1-2 months before wedding',
              'relatedVendors': ['Dress Designer', 'Neggafa'],
            },
          ],
        },
        {
          'id': 'wedding_day',
          'title': 'طقوس يوم الزفاف',
          'titleFr': 'Rituels du Jour du Mariage',
          'titleEn': 'Wedding Day Rituals',
          'tasks': [
            {
              'id': 'aqd_nikah',
              'name': 'عقد النكاح',
              'nameFr': 'Aqd Nikah (Contrat de Mariage)',
              'nameEn': 'Aqd Nikah (Marriage Contract)',
              'culturalContext':
                  'The signing of the marriage contract in the presence of an Adoul (religious witness).',
              'timing': 'Day of the wedding',
              'relatedVendors': ['Adoul'],
            },
            {
              'id': 'ziana_styling',
              'name': 'الزيانة',
              'nameFr': 'Ziana (Stylisation de la Mariée par Neggafa)',
              'nameEn': 'Ziana (Bride Styling by Neggafa)',
              'culturalContext':
                  'The Neggafa helps the bride prepare with traditional styling, makeup, and dressing. She manages all the ceremonial preparations and dress changes throughout the day.',
              'timing': 'Morning of wedding',
              'relatedVendors': ['Neggafa', 'Makeup Artist', 'Hair Stylist'],
            },
            {
              'id': 'amariya_entrance',
              'name': 'دخول العمارية',
              'nameFr': 'Entrée de l\'Amariya',
              'nameEn': 'Amariya Entrance',
              'culturalContext':
                  'The bride and groom make a grand entrance in an ornate carriage called the Amariya, carried by attendants.',
              'timing': 'During the reception',
              'relatedVendors': ['Amariya Rental', 'Band'],
            },
            {
              'id': 'kaftan_changes',
              'name': 'تغيير القفاطين',
              'nameFr': 'Changements de Caftans',
              'nameEn': 'Kaftan Changes',
              'culturalContext':
                  'The bride changes into multiple kaftans or takchitas of different styles and colors, representing various regions of Morocco.',
              'timing': 'Throughout the reception',
              'relatedVendors': ['Neggafa', 'Dress Designer'],
            },
            {
              'id': 'zgharit',
              'name': 'الزغاريت',
              'nameFr': 'Zgharit (Youyous)',
              'nameEn': 'Zgharit (Ululations)',
              'culturalContext':
                  'Traditional high-pitched ululations (zgharit/youyous) performed by women to express joy and celebration. Creates an energetic and festive atmosphere.',
              'timing': 'Throughout wedding celebration',
              'relatedVendors': [],
            },
            {
              'id': 'traditional_music',
              'name': 'الموسيقى التقليدية الحية',
              'nameFr': 'Musique Traditionnelle Live (Chaabi, Dakka, Ahwach)',
              'nameEn': 'Live Traditional Music (Chaabi, Dakka, Ahwach, etc.)',
              'culturalContext':
                  'Live performance of traditional Moroccan music styles including Chaabi, Dakka, Ahwach, and other regional variations. Creates an authentic celebration atmosphere.',
              'timing': 'Throughout wedding celebration',
              'relatedVendors': ['Traditional Band', 'Musicians', 'Sound System'],
            },
            {
              'id': 'wedding_feast',
              'name': 'وليمة الزفاف',
              'nameFr': 'Festin de Mariage (Pastilla, Viandes, Sucreries)',
              'nameEn': 'Wedding Feast (Pastilla, Meat Dishes, Sweets)',
              'culturalContext':
                  'Elaborate traditional Moroccan wedding feast featuring pastilla (pigeon pie), various meat dishes, couscous, and an array of traditional sweets and pastries.',
              'timing': 'During reception',
              'relatedVendors': ['Caterer', 'Chef'],
            },
            {
              'id': 'cake_cutting',
              'name': 'قطع الكعكة',
              'nameFr': 'Découpage du Gâteau',
              'nameEn': 'Cake Cutting',
              'culturalContext':
                  'Traditional cake cutting ceremony where the couple cuts the wedding cake together, often followed by distribution to guests as a symbol of sharing joy.',
              'timing': 'After dinner',
              'relatedVendors': ['Baker', 'Cake Designer'],
            },
            {
              'id': 'dance_celebration',
              'name': 'الرقص والاحتفال',
              'nameFr': 'Danse et Célébration',
              'nameEn': 'Dance & Celebration',
              'culturalContext':
                  'Extended dancing and celebration with traditional Moroccan dances. Guests celebrate with the couple through music and dance until late in the night.',
              'timing': 'Throughout evening',
              'relatedVendors': ['DJ', 'Band', 'Lighting'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'طقوس ما بعد الزفاف',
          'titleFr': 'Rituels Post-Mariage',
          'titleEn': 'Post-Wedding Rituals',
          'tasks': [
            {
              'id': 'sabah_al_aroussa',
              'name': 'صباح العروسة',
              'nameFr': 'Sabah Al Aroussa (Lendemain Matin)',
              'nameEn': 'Sabah Al Aroussa (Morning-After Tradition)',
              'culturalContext':
                  'Day-after celebration with close family and friends, featuring traditional breakfast. The bride is presented to close family members in a relaxed, intimate setting.',
              'timing': 'Day after wedding',
              'relatedVendors': ['Caterer'],
            },
            {
              'id': 'couscous_day',
              'name': 'يوم الكسكس',
              'nameFr': 'Jour du Couscous',
              'nameEn': 'Couscous Day',
              'culturalContext':
                  'Traditional couscous meal often served the day after the wedding. A celebration meal bringing together close family members for a more intimate gathering.',
              'timing': 'Next day after wedding',
              'relatedVendors': ['Caterer'],
            },
            {
              'id': 'gift_exchange',
              'name': 'تبادل الهدايا بين العائلات',
              'nameFr': 'Échange de Cadeaux entre Familles',
              'nameEn': 'Gift Exchange Between Families',
              'culturalContext':
                  'Families exchange gifts as a gesture of goodwill and to strengthen the bond between the two families. This continues the celebration and mutual respect.',
              'timing': '1-3 days after wedding',
              'relatedVendors': [],
            },
            {
              'id': 'bride_welcome',
              'name': 'استقبال العروس في عائلة العريس',
              'nameFr': 'Accueil de la Mariée dans la Famille du Marié',
              'nameEn': 'Bride Welcomed into Groom\'s Family',
              'culturalContext':
                  'The bride is formally welcomed into the groom\'s family home with traditional ceremonies and blessings. This marks her official entry into her new family.',
              'timing': '2-3 days after wedding',
              'relatedVendors': [],
            },
            {
              'id': 'regional_traditions',
              'name': 'التقاليد الجهوية',
              'nameFr': 'Traditions Régionales (Fassi, Amazigh, Sahraoui, Jbala)',
              'nameEn': 'Regional Traditions (Fassi, Amazigh, Sahraoui, Jbala, etc.)',
              'culturalContext':
                  'Additional regional traditions specific to different areas of Morocco (Fes, Amazigh regions, Sahara, Jbala mountains). These may vary based on family origin and regional customs.',
              'timing': 'Throughout wedding period',
              'relatedVendors': ['Regional Specialists'],
            },
            {
              'id': 'closing_family_visit',
              'name': 'زيارة العائلة الختامية',
              'nameFr': 'Visite Familiale de Clôture',
              'nameEn': 'Closing Family Visit',
              'culturalContext':
                  'Final family visits and gatherings days after the wedding. Newlyweds visit extended family members to receive blessings and complete the wedding celebration cycle.',
              'timing': '3-7 days after wedding',
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
              'id': 'engagement_ring',
              'name': 'Engagement Ring',
              'nameFr': 'Bague de Fiançailles',
              'nameEn': 'Engagement Ring',
              'culturalContext':
                  'The groom presents the bride with an engagement ring, typically a diamond, as a symbol of commitment.',
              'timing': 'At the time of proposal',
              'relatedVendors': ['Jeweler'],
            },
            {
              'id': 'bridal_shower',
              'name': 'Bridal Shower',
              'nameFr': 'Fête de la Mariée',
              'nameEn': 'Bridal Shower',
              'culturalContext':
                  'A gift-giving party for the bride, where friends and family help furnish her new home.',
              'timing': '1-3 months before the wedding',
              'relatedVendors': ['Venue', 'Caterer'],
            },
            {
              'id': 'bachelor_bachelorette_party',
              'name': 'Bachelor/Bachelorette Party',
              'nameFr': 'Enterrement de Vie de Garçon/Fille',
              'nameEn': 'Bachelor/Bachelorette Party',
              'culturalContext':
                  'Separate celebrations for the groom and bride with their respective friends to celebrate their last days of being single.',
              'timing': '1-4 weeks before the wedding',
              'relatedVendors': [],
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
              'id': 'something_old_new_borrowed_blue',
              'name': 'Something Old, New, Borrowed, Blue',
              'nameFr': 'Quelque Chose de Vieux, Neuf, Emprunté, Bleu',
              'nameEn': 'Something Old, New, Borrowed, Blue',
              'culturalContext':
                  'The bride incorporates these four items into her attire for good luck in her marriage.',
              'timing': 'Wedding day',
              'relatedVendors': [],
            },
            {
              'id': 'first_look',
              'name': 'First Look',
              'nameFr': 'Premier Regard',
              'nameEn': 'First Look',
              'culturalContext':
                  'An intimate moment where the bride and groom see each other before the ceremony, often captured by a photographer.',
              'timing': 'Before the ceremony',
              'relatedVendors': ['Photographer'],
            },
            {
              'id': 'exchange_of_vows_rings',
              'name': 'Exchange of Vows and Rings',
              'nameFr': 'Échange de Vœux et d\'Alliances',
              'nameEn': 'Exchange of Vows and Rings',
              'culturalContext':
                  'The couple publicly declares their commitment to each other and exchanges wedding rings as a symbol of eternal love.',
              'timing': 'During the ceremony',
              'relatedVendors': ['Officiant', 'Jeweler'],
            },
            {
              'id': 'first_dance',
              'name': 'First Dance',
              'nameFr': 'Première Danse',
              'nameEn': 'First Dance',
              'culturalContext':
                  'The newlyweds share their first dance as a married couple at the reception.',
              'timing': 'During the reception',
              'relatedVendors': ['DJ', 'Band'],
            },
            {
              'id': 'cake_cutting',
              'name': 'Cake Cutting',
              'nameFr': 'Coupe du Gâteau',
              'nameEn': 'Cake Cutting',
              'culturalContext':
                  'The couple cuts the multi-tiered wedding cake together, a tradition symbolizing their first shared task.',
              'timing': 'During the reception',
              'relatedVendors': ['Baker', 'Caterer'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'Post-Wedding',
          'titleFr': 'Après le Mariage',
          'titleEn': 'Post-Wedding',
          'tasks': [
            {
              'id': 'bouquet_garter_toss',
              'name': 'Bouquet and Garter Toss',
              'nameFr': 'Lancer du Bouquet et de la Jarretière',
              'nameEn': 'Bouquet and Garter Toss',
              'culturalContext':
                  'The bride tosses her bouquet to single women, and the groom tosses the garter to single men, with the belief that the catcher will be the next to marry.',
              'timing': 'During the reception',
              'relatedVendors': [],
            },
            {
              'id': 'grand_exit_send_off',
              'name': 'Grand Exit/Send-Off',
              'nameFr': 'Grande Sortie/Départ',
              'nameEn': 'Grand Exit/Send-Off',
              'culturalContext':
                  'Guests celebrate the couple\'s departure, often with sparklers, bubbles, or rice, marking the end of the celebration.',
              'timing': 'End of the reception',
              'relatedVendors': [],
            },
            {
              'id': 'honeymoon',
              'name': 'Honeymoon',
              'nameFr': 'Lune de Miel',
              'nameEn': 'Honeymoon',
              'culturalContext':
                  'The couple takes a celebratory trip to a romantic destination to begin their married life together.',
              'timing': 'Shortly after the wedding',
              'relatedVendors': ['Travel Agent'],
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
              'id': 'engagement_ceremony',
              'name': 'Engagement Ceremony',
              'nameFr': 'Cérémonie de Fiançailles',
              'nameEn': 'Engagement Ceremony',
              'culturalContext':
                  'A formal announcement of the wedding where families exchange gifts and bless the couple.',
              'timing': '6-12 months before the wedding',
              'relatedVendors': ['Venue', 'Caterer'],
            },
            {
              'id': 'mehendi_ceremony',
              'name': 'Mehendi Ceremony',
              'nameFr': 'Cérémonie du Mehendi',
              'nameEn': 'Mehendi Ceremony',
              'culturalContext':
                  'The bride\'s hands and feet are adorned with intricate henna designs in a festive celebration with music and dancing.',
              'timing': '1-2 days before the wedding',
              'relatedVendors': ['Henna Artist', 'Caterer', 'DJ'],
            },
            {
              'id': 'sangeet_ceremony',
              'name': 'Sangeet Ceremony',
              'nameFr': 'Cérémonie du Sangeet',
              'nameEn': 'Sangeet Ceremony',
              'culturalContext':
                  'A joyous celebration of music, dancing, and performances, allowing both families to bond and celebrate together.',
              'timing': '1-2 days before the wedding',
              'relatedVendors': ['Venue', 'DJ', 'Choreographer'],
            },
            {
              'id': 'haldi_ceremony',
              'name': 'Haldi Ceremony',
              'nameFr': 'Cérémonie du Haldi',
              'nameEn': 'Haldi Ceremony',
              'culturalContext':
                  'A turmeric paste is applied to the bride and groom to purify them, enhance their complexion, and ward off evil spirits.',
              'timing': 'Morning of the wedding',
              'relatedVendors': ['Decorator', 'Caterer'],
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
              'id': 'baraat_procession',
              'name': 'Baraat Procession',
              'nameFr': 'Procession du Baraat',
              'nameEn': 'Baraat Procession',
              'culturalContext':
                  'The groom arrives at the wedding venue in a grand procession, often on a decorated horse, with his family and friends dancing.',
              'timing': 'Arrival at the venue',
              'relatedVendors': ['Band', 'Horse Rental'],
            },
            {
              'id': 'varmala_exchange',
              'name': 'Varmala Exchange',
              'nameFr': 'Échange de Guirlandes (Varmala)',
              'nameEn': 'Varmala Exchange',
              'culturalContext':
                  'The bride and groom exchange floral garlands as a symbol of mutual acceptance and respect.',
              'timing': 'During the ceremony',
              'relatedVendors': ['Florist'],
            },
            {
              'id': 'kanyadaan',
              'name': 'Kanyadaan',
              'nameFr': 'Kanyadaan',
              'nameEn': 'Kanyadaan',
              'culturalContext':
                  'A symbolic ritual where the bride\'s father gives his daughter away to the groom, entrusting him with her future.',
              'timing': 'During the ceremony',
              'relatedVendors': ['Priest'],
            },
            {
              'id': 'saptapadi_seven_vows',
              'name': 'Saptapadi (Seven Vows)',
              'nameFr': 'Saptapadi (Sept Vœux)',
              'nameEn': 'Saptapadi (Seven Vows)',
              'culturalContext':
                  'The couple takes seven sacred rounds around a holy fire, each step representing a vow of commitment for their married life.',
              'timing': 'During the ceremony',
              'relatedVendors': ['Priest'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'Post-Wedding',
          'titleFr': 'Après le Mariage',
          'titleEn': 'Post-Wedding',
          'tasks': [
            {
              'id': 'vidaai_farewell',
              'name': 'Vidaai (Farewell)',
              'nameFr': 'Vidaai (Adieu)',
              'nameEn': 'Vidaai (Farewell)',
              'culturalContext':
                  'The bride\'s formal and emotional farewell from her parental home as she begins her new life with her husband.',
              'timing': 'After the wedding ceremony',
              'relatedVendors': [],
            },
            {
              'id': 'griha_pravesh_welcome',
              'name': 'Griha Pravesh (Welcome)',
              'nameFr': 'Griha Pravesh (Accueil)',
              'nameEn': 'Griha Pravesh (Welcome)',
              'culturalContext':
                  'The welcoming of the bride to her new home, where she enters by knocking over a vessel of rice for prosperity.',
              'timing': 'Upon arrival at the groom\'s home',
              'relatedVendors': [],
            },
            {
              'id': 'reception',
              'name': 'Reception',
              'nameFr': 'Réception',
              'nameEn': 'Reception',
              'culturalContext':
                  'A grand celebration with food, music, and entertainment to honor the newlywed couple and introduce them to the community.',
              'timing': 'Evening after the wedding or a few days later',
              'relatedVendors': ['Venue', 'Caterer', 'DJ'],
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
              'id': 'fiancailles',
              'name': 'Fiançailles',
              'nameFr': 'Fiançailles',
              'nameEn': 'Engagement Celebration',
              'culturalContext':
                  'A family-centered gathering to celebrate the engagement, often held over a weekend.',
              'timing': '6-12 months before the wedding',
              'relatedVendors': ['Venue', 'Caterer'],
            },
            {
              'id': 'civil_ceremony_prep',
              'name': 'Préparation de la Cérémonie Civile',
              'nameFr': 'Préparation de la Cérémonie Civile',
              'nameEn': 'Civil Ceremony Preparation',
              'culturalContext':
                  'Gathering all necessary documents and booking the date for the mandatory civil ceremony at the town hall (mairie).',
              'timing': '3-6 months before the wedding',
              'relatedVendors': [],
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
              'id': 'civil_ceremony',
              'name': 'Cérémonie Civile à la Mairie',
              'nameFr': 'Cérémonie Civile à la Mairie',
              'nameEn': 'Civil Ceremony at the Town Hall',
              'culturalContext':
                  'The only legally recognized marriage ceremony in France, officiated by the mayor. It is a formal and required step.',
              'timing': 'Morning of the wedding',
              'relatedVendors': ['Mairie'],
            },
            {
              'id': 'religious_or_symbolic_ceremony',
              'name': 'Cérémonie Religieuse ou Symbolique',
              'nameFr': 'Cérémonie Religieuse ou Symbolique',
              'nameEn': 'Religious or Symbolic Ceremony',
              'culturalContext':
                  'A more personal ceremony held in a church, château, or other venue, following the civil ceremony.',
              'timing': 'Afternoon of the wedding',
              'relatedVendors': ['Venue', 'Officiant', 'Florist'],
            },
            {
              'id': 'vin_dhonneur',
              'name': 'Vin d\'Honneur',
              'nameFr': 'Vin d\'Honneur',
              'nameEn': 'Honor Wine (Cocktail Hour)',
              'culturalContext':
                  'A cocktail hour with appetizers, local wines, and champagne, held immediately after the ceremonies.',
              'timing': 'After the ceremonies',
              'relatedVendors': ['Caterer', 'Venue'],
            },
            {
              'id': 'wedding_dinner',
              'name': 'Dîner de Mariage',
              'nameFr': 'Dîner de Mariage',
              'nameEn': 'Wedding Dinner',
              'culturalContext':
                  'A multi-course dinner served late in the evening, often with speeches between courses.',
              'timing': 'Evening',
              'relatedVendors': ['Caterer', 'Venue'],
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
              'id': 'croquembouche',
              'name': 'Croquembouche',
              'nameFr': 'Croquembouche',
              'nameEn': 'Croquembouche',
              'culturalContext':
                  'A traditional French wedding cake made of a pyramid of cream-filled pastry balls, often served as the dessert.',
              'timing': 'During the reception',
              'relatedVendors': ['Pastry Chef', 'Baker'],
            },
            {
              'id': 'champagne_tower',
              'name': 'Fontaine de Champagne',
              'nameFr': 'Fontaine de Champagne',
              'nameEn': 'Champagne Tower',
              'culturalContext':
                  'A highlight of the reception where champagne is poured into a pyramid of glasses.',
              'timing': 'During the reception',
              'relatedVendors': ['Caterer'],
            },
            {
              'id': 'onion_soup',
              'name': 'Soupe à l\'Oignon',
              'nameFr': 'Soupe à l\'Oignon',
              'nameEn': 'Onion Soup',
              'culturalContext':
                  'Served in the early hours of the morning to help guests recover from a long night of celebrating.',
              'timing': 'Late night/early morning',
              'relatedVendors': ['Caterer'],
            },
          ],
        },
      ],
    },
    'DZ': {
      'code': 'DZ',
      'name': 'Algeria',
      'nameFr': 'Algérie',
      'nameAr': 'الجزائر',
      'flag': '🇩🇿',
      'traditions': [
        {
          'id': 'pre_wedding',
          'title': 'طقوس ما قبل الزفاف',
          'titleFr': 'Rituels Pré-Mariage',
          'titleEn': 'Pre-Wedding Rituals',
          'tasks': [
            {
              'id': 'khotba',
              'name': 'الخطبة',
              'nameFr': 'Khotba (Fiançailles)',
              'nameEn': 'Khotba (Engagement)',
              'culturalContext':
                  'The groom\'s family formally asks for the bride\'s hand in marriage. If accepted, the El-Fatiha (first verse of the Quran) is pronounced.',
              'timing': '6-12 months before wedding',
              'relatedVendors': ['Imam'],
            },
            {
              'id': 'hlel',
              'name': 'الحلال',
              'nameFr': 'Hlel (Contrat de Mariage)',
              'nameEn': 'Hlel (Marriage Contract)',
              'culturalContext':
                  'The formal Islamic marriage contract is signed, often in the presence of an Imam.',
              'timing': '3-6 months before wedding',
              'relatedVendors': ['Imam'],
            },
            {
              'id': 'shoura',
              'name': 'الشورة',
              'nameFr': 'Shoura (Achats)',
              'nameEn': 'Shoura (Purchases)',
              'culturalContext':
                  'Both families begin purchasing essential items for the wedding, including clothing, gold, and household goods.',
              'timing': '2-4 months before wedding',
              'relatedVendors': [],
            },
            {
              'id': 'hammam_day',
              'name': 'يوم الحمام',
              'nameFr': 'Jour du Hammam',
              'nameEn': 'Hammam Day',
              'culturalContext':
                  'A purification ritual where the bride visits a Turkish bath with close female relatives, symbolizing purity and good luck.',
              'timing': '1-2 weeks before wedding',
              'relatedVendors': ['Hammam'],
            },
            {
              'id': 'henna_night',
              'name': 'ليلة الحناء',
              'nameFr': 'Nuit du Henné',
              'nameEn': 'Henna Night',
              'culturalContext':
                  'A festive celebration where intricate henna designs are applied to the bride\'s hands and feet, symbolizing beauty and blessings.',
              'timing': '1-2 days before wedding',
              'relatedVendors': ['Henna Artist', 'Caterer'],
            },
          ],
        },
        {
          'id': 'wedding_day',
          'title': 'طقوس يوم الزفاف',
          'titleFr': 'Rituels du Jour du Mariage',
          'titleEn': 'Wedding Day Rituals',
          'tasks': [
            {
              'id': 'civil_marriage',
              'name': 'الزواج المدني',
              'nameFr': 'Mariage Civil',
              'nameEn': 'Civil Marriage',
              'culturalContext':
                  'The official civil marriage ceremony, which is a legal requirement.',
              'timing': 'Morning of the wedding',
              'relatedVendors': [],
            },
            {
              'id': 'fatha_ceremony',
              'name': 'حفل الفاتحة',
              'nameFr': 'Cérémonie de la Fatiha',
              'nameEn': 'Fatiha Ceremony',
              'culturalContext':
                  'The religious marriage ceremony where an Imam officiates, and the couple recites the first chapter of the Quran.',
              'timing': 'Afternoon of the wedding',
              'relatedVendors': ['Imam'],
            },
            {
              'id': 'wedding_procession',
              'name': 'موكب الزفاف',
              'nameFr': 'Procession de Mariage',
              'nameEn': 'Wedding Procession',
              'culturalContext':
                  'The bride is ceremoniously driven to the groom\'s home, accompanied by a festive procession of family and friends.',
              'timing': 'Evening',
              'relatedVendors': [],
            },
            {
              'id': 'reception_feast',
              'name': 'وليمة العرس',
              'nameFr': 'Festin de Réception',
              'nameEn': 'Reception Feast',
              'culturalContext':
                  'A large celebration with music, dancing, and a feast featuring traditional Algerian dishes.',
              'timing': 'Evening',
              'relatedVendors': ['Caterer', 'Venue', 'Band'],
            },
          ],
        },
        {
          'id': 'post_wedding',
          'title': 'طقوس ما بعد الزفاف',
          'titleFr': 'Rituels Post-Mariage',
          'titleEn': 'Post-Wedding Rituals',
          'tasks': [
            {
              'id': 'bride_arrival',
              'name': 'وصول العروس',
              'nameFr': 'Arrivée de la Mariée',
              'nameEn': 'Bride\'s Arrival',
              'culturalContext':
                  'The bride performs rituals upon entering her new home, such as drinking milk or breaking an egg on the threshold for good luck.',
              'timing': 'Night of the wedding',
              'relatedVendors': [],
            },
            {
              'id': 'day_after_celebration',
              'name': 'احتفال اليوم التالي',
              'nameFr': 'Célébration du Lendemain',
              'nameEn': 'Day-After Celebration',
              'culturalContext':
                  'A smaller gathering with close family to celebrate the new union, often involving traditional meals.',
              'timing': 'Day after the wedding',
              'relatedVendors': ['Caterer'],
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
      return (countries['MA']!['traditions'] as List<dynamic>)
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    final traditions = country['traditions'] as List<dynamic>?;
    if (traditions == null || traditions.isEmpty) {
      return (countries['MA']!['traditions'] as List<dynamic>)
          .map((e) => Map<String, dynamic>.from(e))
          .toList();
    }
    return traditions.map((e) => Map<String, dynamic>.from(e)).toList();
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
