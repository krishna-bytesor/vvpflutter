import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'gu', 'th'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? guText = '',
    String? thText = '',
  }) =>
      [enText, hiText, guText, thText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'abkxz8gy': {
      'en': 'VVPS',
      'gu': 'વીવીપીએસ',
      'hi': 'वीवीपीएस',
      'th': 'วีวีพีเอส',
    },
    'l0ift6se': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'fumgcmqu': {
      'en': 'About',
      'gu': 'વિશે',
      'hi': 'के बारे में',
      'th': 'เกี่ยวกับ',
    },
    '73i9jf4m': {
      'en': 'Books',
      'gu': 'પુસ્તકો',
      'hi': 'पुस्तकें',
      'th': 'หนังสือ',
    },
    'ie1p35tz': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    'u4qi2f9m': {
      'en': 'Video',
      'gu': 'વિડિઓ',
      'hi': 'वीडियो',
      'th': 'วีดีโอ',
    },
    'qf0jfmm3': {
      'en': 'Gallery',
      'gu': 'ગેલેરી',
      'hi': 'गैलरी',
      'th': 'แกลเลอรี่',
    },
    'fc5nfn2l': {
      'en': 'ISKCON Bangkok',
      'gu': 'ઇસ્કોન બેંગકોક',
      'hi': 'इस्कॉन बैंकॉक',
      'th': 'ISKCON กรุงเทพฯ',
    },
    'u6qtupa1': {
      'en': 'News',
      'gu': 'સમાચાર',
      'hi': 'समाचार',
      'th': 'ข่าว',
    },
    'gcqfdw7o': {
      'en': 'Featured Videos',
      'gu': 'વિશેષતા વિડિયો',
      'hi': 'चुनिंदा वीडियो',
      'th': 'วิดีโอแนะนำ',
    },
    'io6766fg': {
      'en': 'View All',
      'gu': 'બધું જુઓ',
      'hi': 'सभी को देखें',
      'th': 'ดูทั้งหมด',
    },
    'hbp8egcc': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // BooksPage
  {
    'xjm1rrph': {
      'en': 'Books',
      'gu': 'પુસ્તકો',
      'hi': 'पुस्तकें',
      'th': 'หนังสือ',
    },
    'rnxhw1dx': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // GranthrajListNOTUSED
  {
    '2issxmn7': {
      'en': 'Granthraj',
      'gu': 'ગ્રંથરાજ',
      'hi': 'ग्रन्थराज',
      'th': 'กรันธราช',
    },
    '78t2836m': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // NowPlayingPage
  {
    'o5daqsrv': {
      'en': 'Now Playing',
      'gu': 'હમણાં ચાલી રહ્યું છે',
      'hi': 'अब खेल रहे हैं',
      'th': 'กำลังเล่นอยู่',
    },
    'w44b38fc': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
  },
  // AudioCategoryPage
  {
    'j1lquyc9': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    'vzae02ob': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'tl9m7xe8': {
      'en': 'Search ',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
    '7bp5brbr': {
      'en': 'Playlist',
      'gu': 'પ્લેલિસ્ટ',
      'hi': 'प्लेलिस्ट',
      'th': 'เพลย์ลิสต์',
    },
    '0iz96rej': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // AudioList
  {
    'bqcznszn': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'jlnyz0qu': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PhotosPage
  {
    'r82kg9i5': {
      'en': 'Gallery',
      'gu': 'ગેલેરી',
      'hi': 'गैलरी',
      'th': 'แกลเลอรี่',
    },
    'fasllhzf': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // PhotoAlbum
  {
    'vyc1zkv9': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // VideosCategoryPage
  {
    'a8bgc9if': {
      'en': 'Video',
      'gu': 'વિડિઓ',
      'hi': 'वीडियो',
      'th': 'วีดีโอ',
    },
    'budesxbd': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'xqc31slc': {
      'en': 'Search ',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
    'r0nxmgut': {
      'en': 'Playlist',
      'gu': 'પ્લેલિસ્ટ',
      'hi': 'प्लेलिस्ट',
      'th': 'เพลย์ลิสต์',
    },
    'c8i8uljb': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // SplashScreen
  {
    'yujbmzcb': {
      'en': 'HH Vedavyasapriya Swami',
      'gu': 'પ.પૂ. વેદવ્યાસપ્રિય સ્વામી',
      'hi': 'परम पूज्य वेदव्यासप्रिय स्वामी',
      'th': 'HH Vedavyasapriya Swami',
    },
    '2pf5dqrx': {
      'en': 'Explore the teachings',
      'gu': 'ઉપદેશોનું અન્વેષણ કરો',
      'hi': 'शिक्षाओं का अन्वेषण करें',
      'th': 'สำรวจคำสอน',
    },
    'g0yc34y9': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PadaSevaCategoriesNOTUSED
  {
    '1byt65v6': {
      'en': 'Offerings at the ',
      'gu': 'ખાતે ઓફરો',
      'hi': 'प्रसाद',
      'th': 'การเสนอขายที่',
    },
    '7sp8oq97': {
      'en': 'Pada Seva',
      'gu': 'પદ સેવા',
      'hi': 'पद सेवा',
      'th': 'ปาดาเสวา',
    },
    'tjbsj8on': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // SettingPageNOTUSED
  {
    '5cp3qord': {
      'en': 'Get In Touch',
      'gu': 'સંપર્કમાં રહો',
      'hi': 'संपर्क में रहो',
      'th': 'ติดต่อเรา',
    },
    'bjzxmrds': {
      'en': 'Version:  1.0.1',
      'gu': 'આવૃત્તિ: 1.0.1',
      'hi': 'संस्करण: 1.0.1',
      'th': 'เวอร์ชัน : 1.0.1',
    },
    'j04tpykz': {
      'en': 'Email us',
      'gu': 'અમને ઇમેઇલ કરો',
      'hi': 'हमें ईमेल करें',
      'th': 'ส่งอีเมล์ถึงเรา',
    },
    'hk6gxeuz': {
      'en': 'Website',
      'gu': 'વેબસાઇટ',
      'hi': 'वेबसाइट',
      'th': 'เว็บไซต์',
    },
    'm571ys1l': {
      'en': 'User Guide',
      'gu': 'વપરાશકર્તા માર્ગદર્શિકા',
      'hi': 'उपयोगकर्ता गाइड',
      'th': 'คู่มือการใช้งาน',
    },
    'u6j8oloj': {
      'en': 'Share this app',
      'gu': 'આ ઍપ શેર કરો',
      'hi': 'इस ऐप को साझा करें',
      'th': 'แชร์แอปนี้',
    },
    't6uw84gk': {
      'en': 'https://www.vvpswami.com',
      'gu': 'https://www.vvpswami.com',
      'hi': 'https://www.vvpswami.com',
      'th': 'https://www.vvpswami.com',
    },
    'icx00wp9': {
      'en': 'Tips & Shortcuts',
      'gu': 'ટિપ્સ અને શોર્ટકટ્સ',
      'hi': 'टिप्स और शॉर्टकट',
      'th': 'เคล็ดลับและทางลัด',
    },
    'i2cl5z97': {
      'en': '- Play Audio',
      'gu': '- ઓડિયો ચલાવો',
      'hi': '- ऑडियो चलाएं',
      'th': '- เล่นเสียง',
    },
    'vbofr84x': {
      'en': '- Pause Audio',
      'gu': '- ઑડિઓ થોભાવો',
      'hi': '- ऑडियो रोकें',
      'th': '- หยุดเสียงชั่วคราว',
    },
    'vcmosew0': {
      'en': '- Audio forward by 10 second ',
      'gu': '- ઓડિયો ૧૦ સેકન્ડ આગળ',
      'hi': '- ऑडियो 10 सेकंड आगे',
      'th': '- เสียงเดินหน้า 10 วินาที',
    },
    'ag9v73pv': {
      'en': '- Audio rewind by 10 second ',
      'gu': '- ઓડિયો ૧૦ સેકન્ડ રીવાઇન્ડ કરો',
      'hi': '- ऑडियो 10 सेकंड पीछे',
      'th': '- ย้อนเสียง 10 วินาที',
    },
    'ff9btcjd': {
      'en': '- Add to Favorites',
      'gu': '- મનપસંદમાં ઉમેરો',
      'hi': '- पसंदीदा में जोड़े',
      'th': '- เพิ่มในรายการโปรด',
    },
    'myb4l7ub': {
      'en': '- Go to Personal Favorites/Notes Page',
      'gu': '- વ્યક્તિગત મનપસંદ/નોટ્સ પેજ પર જાઓ',
      'hi': '- व्यक्तिगत पसंदीदा/नोट्स पृष्ठ पर जाएं',
      'th': '- ไปที่หน้ารายการโปรด/บันทึกส่วนตัว',
    },
    'kc64o22p': {
      'en': '- Add Personal Note',
      'gu': '- વ્યક્તિગત નોંધ ઉમેરો',
      'hi': '- व्यक्तिगत नोट जोड़ें',
      'th': '- เพิ่มบันทึกส่วนตัว',
    },
    'y6bg3ep8': {
      'en': '- Add Personal Note',
      'gu': '- વ્યક્તિગત નોંધ ઉમેરો',
      'hi': '- व्यक्तिगत नोट जोड़ें',
      'th': '- เพิ่มบันทึกส่วนตัว',
    },
    '1bhl483c': {
      'en': '- Go to Chants Page',
      'gu': '- મંત્રો પેજ પર જાઓ',
      'hi': '- मंत्र पृष्ठ पर जाएं',
      'th': '- ไปที่หน้าบทสวด',
    },
    'ogav5eg3': {
      'en': '- Go to Home Page',
      'gu': '- હોમ પેજ પર જાઓ',
      'hi': '- मुखपृष्ठ प्र जाएं',
      'th': '- ไปที่หน้าแรก',
    },
    '9onnpi7g': {
      'en': '- Go to Search Page',
      'gu': '- શોધ પૃષ્ઠ પર જાઓ',
      'hi': '- खोज पृष्ठ पर जाएं',
      'th': '- ไปที่หน้าค้นหา',
    },
    'jvsymhee': {
      'en': 'Settings',
      'gu': 'સેટિંગ્સ',
      'hi': 'सेटिंग्स',
      'th': 'การตั้งค่า',
    },
    '5vrar7oj': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // GranthrajPage
  {
    '5oh5cft5': {
      'en': 'Granthraj',
      'gu': 'ગ્રંથરાજ',
      'hi': 'ग्रन्थराज',
      'th': 'กรันธราช',
    },
    '5zyup3r1': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PearlPage
  {
    'uxp4r3ft': {
      'en': 'Pearl',
      'gu': 'મોતી',
      'hi': 'मोती',
      'th': 'ไข่มุก',
    },
    'y24n95xu': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // IskonBkk
  {
    'qw893cg8': {
      'en': 'Projects',
      'gu': 'પ્રોજેક્ટ્સ',
      'hi': 'परियोजनाओं',
      'th': 'โครงการ',
    },
    'xj2u2ykw': {
      'en': 'ISKCON',
      'gu': 'ઇસ્કોન',
      'hi': 'इस्कॉन',
      'th': 'อิสก์คอน',
    },
    '516cn4il': {
      'en': 'Project Details',
      'gu': 'પ્રોજેક્ટ વિગતો',
      'hi': 'परियोजना विवरण',
      'th': 'รายละเอียดโครงการ',
    },
    '96lgpa8e': {
      'en': 'Plans and drawings',
      'gu': 'યોજનાઓ અને રેખાંકનો',
      'hi': 'योजनाएं और चित्र',
      'th': 'แบบแปลนและภาพวาด',
    },
    'wecsqr9j': {
      'en': 'ISKCON in Thailand',
      'gu': 'થાઇલેન્ડમાં ઇસ્કોન',
      'hi': 'थाईलैंड में इस्कॉन',
      'th': 'ISKCON ในประเทศไทย',
    },
    'gq731295': {
      'en': 'Currently offering ISKCON in Thailand Services:\n',
      'gu': 'હાલમાં થાઇલેન્ડમાં ઇસ્કોન સેવાઓ પ્રદાન કરે છે:',
      'hi': 'वर्तमान में थाईलैंड में इस्कॉन द्वारा दी जा रही सेवाएं:',
      'th': 'ปัจจุบันให้บริการ ISKCON ในประเทศไทย:',
    },
    'ek8yqkgi': {
      'en': ' • Harinama ',
      'gu': '• હરીનામા',
      'hi': '• हरिनाम',
      'th': '• ฮารินามะ',
    },
    'v6gfqfr6': {
      'en':
          '— Coupled with book distribution, our weekly harinama offers the opportunity for the transcendental sound vibration to percolate and sanctify the atmosphere far and wide.\n',
      'gu':
          '— પુસ્તક વિતરણ સાથે, અમારું સાપ્તાહિક હરિનામ દિવ્ય ધ્વનિ સ્પંદનોને વાતાવરણને દૂર દૂર સુધી પ્રસરી અને પવિત્ર કરવાની તક આપે છે.',
      'hi':
          '- पुस्तक वितरण के साथ-साथ हमारा साप्ताहिक हरिनाम दिव्य ध्वनि कम्पन को वातावरण में दूर-दूर तक फैलने और उसे पवित्र करने का अवसर प्रदान करता है।',
      'th':
          '— ควบคู่ไปกับการแจกหนังสือ การทำสมาธิแบบ Harinama รายสัปดาห์ของเรายังเปิดโอกาสให้คลื่นเสียงอันศักดิ์สิทธิ์แพร่กระจายไปทั่วและสร้างความบริสุทธิ์ให้กับบรรยากาศทั่วทุกแห่ง',
    },
    'l6oircqh': {
      'en': ' • Book distribution',
      'gu': '• પુસ્તક વિતરણ',
      'hi': '• पुस्तक वितरण',
      'th': '• การจัดจำหน่ายหนังสือ',
    },
    'w2c7p6gh': {
      'en':
          '— A central objective of our centre being educational, we see the outreach of book distribution bringing our educational goals to the community at large. The transcendental books of His Divine Grace A. C. Bhaktivedanta Swami Prabhupada are a treasure for all seekers of the absolute truth.\n',
      'gu':
          '— અમારા કેન્દ્રનો મુખ્ય ઉદ્દેશ્ય શૈક્ષણિક છે, અમે પુસ્તક વિતરણનો વ્યાપ આપણા શૈક્ષણિક ધ્યેયોને મોટા પાયે સમુદાય સુધી પહોંચાડતો જોઈએ છીએ. તેમના દિવ્ય કૃપા એ.સી. ભક્તિવેદાંત સ્વામી પ્રભુપાદના દિવ્ય પુસ્તકો સંપૂર્ણ સત્યના બધા શોધકો માટે એક ખજાનો છે.',
      'hi':
          '— हमारे केंद्र का मुख्य उद्देश्य शिक्षा है, हम देखते हैं कि पुस्तक वितरण का कार्य हमारे शिक्षा संबंधी लक्ष्यों को बड़े पैमाने पर समुदाय तक पहुंचा रहा है। परम पूज्य ए.सी. भक्तिवेदांत स्वामी प्रभुपाद की दिव्य पुस्तकें परम सत्य के सभी साधकों के लिए एक खजाना हैं।',
      'th':
          'เป้าหมายหลักของศูนย์ของเราคือการให้ความรู้ เราเห็นว่าการแจกจ่ายหนังสือช่วยให้เป้าหมายด้านการศึกษาของเราเข้าถึงชุมชนในวงกว้าง หนังสือเกี่ยวกับอภิธรรมของพระคุณอันศักดิ์สิทธิ์ของพระองค์ A. C. Bhaktivedanta Swami Prabhupada เป็นสมบัติล้ำค่าสำหรับผู้แสวงหาสัจธรรมอันบริสุทธิ์ทุกคน',
    },
    'bvbebxkt': {
      'en': '• Place of worship programs and activities  ',
      'gu': '• પૂજા સ્થળના કાર્યક્રમો અને પ્રવૃત્તિઓ',
      'hi': '• पूजा स्थल के कार्यक्रम और गतिविधियाँ',
      'th': '• โครงการและกิจกรรมสถานที่ประกอบพิธีกรรม',
    },
    '14d9jbrq': {
      'en':
          '— Our daily programs will enthuse you throughout the day, from early morning Mangalarti to evening Shayan arti. Take the opportunity to sponsor some bhog offerings for our deities. \n',
      'gu':
          '— અમારા દૈનિક કાર્યક્રમો તમને દિવસભર ઉત્સાહિત કરશે, વહેલી સવારની મંગળઆરતીથી સાંજની શયન આરતી સુધી. આપણા દેવતાઓ માટે ભોગ પ્રસાદનું આયોજન કરવાની તકનો લાભ લો.',
      'hi':
          '— हमारे दैनिक कार्यक्रम आपको पूरे दिन उत्साहित रखेंगे, सुबह की मंगलआरती से लेकर शाम की शयन आरती तक। हमारे देवताओं के लिए कुछ भोग अर्पित करने का अवसर लें।',
      'th':
          'โปรแกรมประจำวันของเราจะทำให้คุณรู้สึกตื่นเต้นตลอดทั้งวัน ตั้งแต่เช้าตรู่ของมังคลาติไปจนถึงงานสวดมนต์ตอนเย็นของชายัน ใช้โอกาสนี้สนับสนุนการถวายเครื่องบูชาโภคเพื่อบูชาเทพเจ้าของเรา',
    },
    'mgpcvpp4': {
      'en': ' •  Major festivals',
      'gu': '• મુખ્ય તહેવારો',
      'hi': '• प्रमुख त्यौहार',
      'th': '• เทศกาลสำคัญต่างๆ',
    },
    '8hyui7u2': {
      'en':
          '— Central to our Palace of Worship for our deities is the opportunity to attend all the major Vedic religious and cultural festivals. Be part of the vibrant atmosphere of these festivals.\n',
      'gu':
          '— આપણા દેવી-દેવતાઓના પૂજા મહેલનું કેન્દ્રબિંદુ એ છે કે આપણે બધા મુખ્ય વૈદિક ધાર્મિક અને સાંસ્કૃતિક તહેવારોમાં હાજરી આપી શકીએ. આ તહેવારોના જીવંત વાતાવરણનો ભાગ બનો.',
      'hi':
          '— हमारे देवताओं के लिए पूजा के हमारे महल का मुख्य आकर्षण सभी प्रमुख वैदिक धार्मिक और सांस्कृतिक उत्सवों में भाग लेने का अवसर है। इन उत्सवों के जीवंत माहौल का हिस्सा बनें।',
      'th':
          'ศูนย์กลางของพระราชวังสำหรับบูชาเทพเจ้าของเราคือโอกาสในการเข้าร่วมงานเทศกาลทางศาสนาและวัฒนธรรมสำคัญๆ ของพระเวท มาร่วมเป็นส่วนหนึ่งของบรรยากาศที่มีชีวิตชีวาของงานเทศกาลเหล่านี้',
    },
    'l73lnv7v': {
      'en':
          ' • Congregation development through Bhakti Vriksha programs & youth preaching',
      'gu': '• ભક્તિ વૃક્ષ કાર્યક્રમો અને યુવા પ્રચાર દ્વારા મંડળી વિકાસ',
      'hi':
          '• भक्ति वृक्ष कार्यक्रमों और युवा प्रवचनों के माध्यम से मण्डली का विकास',
      'th': '• การพัฒนาชุมชนผ่านโครงการ Bhakti Vriksha และการเทศนาของเยาวชน',
    },
    'ljcn19st': {
      'en':
          ' in university campuses. — We aim to extend our outreach to all the people of Thailand through structured preaching programs for both youth as well as family and local community oriented projects.\n',
      'gu':
          'યુનિવર્સિટી કેમ્પસમાં. — અમારું લક્ષ્ય યુવાનો તેમજ પરિવાર અને સ્થાનિક સમુદાય લક્ષી પ્રોજેક્ટ્સ બંને માટે માળખાગત પ્રચાર કાર્યક્રમો દ્વારા થાઇલેન્ડના તમામ લોકો સુધી અમારી પહોંચ વિસ્તારવાનું છે.',
      'hi':
          'विश्वविद्यालय परिसरों में। - हमारा लक्ष्य युवाओं के साथ-साथ परिवार और स्थानीय समुदाय उन्मुख परियोजनाओं के लिए संरचित प्रचार कार्यक्रमों के माध्यम से थाईलैंड के सभी लोगों तक अपनी पहुंच बढ़ाना है।',
      'th':
          'ในมหาวิทยาลัย - เรามุ่งหวังที่จะขยายการเข้าถึงของเราไปยังคนทุกคนในประเทศไทยผ่านโครงการการเทศนาที่มีโครงสร้างชัดเจนสำหรับทั้งเยาวชน ครอบครัว และโครงการที่มุ่งเน้นชุมชนท้องถิ่น',
    },
    '3fbomshf': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '9a9vqf81': {
      'en':
          'More Services to be offered by Sri Sri Radhesiam Royal Palace, Vedic Cultural, Educational Centre and Guest House at 62/1 Sukhumvit: \n\n',
      'gu':
          'શ્રી શ્રી રાધેશિયમ રોયલ પેલેસ, વૈદિક સાંસ્કૃતિક, શૈક્ષણિક કેન્દ્ર અને 62/1 સુખુમવિત ખાતે ગેસ્ટ હાઉસ દ્વારા વધુ સેવાઓ આપવામાં આવશે:',
      'hi':
          'श्री श्री राधेश्याम रॉयल पैलेस, वैदिक सांस्कृतिक, शैक्षिक केंद्र और गेस्ट हाउस, 62/1 सुखुमवित द्वारा प्रदान की जाने वाली अन्य सेवाएं:',
      'th':
          'บริการเพิ่มเติมจากพระราชวังศรีศรีราเธสยาม ศูนย์วัฒนธรรมและการศึกษาด้านพระเวท และเกสต์เฮาส์ที่ 62/1 สุขุมวิท:',
    },
    'spx7xzly': {
      'en': 'Construction project \n',
      'gu': 'બાંધકામ પ્રોજેક્ટ',
      'hi': 'निर्माण प्रोजेक्ट',
      'th': 'โครงการก่อสร้าง',
    },
    'vaiqtt7v': {
      'en': 'Currently ongoing with expectation of completion by 2030. \n',
      'gu': 'હાલમાં ચાલુ છે અને 2030 સુધીમાં પૂર્ણ થવાની અપેક્ષા છે.',
      'hi':
          'वर्तमान में यह कार्य चल रहा है और 2030 तक इसके पूरा होने की उम्मीद है।',
      'th': 'ขณะนี้กำลังดำเนินการอยู่ คาดว่าจะแล้วเสร็จภายในปี 2573',
    },
    'f6ldqm85': {
      'en': 'Services available on completion; \n  • School ',
      'gu': 'પૂર્ણ થવા પર ઉપલબ્ધ સેવાઓ; \n • શાળા',
      'hi': 'पूरा होने पर उपलब्ध सेवाएँ; \n • स्कूल',
      'th': 'บริการที่มีให้เมื่อเสร็จสิ้น \n • โรงเรียน',
    },
    'rl30o096': {
      'en':
          '— A Vedic parochial school will give your children a structured environment in which to imbibe Vedic cultural values and a thirst for education. \n',
      'gu':
          '— વૈદિક સંકુચિત શાળા તમારા બાળકોને વૈદિક સાંસ્કૃતિક મૂલ્યો અને શિક્ષણની તરસને આત્મસાત કરવા માટે એક સુવ્યવસ્થિત વાતાવરણ આપશે.',
      'hi':
          '— एक वैदिक पारोचियल स्कूल आपके बच्चों को एक संरचित वातावरण प्रदान करेगा जिसमें वे वैदिक सांस्कृतिक मूल्यों को आत्मसात करेंगे और शिक्षा के प्रति उनकी प्यास बढ़ेगी।',
      'th':
          'โรงเรียนประจำนิกายพระเวทจะให้สภาพแวดล้อมที่เป็นระบบแก่ลูกๆ ของคุณในการซึมซับค่านิยมทางวัฒนธรรมของพระเวทและความกระหายในการศึกษา',
    },
    'pptnfz2b': {
      'en': '  • Educational projects, seminars.',
      'gu': '• શૈક્ષણિક પ્રોજેક્ટ્સ, સેમિનાર.',
      'hi': '• शैक्षिक परियोजनाएं, सेमिनार।',
      'th': '• โครงการด้านการศึกษา,สัมมนา',
    },
    'y0b43vw3': {
      'en':
          '— Our central theme of education will bring you in touch with the full range of Vedic wisdom, in various seminars and projects to fit in with your schedule. You can learn to transform your life to a healthier, more balanced and peaceful life, and gain understanding of the nature of this world in reality. \n',
      'gu':
          '— શિક્ષણનો અમારો મુખ્ય વિષય તમને તમારા સમયપત્રક સાથે બંધબેસતા વિવિધ સેમિનાર અને પ્રોજેક્ટ્સમાં વૈદિક જ્ઞાનની સંપૂર્ણ શ્રેણી સાથે સંપર્કમાં લાવશે. તમે તમારા જીવનને સ્વસ્થ, વધુ સંતુલિત અને શાંતિપૂર્ણ જીવનમાં પરિવર્તિત કરવાનું શીખી શકો છો, અને વાસ્તવિકતામાં આ વિશ્વની પ્રકૃતિની સમજ મેળવી શકો છો.',
      'hi':
          '— शिक्षा का हमारा मुख्य विषय आपको वैदिक ज्ञान की पूरी श्रृंखला से परिचित कराएगा, आपके शेड्यूल के अनुसार विभिन्न सेमिनारों और परियोजनाओं में। आप अपने जीवन को अधिक स्वस्थ, अधिक संतुलित और शांतिपूर्ण जीवन में बदलना सीख सकते हैं, और वास्तविकता में इस दुनिया की प्रकृति को समझ सकते हैं।',
      'th':
          '— หัวข้อหลักด้านการศึกษาของเราจะทำให้คุณได้สัมผัสกับภูมิปัญญาพระเวทอย่างครบถ้วนในสัมมนาและโครงการต่างๆ เพื่อให้เหมาะกับตารางเวลาของคุณ คุณสามารถเรียนรู้ที่จะเปลี่ยนแปลงชีวิตของคุณให้มีสุขภาพดีขึ้น สมดุลมากขึ้น และสงบสุขมากขึ้น และเข้าใจธรรมชาติของโลกนี้ในความเป็นจริง',
    },
    '7kj1ipii': {
      'en': '  •  Food for life ',
      'gu': '• જીવન માટે ખોરાક',
      'hi': '• जीवन के लिए भोजन',
      'th': '• อาหารเพื่อชีวิต',
    },
    '48iu4dsu': {
      'en':
          '— In our Food for Life program we bring the sanctified food of top class standard to various people who benefit greatly, like school children as well as distressed and disadvantaged communities. \n',
      'gu':
          '— અમારા ફૂડ ફોર લાઇફ પ્રોગ્રામમાં અમે ઉચ્ચ કક્ષાના પવિત્ર ખોરાકને વિવિધ લોકો માટે લાવીએ છીએ જેમને ખૂબ ફાયદો થાય છે, જેમ કે શાળાના બાળકો તેમજ પીડિત અને વંચિત સમુદાયો.',
      'hi':
          '- हमारे फूड फॉर लाइफ कार्यक्रम में हम उच्च श्रेणी के मानक का पवित्र भोजन विभिन्न लोगों तक पहुंचाते हैं, जिन्हें इससे बहुत लाभ होता है, जैसे स्कूली बच्चे तथा संकटग्रस्त और वंचित समुदाय।',
      'th':
          '— ในโครงการอาหารเพื่อชีวิตของเรา เราส่งมอบอาหารศักดิ์สิทธิ์ที่ได้มาตรฐานชั้นยอดให้กับผู้คนต่างๆ ที่ได้รับประโยชน์มากมาย เช่น เด็กนักเรียน ตลอดจนชุมชนที่เดือดร้อนและด้อยโอกาส',
    },
    'xipjpdmn': {
      'en': '  • Guest House facilities',
      'gu': '• ગેસ્ટ હાઉસ સુવિધાઓ',
      'hi': '• गेस्ट हाउस सुविधाएं',
      'th': '• สิ่งอำนวยความสะดวกในเกสต์เฮาส์',
    },
    'k4l4dlej': {
      'en':
          '— Discover our guesthouse, boasting over 70 spacious rooms. Be near our Vedic centre and savour the flavours of Govinda\'s restaurant for an unforgettable experience.\n',
      'gu':
          '— અમારા ગેસ્ટહાઉસની શોધ કરો, જેમાં 70 થી વધુ જગ્યા ધરાવતા રૂમ છે. અમારા વૈદિક કેન્દ્રની નજીક આવો અને એક અવિસ્મરણીય અનુભવ માટે ગોવિંદાના રેસ્ટોરન્ટના સ્વાદનો સ્વાદ માણો.',
      'hi':
          '— हमारे गेस्टहाउस में 70 से ज़्यादा विशाल कमरे हैं। हमारे वैदिक केंद्र के नज़दीक रहें और गोविंदा के रेस्तरां के स्वाद का लुत्फ़ उठाएँ और एक अविस्मरणीय अनुभव पाएँ।',
      'th':
          '— พบกับเกสต์เฮาส์ของเราที่มีห้องพักกว้างขวางกว่า 70 ห้อง อยู่ใกล้กับศูนย์พระเวทของเราและลิ้มรสอาหารจากร้านอาหาร Govinda เพื่อประสบการณ์ที่ไม่มีวันลืม',
    },
    'gtdkuc54': {
      'en': '  • Restaurant and Prasadam stalls.',
      'gu': '• રેસ્ટોરન્ટ અને પ્રસાદમના સ્ટોલ.',
      'hi': '• रेस्तरां और प्रसादम स्टॉल।',
      'th': '• ร้านอาหาร และแผงขายของปราสาท',
    },
    '3q4vj8tm': {
      'en':
          '— Discover a world of sanctified food and varied cuisine at the centre’s renowned restaurant and food stalls. Delight your tastebuds and enjoy great service in a vibrant atmosphere.\n',
      'gu':
          '— સેન્ટરના પ્રખ્યાત રેસ્ટોરન્ટ અને ફૂડ સ્ટોલ્સ પર પવિત્ર ખોરાક અને વૈવિધ્યસભર ભોજનની દુનિયા શોધો. તમારા સ્વાદને આનંદિત કરો અને જીવંત વાતાવરણમાં ઉત્તમ સેવાનો આનંદ માણો.',
      'hi':
          '— केंद्र के प्रसिद्ध रेस्तरां और खाद्य स्टालों पर पवित्र भोजन और विविध व्यंजनों की दुनिया की खोज करें। अपने स्वाद को खुश करें और जीवंत वातावरण में बेहतरीन सेवा का आनंद लें।',
      'th':
          'พบกับโลกแห่งอาหารอันศักดิ์สิทธิ์และอาหารหลากหลายที่ร้านอาหารและแผงขายอาหารชื่อดังของศูนย์ ลิ้มรสชาติอาหารอันแสนอร่อยและเพลิดเพลินไปกับบริการอันยอดเยี่ยมในบรรยากาศที่มีชีวิตชีวา',
    },
    'p3t30c14': {
      'en': '  • Model of the Structure of the Material and Spiritual Worlds',
      'gu': '• ભૌતિક અને આધ્યાત્મિક વિશ્વોની રચનાનું મોડેલ',
      'hi': '• भौतिक और आध्यात्मिक दुनिया की संरचना का मॉडल',
      'th': '• แบบจำลองโครงสร้างโลกแห่งวัตถุและจิตวิญญาณ',
    },
    'an05ik3o': {
      'en':
          'for the education of the people — Based on the Goloka Chart as described in the Brahma Samhita, a full display of the material and spiritual worlds depicting the abodes of those devatas already dear to the people of Thailand — Brahma, Indra, Siva etc, — and showing the eternal realm of the original Personality of Godhead, Lord Sri Krishna, Sri Sri Radhe Siam.\n\n',
      'gu':
          'લોકોના શિક્ષણ માટે — બ્રહ્મ સંહિતામાં વર્ણવેલ ગોલોક ચાર્ટ પર આધારિત, ભૌતિક અને આધ્યાત્મિક વિશ્વોનું સંપૂર્ણ પ્રદર્શન જે થાઇલેન્ડના લોકોને પહેલાથી જ પ્રિય એવા દેવતાઓ - બ્રહ્મા, ઇન્દ્ર, શિવ વગેરે - ના નિવાસસ્થાનો દર્શાવે છે અને મૂળ વ્યક્તિત્વ ભગવાન શ્રી કૃષ્ણ, શ્રી શ્રી રાધે સિયામના શાશ્વત ક્ષેત્રને દર્શાવે છે.',
      'hi':
          'लोगों की शिक्षा के लिए - ब्रह्म संहिता में वर्णित गोलोक चार्ट के आधार पर, भौतिक और आध्यात्मिक दुनिया का एक पूर्ण प्रदर्शन, जो थाईलैंड के लोगों के लिए पहले से ही प्रिय देवताओं - ब्रह्मा, इंद्र, शिव आदि के निवास को दर्शाता है - और मूल भगवान श्री कृष्ण, श्री श्री राधे स्याम के शाश्वत क्षेत्र को दर्शाता है।',
      'th':
          'เพื่อการศึกษาของผู้คน — อ้างอิงจาก Goloka Chart ตามที่อธิบายไว้ใน Brahma Samhita ซึ่งเป็นการแสดงโลกแห่งวัตถุและจิตวิญญาณอย่างครบถ้วน ซึ่งแสดงถึงที่อยู่ของเทวดาเหล่านั้นที่ประชาชนชาวไทยรักอยู่แล้ว — พระพรหม พระอินทร์ พระศิวะ เป็นต้น — และแสดงให้เห็นอาณาจักรนิรันดร์ของบุคลิกภาพที่เป็นพระเจ้าองค์ดั้งเดิม พระเจ้าศรีกฤษณะ ศรีศรีราเธสยาม',
    },
    'owsx58m7': {
      'en':
          'We are currently working to establish good relationships with the Thai Government Ministry for Culture and Religion, with the King and his Raja Guru, with the Indian Ambassador, with the existing cultural and religious organisations in Thailand; and with the local Thai community as well as Indian, Burmese, Nepalese diaspora. We will offer Vedic Cultural and Educational festivals for all and encourage spiritual tourism amount the devotees and Thai people. ',
      'gu':
          'અમે હાલમાં થાઈ સરકારના સંસ્કૃતિ અને ધર્મ મંત્રાલય, રાજા અને તેમના રાજા ગુરુ, ભારતીય રાજદૂત, થાઈલેન્ડમાં હાલના સાંસ્કૃતિક અને ધાર્મિક સંગઠનો અને સ્થાનિક થાઈ સમુદાય તેમજ ભારતીય, બર્મીઝ, નેપાળી ડાયસ્પોરા સાથે સારા સંબંધો સ્થાપિત કરવા માટે કામ કરી રહ્યા છીએ. અમે બધા માટે વૈદિક સાંસ્કૃતિક અને શૈક્ષણિક ઉત્સવો યોજીશું અને ભક્તો અને થાઈ લોકો માટે આધ્યાત્મિક પ્રવાસનને પ્રોત્સાહન આપીશું.',
      'hi':
          'हम वर्तमान में थाई सरकार के संस्कृति और धर्म मंत्रालय, राजा और उनके राज गुरु, भारतीय राजदूत, थाईलैंड में मौजूदा सांस्कृतिक और धार्मिक संगठनों और स्थानीय थाई समुदाय के साथ-साथ भारतीय, बर्मी, नेपाली प्रवासियों के साथ अच्छे संबंध स्थापित करने के लिए काम कर रहे हैं। हम सभी के लिए वैदिक सांस्कृतिक और शैक्षिक उत्सवों की पेशकश करेंगे और भक्तों और थाई लोगों के बीच आध्यात्मिक पर्यटन को प्रोत्साहित करेंगे।',
      'th':
          'ขณะนี้เรากำลังดำเนินการสร้างความสัมพันธ์อันดีกับกระทรวงวัฒนธรรมและศาสนาของรัฐบาลไทย กับพระมหากษัตริย์และพระครูของพระองค์ กับเอกอัครราชทูตอินเดีย กับองค์กรด้านวัฒนธรรมและศาสนาที่มีอยู่ในประเทศไทย และกับชุมชนไทยในท้องถิ่น รวมถึงชาวอินเดีย พม่า และเนปาลที่อพยพไปอยู่ต่างประเทศ เราจะจัดเทศกาลทางวัฒนธรรมและการศึกษาพระเวทสำหรับทุกคน และส่งเสริมการท่องเที่ยวเชิงจิตวิญญาณให้กับผู้ศรัทธาและชาวไทย',
    },
    'cciy6dep': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '2g50pebm': {
      'en': 'Goloka Chart',
      'gu': 'ગોલોકા ચાર્ટ',
      'hi': 'गोलोक चार्ट',
      'th': 'แผนภูมิโกโลกา',
    },
    'x3dhrzuw': {
      'en': 'Letter to Pancadravida',
      'gu': 'પંચદ્રવિદને પત્ર',
      'hi': 'पंचद्रविडा को पत्र',
      'th': 'จดหมายถึงปัญจวาดา',
    },
    'avg5bywp': {
      'en':
          'Letter to: Pancadravida\n\nDated: Nov. 24, 1974\n\nLocation: Bombay\n\nLetter to: Pancadravida\n\n74-11-24\n\nBangkok\n\nMy Dear Pancadravida Swami:\n\nPlease accept my blessings…\n\nWhere-ever Krishna desires we will preach this movement. Try your best to establish a center in Bangkok…\n\nSo take this as Krishna\'s desire, and we are servants of Krishna, so our only business is to try to satisfy Him. You are a sannyasi and I have got full confidence in you that you can do very nicely there. Everywhere this movement is accepted, so please keep me informed what is the progress there.\n\nI hope this meets you in good health.\n\nYour ever well-wisher,\nA.C. Bhaktivedanta Swami\n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\nLetter to: People of Bangkok\n\nDated: Dec. 14, 1974\n\nLocation: Bombay\n\nLetter to: People of Bangkok\n\n74-12-14\n\nBangkok\n\nTo the People of Bangkok, Thailand\n\nPlease accept my best wishes. I am sorry I am not able to come but I must remain here in Bombay for some pressing matters. So I am sending my secretary His Holiness Brahmananda Maharaja who will represent me.\n\nThe Krishna Consciousness mission is not sectarian. We want to do what the United Nations has failed to do. The human form of body is an opportunity for solving all the problems of life. Through evolution we come to the human life for solving this problem. The real problem is the repetition of birth, death, disease, and old age.\n\nBut there is another status of life where there is no birth, death, disease, and old age. The Krishna Consciousness movement is the means for promoting the human being to that status. This is a great science, and it is elaborately explained in the Bhagavad-gita.\n\nSo our mission is to give this benediction to all humanity. Let us cooperate together on this basis so that it will be a more effective United Nations, We shall be united on the basis of the prime need of human society, spiritual life.\n\nI hope this meets you all well.\n\nFaithfully yours,\n\nA.C. Bhaktivedanta Swami\n\n \n\n \n\nRoom Conversation\n\nType: Conversation\n\nDate: July 31, 1976\n\nLocation: New Māyāpur\n\nAudio file: audio/transcripts/1976/760731R1.NMR.mp3\n\n \n\nYogeśvara: ...hand-loomed silk.\n\nPrabhupāda: Thailand silk. [coughing]\n\nYogeśvara: Yes. He has invited me to go to Thailand to meet the Prime Minister in October.\n\nPrabhupāda: Oh, if there is interview, you must go.\n\nYogeśvara: Yes. Perhaps you would like to tell me on what level I should present our movement.\n\nPrabhupāda: On the level of Bhagavad-gītā. God is the supreme controller, and we have to learn how to remain peacefully under the supreme controller. Just like citizens and the government. Good citizenship means one who lives under the control of the government. Similarly, good person means one is God conscious and lives according to the instruction of God. So there is instruction of God, [coughing] we are presenting this all over the world.\n\nYogeśvara: And they should give us some facilities?\n\nPrabhupāda: Yes. \"We want to preach. Here also, if you give us facility, we can preach. That is after your interest.\"\n\nYogeśvara: This one gentleman has already offered one house in Bangkok. He\'s put at our disposal, in the middle of the city, a very beautiful house.\n\nPrabhupāda: Oh, that is very nice.\n\nYogeśvara: But now I\'m wondering how should this should be managed, who should take charge of this project.\n\nPrabhupāda: No, we can send some men from India. Bangkok is not far away from India. If we get a living place, then we can find out. When there are rice thrown, the crows will come. If there is no rice, how the crows will come? This is the philosophy. [laughter] If there is living place, then many crows will come.\n\nYogeśvara: So we can first go and see the situation and then contact our men in India.\n\nPrabhupāda: Yes, yes. Men will be supplied from India. What is his name? Send him some thanks.\n\nYogeśvara: Yes, Mr. Boonsoong. I\'ll give it to you now. Jaya, very nice.\n\nPrabhupāda: He\'s a Hong Kong man?\n\nYogeśvara: No, he is from Thailand.\n\nPrabhupāda: Oh, yes, Bangkok.\n\nYogeśvara: And he\'s a multimillionaire. He owns approximately one third of all the land in Thailand.\n\nPrabhupāda: Oh!\n\nHari-śauri: Very important man.\n\nYogeśvara: Chairman of many big businesses.\n\nPrabhupāda: You have given books?\n\nYogeśvara: He has received books.\n\nPrabhupāda: Where you met him?\n\nYogeśvara: His former secretary is now a devotee in this temple. She is from Thailand. And when he came to visit her in Paris, she introduced me to him, and since then he has spoken about us to his family, to businessmen. Many big people in Thailand.\n\nHari-śauri: People in Thailand are quite pious.\n\nPrabhupāda: Yes. They are Indian culture. Their original culture is Indian. It is called Siam [pronounces like Śyām], Kṛṣṇa\'s name. And they have got the airplane, Garuda.\n\nHari-śauri: Yes. Garuda Airlines.\n\nPrabhupāda: So they are devotees originally, all Kṛṣṇa devotees.\n\nYogeśvara: The king is speaking Sanskrit.\n\nPrabhupāda: Yes. It was known. It has been changed now. Formerly, [coughing] it was known as Syam state, Siam. Syam is the name of Kṛṣṇa. Whole state was named under that Kṛṣṇa. So, and they manufacture very nice idol of Rādhā-Kṛṣṇa. They\'re accustomed.\n\nHari-śauri: They have a very strong Buddhist influence there now.\n\nPrabhupāda: Huh?\n\nHari-śauri: Buddhist.\n\nPrabhupāda: Later on, they became Buddhist, but originally they were Vaiṣṇava.\n\nYogeśvara: So they will not make some objection if they are thinking we have come to preach Hinduism in a Buddhist country?\n\nPrabhupāda: It is not... Don\'t establish Deity. Talk on philosophy.\n\nYogeśvara: \"God is the supreme controller.\"\n\nPrabhupāda: Yes. We accept Lord Buddha as incarnation of God. Show in our books that we have got all respect for Buddha. We do not disrespect Lord Buddha, neither go against him. [coughing] Anyway, if we get one house to live and a supporter, a big supporter, then our position will be secure. And if our cause is honest, then nobody can check.\n\nYogeśvara: He has said that first I should come and speak to the Prime Minister and then speak at the University, and then see the reaction, and then we can go to see the king and say that this has been the reaction at the universities.\n\nPrabhupāda: Yes. Do it organizedly. They understand French language?\n\nYogeśvara: Yes, English and French. They are very close to Vietnam. They speak French.\n\nPrabhupāda: Very good. Take this opportunity. [coughing]\n\nYogeśvara: Hare Kṛṣṇa.\n\nPrabhupāda: Hare Kṛṣṇa. Jaya. [end]\n\n \n\n \n\nLetter to: Mr. Jootee Boonsoong\n\nDated: Aug. 1, 1976\n\nLocation: Valencay, France\n\nLetter to: Mr. Jootee Boonsoong\n\n76-08-01\n\nDear Mr. Boonsoong,\n\nPlease accept my blessings. I beg to acknowledge receipt of your nice gift of silk cloth which has been presented to me by my disciple Yogesvara Das. He has also spoken to me of your interest in the activities of our movement. I thank you very much.\n\nThis Krsna Consciousness Movement is based on the Bhagavad-gita As It Is. We have attempted to present this great philosophy to the world in a pure way, without material motive, and by the grace of Lord Krsna our effort has come out successful. People everywhere are taking to Krsna Consciousness, following the simple principles, and becoming happy. At least no one has ever seen such high character as in our boys and girls. And thoughtful men like yourself are appreciating.\n\nAgain, my thanks for your consideration. Hoping this meets you in good health.\n\nYour ever well-wisher,\nA.C. Bhaktivedanta Swami\n\n \n\n ',
      'gu':
          'પત્ર: પંચદ્રવિડા\n\n તારીખ: ૨૪ નવેમ્બર, ૧૯૭૪\n\n સ્થાન: બોમ્બે\n\n પત્ર: પંચદ્રવિડા\n\n૭૪-૧૧-૨૪\n\nબેંગકોક\n\n મારા પ્રિય પંચદ્રવિડા સ્વામી:\n\n કૃપા કરીને મારા આશીર્વાદ સ્વીકારો...\n\nજ્યાં-જ્યાં કૃષ્ણ ઈચ્છે ત્યાં અમે આ ચળવળનો પ્રચાર કરીશું. બેંગકોકમાં એક કેન્દ્ર સ્થાપિત કરવા માટે તમારા શ્રેષ્ઠ પ્રયાસો કરો...\n\n તો આને કૃષ્ણની ઇચ્છા માનો, અને અમે કૃષ્ણના સેવકો છીએ, તેથી અમારું એકમાત્ર કાર્ય તેમને સંતુષ્ટ કરવાનો પ્રયાસ કરવાનું છે. તમે સન્યાસી છો અને મને તમારામાં પૂર્ણ વિશ્વાસ છે કે તમે ત્યાં ખૂબ જ સારી રીતે કાર્ય કરી શકો છો. આ ચળવળ દરેક જગ્યાએ સ્વીકારાય છે, તેથી કૃપા કરીને મને ત્યાં શું પ્રગતિ થઈ છે તેની જાણ કરતા રહો.\n\nમને આશા છે કે આ તમને સારા સ્વાસ્થ્યમાં મળશે.\n\nતમારા હંમેશા શુભેચ્છક,\nએ.સી. ભક્તિવેદાંત સ્વામી\n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n પત્ર: બેંગકોકના લોકોને\n\n તારીખ: ૧૪ ડિસેમ્બર, ૧૯૭૪\n\n સ્થાન: બોમ્બે\n\n પત્ર: બેંગકોકના લોકોને\n\n૭૪-૧૨-૧૪\n\nબેંગકોકના લોકોને\n\n કૃપા કરીને મારી શુભેચ્છાઓ સ્વીકારો. મને દુઃખ છે કે હું આવી શકતો નથી, પણ મારે કેટલીક મહત્વપૂર્ણ બાબતોને કારણે અહીં મુંબઈમાં રહેવું પડશે. તેથી હું મારા સચિવ પરમ પૂજ્ય બ્રહ્માનંદ મહારાજને મોકલી રહ્યો છું જે મારું પ્રતિનિધિત્વ કરશે.\n\nકૃષ્ણ ભાવનામૃત મિશન સાંપ્રદાયિક નથી. આપણે એ કરવા માંગીએ છીએ જે સંયુક્ત રાષ્ટ્ર કરવામાં નિષ્ફળ ગયું છે. માનવ શરીર એ જીવનની બધી સમસ્યાઓ ઉકેલવાની તક છે. ઉત્ક્રાંતિ દ્વારા આપણે આ સમસ્યા ઉકેલવા માટે માનવ જીવનમાં આવીએ છીએ. વાસ્તવિક સમસ્યા જન્મ, મૃત્યુ, રોગ અને વૃદ્ધાવસ્થાનું પુનરાવર્તન છે.\n\nપરંતુ જીવનની બીજી સ્થિતિ છે જ્યાં જન્મ, મૃત્યુ, રોગ અને વૃદ્ધાવસ્થા નથી. કૃષ્ણ ભાવનામૃત આંદોલન એ માનવીને તે સ્થિતિ સુધી પહોંચાડવાનું માધ્યમ છે. આ એક મહાન વિજ્ઞાન છે, અને તે ભગવદ-ગીતામાં વિગતવાર સમજાવાયેલ છે.\n\nતેથી અમારું ધ્યેય સમગ્ર માનવતાને આ આશીર્વાદ આપવાનું છે. ચાલો આપણે આ આધારે સાથે મળીને સહકાર આપીએ જેથી તે વધુ અસરકારક સંયુક્ત રાષ્ટ્ર બને, આપણે માનવ સમાજની મુખ્ય જરૂરિયાત, આધ્યાત્મિક જીવનના આધારે એક થઈશું.\n\nમને આશા છે કે આ તમને બધાને સારી રીતે મળશે.\n\nવિશ્વાસપૂર્વક તમારું,\n\nએ.સી. ભક્તિવેદાંત સ્વામી\n\n \n\n \n\nરૂમમાં વાતચીત\n\nપ્રકાર: વાતચીત\n\nતારીખ: ૩૧ જુલાઈ, ૧૯૭૬\n\nસ્થાન: નવું માયાપુર\n\nઓડિયો ફાઇલ: audio/transcripts/1976/760731R1.NMR.mp3\n\n \n\nયોગેશવર: ...હાથથી બનાવેલ સિલ્ક.\n\nપ્રભુપાદ: થાઈલેન્ડ સિલ્ક. [ખાંસી]\n\nયોગેશવર: હા. તેમણે મને ઓક્ટોબરમાં પ્રધાનમંત્રીને મળવા માટે થાઈલેન્ડ જવાનું આમંત્રણ આપ્યું છે.\n\nપ્રભુપાદ: ઓહ, જો ઇન્ટરવ્યુ હોય, તો તમારે જવું જ જોઈએ.\n\nયોગેશ્વર: હા. કદાચ તમે મને કહેવા માંગતા હશો કે મારે આપણું આંદોલન કયા સ્તરે રજૂ કરવું જોઈએ.\n\nપ્રભુપાદ: ભગવદ-ગીતાના સ્તરે. ભગવાન સર્વોચ્ચ નિયંત્રક છે, અને આપણે સર્વોચ્ચ નિયંત્રક હેઠળ શાંતિથી કેવી રીતે રહેવું તે શીખવું પડશે. નાગરિકો અને સરકારની જેમ. સારી નાગરિકતાનો અર્થ એ છે કે જે સરકારના નિયંત્રણ હેઠળ રહે છે. તેવી જ રીતે, સારા વ્યક્તિનો અર્થ એ છે કે વ્યક્તિ ભગવાન પ્રત્યે સભાન હોય અને ભગવાનના આદેશ અનુસાર જીવે. તો ભગવાનનો આદેશ છે, [ખાંસી] આપણે આ આખી દુનિયામાં રજૂ કરી રહ્યા છીએ.\n\nયોગેશ્વર: અને તેઓએ આપણને કેટલીક સુવિધાઓ આપવી જોઈએ?\n\nપ્રભુપાદ: હા. \"અમે પ્રચાર કરવા માંગીએ છીએ. અહીં પણ, જો તમે અમને સુવિધા આપો, તો અમે પ્રચાર કરી શકીએ છીએ. તે તમારા હિત પછી છે.\"\n\n યોગેશ્વર: આ એક સજ્જન વ્યક્તિએ બેંગકોકમાં એક ઘર પહેલેથી જ ઓફર કર્યું છે. તેમણે શહેરની મધ્યમાં, એક ખૂબ જ સુંદર ઘર અમારા માટે રાખ્યું છે.\n\n પ્રભુપાદ: ઓહ, તે ખૂબ જ સરસ છે.\n\n યોગેશ્વર: પણ હવે હું વિચારી રહ્યો છું કે આનું સંચાલન કેવી રીતે કરવું જોઈએ, આ પ્રોજેક્ટનો હવાલો કોણે લેવો જોઈએ.\n\n પ્રભુપાદ: ના, આપણે ભારતમાંથી કેટલાક માણસો મોકલી શકીએ છીએ. બેંગકોક ભારતથી બહુ દૂર નથી. જો આપણને રહેવાની જગ્યા મળે, તો આપણે શોધી શકીએ છીએ. જ્યારે ત્યાં ચોખા ફેંકવામાં આવે છે, ત્યારે કાગડા આવશે. જો ચોખા ન હોય, તો કાગડા કેવી રીતે આવશે? આ ફિલસૂફી છે. [હાસ્ય] જો રહેવાની જગ્યા હોય, તો ઘણા કાગડા આવશે.\n\nયોગેશ્વર: તો આપણે પહેલા જઈને પરિસ્થિતિ જોઈ શકીએ છીએ અને પછી ભારતમાં આપણા માણસોનો સંપર્ક કરી શકીએ છીએ.\n\nપ્રભુપાદ: હા, હા. પુરુષો ભારતથી પૂરા પાડવામાં આવશે. તેનું નામ શું છે? તેને થોડો આભાર મોકલો.\n\nયોગેશ્વર: હા, શ્રી બુનસુંગ. હું હમણાં તમને આપીશ. જયા, ખૂબ સરસ.\n\nપ્રભુપાદ: તે હોંગકોંગનો માણસ છે?\n\nયોગેશ્વર: ના, તે થાઈલેન્ડનો છે.\n\nપ્રભુપાદ: ઓહ, હા, બેંગકોક.\n\nયોગેશ્વર: અને તે કરોડપતિ છે. થાઇલેન્ડમાં લગભગ ત્રીજા ભાગની જમીન તેમની પાસે છે.\n\nપ્રભુપાદ: ઓહ!\n\nહરિ-શૌરી: ખૂબ જ મહત્વપૂર્ણ માણસ.\n\nયોગેશ્વર: ઘણા મોટા વ્યવસાયોના અધ્યક્ષ.\n\nપ્રભુપાદ: તમે પુસ્તકો આપ્યા છે?\n\nયોગેશ્વર: તેમણે પુસ્તકો મેળવ્યા છે.\n\nપ્રભુપાદ: તમે તેમને ક્યાં મળ્યા?\n\nયોગેશ્વર: તેમના ભૂતપૂર્વ સચિવ હવે આ મંદિરમાં ભક્ત છે. તે થાઇલેન્ડથી છે. અને જ્યારે તેઓ પેરિસમાં તેમને મળવા આવ્યા, ત્યારે તેમણે મને તેમનો પરિચય કરાવ્યો, અને ત્યારથી તેઓ તેમના પરિવાર, ઉદ્યોગપતિઓ સાથે અમારા વિશે વાત કરે છે. થાઇલેન્ડમાં ઘણા મોટા લોકો.\n\nહરિ-શૌરી: થાઇલેન્ડના લોકો ખૂબ જ પવિત્ર છે.\n\nપ્રભુપાદ: હા. તેઓ ભારતીય સંસ્કૃતિ છે. તેમની મૂળ સંસ્કૃતિ ભારતીય છે. તેને સ્યામ [શ્યામ જેવું ઉચ્ચારણ] કહેવામાં આવે છે, કૃષ્ણનું નામ. અને તેમની પાસે વિમાન છે, ગરુડ.\n\nહરિ-શૌરી: હા. ગરુડ એરલાઇન્સ.\n\nપ્રભુપાદ: તો તેઓ મૂળ ભક્તો છે, બધા કૃષ્ણ ભક્તો.\n\nયોગેશ્વર: રાજા સંસ્કૃત બોલી રહ્યા છે.\n\nપ્રભુપાદ: હા. તે જાણીતું હતું. હવે તે બદલાઈ ગયું છે. પહેલાં, [ખાંસી] તેને સ્યામ રાજ્ય, સ્યામ તરીકે ઓળખાતું હતું. શ્યામ એ કૃષ્ણનું નામ છે. આખા રાજ્યનું નામ તે કૃષ્ણના નામ પરથી રાખવામાં આવ્યું હતું. તેથી, અને તેઓ રાધા-કૃષ્ણની ખૂબ જ સુંદર મૂર્તિ બનાવે છે. તેઓ ટેવાયેલા છે.\n\nહરિ-શૌરી: હવે ત્યાં તેમનો ખૂબ જ મજબૂત બૌદ્ધ પ્રભાવ છે.\n\nપ્રભુપાદ: હં?\n\nહરિ-શૌરી: બૌદ્ધ.\n\nપ્રભુપાદ: પછીથી, તેઓ બૌદ્ધ બન્યા, પરંતુ મૂળ તેઓ વૈષ્ણવ હતા.\n\nયોગેશ્વર: તો જો તેઓ એવું વિચારતા હોય કે આપણે બૌદ્ધ દેશમાં હિન્દુ ધર્મનો પ્રચાર કરવા આવ્યા છીએ તો તેઓ કોઈ વાંધો નહીં ઉઠાવે?\n\nપ્રભુપાદ: એવું નથી... દેવતા સ્થાપિત કરશો નહીં. ફિલસૂફી પર વાત કરો.\n\nયોગેશ્વર: \"ભગવાન સર્વોચ્ચ નિયંત્રક છે.\"\n\nપ્રભુપાદ: હા. અમે ભગવાન બુદ્ધને ભગવાનના અવતાર તરીકે સ્વીકારીએ છીએ. અમારા પુસ્તકોમાં બતાવો કે અમને બુદ્ધ માટે સંપૂર્ણ આદર છે. અમે ભગવાન બુદ્ધનો અનાદર કરતા નથી, કે તેમની વિરુદ્ધ પણ જતા નથી. [ખાંસી] ગમે તે હોય, જો અમને રહેવા માટે એક ઘર અને એક સમર્થક, એક મોટો સમર્થક મળે, તો આપણું સ્થાન સુરક્ષિત રહેશે. અને જો આપણું કારણ પ્રામાણિક હોય, તો કોઈ તપાસી શકશે નહીં.\n\nયોગેશ્વર: તેમણે કહ્યું છે કે પહેલા મારે પ્રધાનમંત્રી સાથે વાત કરવી જોઈએ અને પછી યુનિવર્સિટીમાં બોલવું જોઈએ, અને પછી પ્રતિક્રિયા જોવી જોઈએ, અને પછી આપણે રાજાને મળવા જઈ શકીએ છીએ અને કહી શકીએ છીએ કે યુનિવર્સિટીઓમાં આ પ્રતિક્રિયા રહી છે.\n\nપ્રભુપાદ: હા. તે વ્યવસ્થિત રીતે કરો. તેઓ ફ્રેન્ચ ભાષા સમજે છે?\n\nયોગેશ્વર: હા, અંગ્રેજી અને ફ્રેન્ચ. તેઓ વિયેતનામથી ખૂબ નજીક છે. તેઓ ફ્રેન્ચ બોલે છે.\n\nપ્રભુપાદ: ખૂબ સારું. આ તક લો. [ખાંસી]\n\nયોગેશ્વર: હરે કૃષ્ણ.\n\nપ્રભુપાદ: હરે કૃષ્ણ. જય. [અંત]\n\n \n\n \n\n શ્રી જૂટી બુનસુંગને પત્ર\n\n તારીખ: ૧ ઓગસ્ટ, ૧૯૭૬\n\n સ્થાન: વેલેનકે, ફ્રાન્સ\n\n શ્રી જૂટી બુનસુંગને પત્ર\n\n૭૬-૦૮-૦૧\n\n પ્રિય શ્રી બૂનસુંગ,\n\n કૃપા કરીને મારા આશીર્વાદ સ્વીકારો. મારા શિષ્ય યોગેશ્વર દાસ દ્વારા મને ભેટ આપવામાં આવેલી રેશમી કાપડની તમારી સુંદર ભેટની પ્રાપ્તિનો હું સ્વીકાર કરવા વિનંતી કરું છું. તેમણે અમારા ચળવળની પ્રવૃત્તિઓમાં તમારી રુચિ વિશે પણ મને વાત કરી છે. હું તમારો ખૂબ ખૂબ આભાર માનું છું.\n\nઆ કૃષ્ણ ભાવનામૃત આંદોલન ભગવદ-ગીતા જેવી છે તેના પર આધારિત છે. અમે આ મહાન તત્વજ્ઞાનને શુદ્ધ રીતે, ભૌતિક હેતુ વિના, વિશ્વ સમક્ષ રજૂ કરવાનો પ્રયાસ કર્યો છે, અને ભગવાન કૃષ્ણની કૃપાથી અમારો પ્રયાસ સફળ થયો છે. દરેક જગ્યાએ લોકો કૃષ્ણ ભાવનામૃતને અપનાવી રહ્યા છે, સરળ સિદ્ધાંતોનું પાલન કરી રહ્યા છે અને ખુશ થઈ રહ્યા છે. ઓછામાં ઓછું કોઈએ ક્યારેય આપણા છોકરાઓ અને છોકરીઓમાં આટલું ઉચ્ચ ચારિત્ર્ય જોયું નથી. અને તમારા જેવા વિચારશીલ પુરુષો પ્રશંસા કરી રહ્યા છે.\n\nફરીથી, તમારા વિચાર બદલ આભાર. આશા છે કે આ તમને સારા સ્વાસ્થ્યમાં મળશે.\n\nતમારા હંમેશા શુભેચ્છક,\nએ.સી. ભક્તિવેદાંત સ્વામી',
      'hi':
          'पत्र: पंचद्रविड़ा को\n\nदिनांक: 24 नवंबर, 1974\n\nस्थान: बॉम्बे\n\nपत्र: पंचद्रविड़ा को\n\n74-11-24\n\nबैंकॉक\n\nमेरे प्रिय पंचद्रविड़ा स्वामी:\n\nकृपया मेरा आशीर्वाद स्वीकार करें...\n\nजहां भी कृष्ण चाहेंगे हम इस आंदोलन का प्रचार करेंगे। बैंकॉक में एक केंद्र स्थापित करने की पूरी कोशिश करें...\n\nइसलिए इसे कृष्ण की इच्छा मानें, और हम कृष्ण के सेवक हैं, इसलिए हमारा एकमात्र काम उन्हें संतुष्ट करने का प्रयास करना है। आप एक संन्यासी हैं और मुझे आप पर पूरा विश्वास है कि आप वहां बहुत अच्छा कर सकते हैं। हर जगह इस आंदोलन को स्वीकार किया गया है, इसलिए कृपया मुझे सूचित करते रहें कि वहां क्या प्रगति हुई है।\n\nमुझे आशा है कि आप अच्छे स्वास्थ्य में होंगे।\n\nआपका सदैव शुभचिंतक,\nए.सी. भक्तिवेदांत स्वामी\n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n \n\n पत्र: बैंकॉक के लोगों को\n\nदिनांक: 14 दिसंबर, 1974\n\nस्थान: बॉम्बे\n\n पत्र: बैंकॉक के लोगों को\n\n74-12-14\n\nबैंकॉक\n\nबैंकॉक के लोगों के लिए, थाईलैंड\n\nकृपया मेरी शुभकामनाएँ स्वीकार करें। मुझे खेद है कि मैं नहीं आ पा रहा हूँ, लेकिन मुझे कुछ ज़रूरी कामों के लिए बम्बई में ही रहना होगा। इसलिए मैं अपने सचिव परम पावन ब्रह्मानंद महाराज को भेज रहा हूँ, जो मेरा प्रतिनिधित्व करेंगे।\n\nकृष्ण भावनामृत मिशन सांप्रदायिक नहीं है। हम वह करना चाहते हैं, जो संयुक्त राष्ट्र करने में विफल रहा है। मानव शरीर जीवन की सभी समस्याओं को हल करने का एक अवसर है। विकास के माध्यम से हम इस समस्या को हल करने के लिए मानव जीवन में आते हैं। वास्तविक समस्या जन्म, मृत्यु, बीमारी और बुढ़ापे की पुनरावृत्ति है।\n\nलेकिन जीवन की एक और स्थिति है जहाँ जन्म, मृत्यु, बीमारी और बुढ़ापा नहीं है। कृष्ण भावनामृत आंदोलन मानव को उस स्थिति तक पहुँचाने का साधन है। यह एक महान विज्ञान है, और इसे भगवद-गीता में विस्तार से समझाया गया है।\n\nइसलिए हमारा मिशन पूरी मानवता को यह आशीर्वाद देना है। आइए हम इस आधार पर एक साथ सहयोग करें ताकि यह अधिक प्रभावी संयुक्त राष्ट्र बन सके, हम मानव समाज की प्रमुख आवश्यकता, आध्यात्मिक जीवन के आधार पर एकजुट होंगे।\n\nमुझे आशा है कि आप सभी को यह अच्छा लगेगा।\n\nआपका,\n\nए.सी. भक्तिवेदांत स्वामी\n\n \n\n \n\nकक्ष वार्तालाप\n\nप्रकार: वार्तालाप\n\nदिनांक: 31 जुलाई, 1976\n\nस्थान: नया मायापुर\n\nऑडियो फ़ाइल: audio/transcripts/1976/760731R1.NMR.mp3\n\n \n\nयोगेश्वर: ...हाथ से बुना रेशम।\n\nप्रभुपाद: थाईलैंड रेशम। [खांसते हुए]\n\nयोगेश्वर: हाँ। उन्होंने मुझे अक्टूबर में प्रधानमंत्री से मिलने के लिए थाईलैंड जाने के लिए आमंत्रित किया है।\n\nप्रभुपाद: ओह, अगर साक्षात्कार है, तो आपको अवश्य जाना चाहिए।\n\nयोगेश्वर: हाँ। शायद आप मुझे बताना चाहेंगे कि मुझे किस स्तर पर अपना आंदोलन प्रस्तुत करना चाहिए।\n\nप्रभुपाद: भगवद गीता के स्तर पर। भगवान सर्वोच्च नियंत्रक हैं, और हमें सीखना होगा कि सर्वोच्च नियंत्रक के अधीन शांतिपूर्वक कैसे रहना है। ठीक वैसे ही जैसे नागरिक और सरकार। अच्छे नागरिक का मतलब है वह जो सरकार के नियंत्रण में रहता है। इसी तरह, अच्छे व्यक्ति का मतलब है वह जो ईश्वर के प्रति सचेत है और ईश्वर के निर्देशानुसार जीवन जीता है। तो भगवान का निर्देश है, [खांसते हुए] हम इसे पूरी दुनिया में प्रस्तुत कर रहे हैं।\n\nयोगेश्वर: और उन्हें हमें कुछ सुविधाएँ देनी चाहिए?\n\nप्रभुपाद: हाँ। \"हम प्रचार करना चाहते हैं। यहाँ भी, यदि आप हमें सुविधा देते हैं, तो हम प्रचार कर सकते हैं। यह आपकी रुचि के बाद है।\"\n\nयोगेश्वर: इन सज्जन ने पहले ही बैंकॉक में एक घर की पेशकश की है। उन्होंने शहर के बीचों-बीच एक बहुत ही सुंदर घर हमारे लिए रख दिया है।\n\nप्रभुपाद: ओह, यह बहुत बढ़िया है।\n\nयोगेश्वर: लेकिन अब मैं सोच रहा हूँ कि इसका प्रबंधन कैसे किया जाना चाहिए, इस परियोजना का प्रभार कौन संभाले।\n\nप्रभुपाद: नहीं, हम भारत से कुछ लोगों को भेज सकते हैं। बैंकॉक भारत से बहुत दूर नहीं है। अगर हमें रहने की जगह मिल जाए, तो हम पता लगा सकते हैं। जब चावल फेंके जाएँगे, तो कौवे आएँगे। अगर चावल नहीं होगा, तो कौवे कैसे आएँगे? यही दर्शन है। [हँसी] अगर रहने की जगह होगी, तो बहुत सारे कौवे आएंगे।\n\nयोगेश्वर: तो हम पहले जाकर स्थिति देख सकते हैं और फिर भारत में अपने आदमियों से संपर्क कर सकते हैं।\n\nप्रभुपाद: हाँ, हाँ। भारत से आदमी मंगवाए जाएँगे। उसका नाम क्या है? उसे कुछ धन्यवाद भेजें।\n\nयोगेश्वर: हाँ, मिस्टर बूनसूंग। मैं अभी आपको दे देता हूँ। जया, बहुत बढ़िया।\n\nप्रभुपाद: वह हांगकांग का आदमी है?\n\nयोगेश्वर: नहीं, वह थाईलैंड से है।\n\nप्रभुपाद: ओह, हाँ, बैंकॉक।\n\nयोगेश्वर: और वह एक करोड़पति है। वह थाईलैंड की लगभग एक तिहाई जमीन का मालिक है।\n\nप्रभुपाद: ओह!\n\nहरि-शौरी: बहुत महत्वपूर्ण आदमी।\n\nयोगेश्वर: कई बड़े व्यवसायों के अध्यक्ष।\n\nप्रभुपाद: आपने किताबें दी हैं?\n\nयोगेश्वर: उन्हें किताबें मिली हैं।\n\nप्रभुपाद: आप उनसे कहाँ मिले थे?\n\nयोगेश्वर: उनकी पूर्व सचिव अब इस मंदिर की एक भक्त हैं। वह थाईलैंड से हैं। और जब वह पेरिस में उनसे मिलने आए, तो उन्होंने मेरा उनसे परिचय कराया, थाईलैंड में कई बड़े लोग हैं।\n\nहरि-शौरी: थाईलैंड में लोग काफी पवित्र हैं।\n\nप्रभुपाद: हाँ। वे भारतीय संस्कृति के हैं। उनकी मूल संस्कृति भारतीय है। इसे स्याम [श्याम की तरह उच्चारण] कहा जाता है, कृष्ण का नाम। और उनके पास हवाई जहाज है, गरुड़।\n\nहरि-शौरी: हाँ। गरुड़ एयरलाइंस।\n\nप्रभुपाद: तो वे मूल रूप से भक्त हैं, सभी कृष्ण भक्त हैं।\n\nयोगेश्वर: राजा संस्कृत बोल रहे हैं।\n\nप्रभुपाद: हाँ। यह ज्ञात था। अब इसे बदल दिया गया है। पहले, [खांसते हुए] इसे श्याम राज्य के नाम से जाना जाता था, स्याम। श्याम कृष्ण का नाम है। पूरे राज्य का नाम उस कृष्ण के नाम पर रखा गया था। इसलिए, और वे राधा-कृष्ण की बहुत अच्छी मूर्ति बनाते हैं। वे इसके आदी हैं।\n\nहरि-शौरी: अब वहां बौद्ध धर्म का बहुत मजबूत प्रभाव है।\n\nप्रभुपाद: हुह?\n\nहरि-शौरी: बौद्ध।\n\nप्रभुपाद: बाद में, वे बौद्ध बन गए, लेकिन मूल रूप से वे वैष्णव थे।\n\nयोगेश्वर: तो वे कोई आपत्ति नहीं करेंगे अगर वे सोच रहे हैं कि हम एक बौद्ध देश में हिंदू धर्म का प्रचार करने आए हैं?\n\nप्रभुपाद: यह नहीं है... देवता की स्थापना मत करो। दर्शन पर बात करें।\n\nयोगेश्वर: \"ईश्वर सर्वोच्च नियंत्रक है।\"\n\nप्रभुपाद: हाँ। हम भगवान बुद्ध को भगवान का अवतार मानते हैं। अपनी पुस्तकों में दिखाएँ कि हमें बुद्ध के प्रति पूरा सम्मान है। हम भगवान बुद्ध का अनादर नहीं करते, न ही उनके विरुद्ध जाते हैं। [खाँसते हुए] वैसे भी, अगर हमें रहने के लिए एक घर और एक समर्थक, एक बड़ा समर्थक मिल जाए, तो हमारी स्थिति सुरक्षित रहेगी। और अगर हमारा उद्देश्य ईमानदार है, तो कोई भी रोक नहीं सकता।\n\nयोगेश्वर: उन्होंने कहा है कि पहले मुझे प्रधानमंत्री से बात करनी चाहिए और फिर विश्वविद्यालय में बात करनी चाहिए, और फिर प्रतिक्रिया देखनी चाहिए, और फिर हम राजा से मिलने जा सकते हैं और कह सकते हैं कि विश्वविद्यालयों में यह प्रतिक्रिया हुई है।\n\nप्रभुपाद: हाँ। इसे व्यवस्थित रूप से करें। वे फ्रेंच भाषा समझते हैं?\n\nयोगेश्वर: हाँ, अंग्रेजी और फ्रेंच। वे वियतनाम के बहुत करीब हैं। वे फ्रेंच बोलते हैं।\n\nप्रभुपाद: बहुत बढ़िया। इस अवसर का लाभ उठाएँ। [खाँसते हुए]\n\nयोगेश्वर: हरे कृष्ण।\n\nप्रभुपाद: हरे कृष्ण। जया। [अंत]\n\n \n\n \n\nपत्र: श्री जूटी बूनसूंग\n\nदिनांक: 1 अगस्त, 1976\n\nस्थान: वेलेनके, फ्रांस\n\nपत्र: श्री जूटी बूनसूंग\n\n76-08-01\n\nप्रिय श्री बूनसूंग,\n\nकृपया मेरा आशीर्वाद स्वीकार करें। मैं आपके द्वारा रेशमी कपड़े के सुंदर उपहार की प्राप्ति की कामना करता हूँ, जो मुझे मेरे शिष्य योगेश्वर दास ने भेंट किया है। उन्होंने मुझे हमारे आंदोलन की गतिविधियों में आपकी रुचि के बारे में भी बताया है। मैं आपका बहुत-बहुत धन्यवाद करता हूँ।\n\nयह कृष्ण भावनामृत आन्दोलन भगवद्गीता के यथारूप पर आधारित है। हमने इस महान दर्शन को संसार के सामने शुद्ध रूप में, भौतिक उद्देश्य के बिना प्रस्तुत करने का प्रयास किया है, और भगवान कृष्ण की कृपा से हमारा प्रयास सफल हुआ है। हर जगह लोग कृष्ण भावनामृत को अपना रहे हैं, सरल सिद्धांतों का पालन कर रहे हैं, और खुश हो रहे हैं। कम से कम हमारे लड़के-लड़कियों में जितना उच्च चरित्र है, उतना किसी ने कभी नहीं देखा। और आप जैसे विचारशील लोग इसकी सराहना कर रहे हैं।\n\nएक बार फिर, आपके विचार के लिए मेरा धन्यवाद। आशा है कि यह आपको अच्छे स्वास्थ्य में मिलेगा।\n\nआपका सदैव शुभचिंतक,\nए.सी. भक्तिवेदांत स्वामी',
      'th':
          'จดหมายถึง: Pancadravida\n\nลงวันที่: 24 พ.ย. 1974\n\nสถานที่: บอมเบย์\n\nจดหมายถึง: Pancadravida\n\n74-11-24\n\nกรุงเทพฯ\n\nสวามี Pancadravida ที่รักของฉัน:\n\nโปรดรับพรของฉันด้วย…\n\nเราจะเผยแพร่การเคลื่อนไหวนี้ที่ใดก็ตามที่พระกฤษณะต้องการ พยายามอย่างเต็มที่เพื่อจัดตั้งศูนย์กลางในกรุงเทพฯ…\n\nดังนั้น จงถือว่าสิ่งนี้เป็นความปรารถนาของพระกฤษณะ และเราเป็นผู้รับใช้ของพระกฤษณะ ดังนั้น หน้าที่ของเราเพียงอย่างเดียวคือพยายามทำให้พระองค์พอใจ คุณเป็นสันยาสี และฉันมีความมั่นใจอย่างเต็มที่ในตัวคุณว่าคุณทำได้ดีมากที่นั่น ทุกที่ที่การเคลื่อนไหวนี้ได้รับการยอมรับ ดังนั้นโปรดแจ้งให้ฉันทราบถึงความคืบหน้าที่นั่นด้วย\n\nฉันหวังว่าคุณจะมีสุขภาพแข็งแรง\n\nผู้หวังดีเสมอมา\nA.C. Bhaktivedanta Swami\n\n \n\n \n\n \n\n \n\n\n \n\n\n \n\n\nจดหมายถึง: ชาวกรุงเทพฯ\n\nลงวันที่: 14 ธันวาคม 1974\n\nสถานที่: บอมเบย์\n\nจดหมายถึง: ชาวกรุงเทพฯ\n\n74-12-14\n\nกรุงเทพมหานคร\n\nถึงชาวกรุงเทพฯ ประเทศไทย\n\nขอความกรุณารับความปรารถนาดีจากข้าพเจ้า ฉันเสียใจที่ไม่สามารถมาได้ แต่ฉันต้องอยู่ที่บอมเบย์เพื่อจัดการเรื่องเร่งด่วนบางอย่าง ดังนั้น ฉันจึงส่งเลขานุการของฉัน สมเด็จพระสังฆราชพรหมนันทมหาราชา ซึ่งจะเป็นตัวแทนของฉัน\n\nพันธกิจของพระกฤษณะไม่ใช่นิกาย เราต้องการทำในสิ่งที่สหประชาชาติทำไม่ได้ ร่างกายของมนุษย์เป็นโอกาสในการแก้ปัญหาชีวิตทั้งหมด วิวัฒนาการทำให้เราได้มีชีวิตเป็นมนุษย์เพื่อแก้ปัญหานี้ ปัญหาที่แท้จริงคือการเกิด การตาย โรคภัยไข้เจ็บ และวัยชรา\n\nแต่ยังมีสถานะอื่นของชีวิตที่ไม่มีการเกิด การตาย โรคภัยไข้เจ็บ และวัยชรา ขบวนการพระกฤษณะเป็นหนทางในการส่งเสริมให้มนุษย์มีสถานะดังกล่าว นี่คือศาสตร์ที่ยิ่งใหญ่ และได้รับการอธิบายไว้อย่างละเอียดในคัมภีร์ภควัทคีตา\n\nดังนั้น พันธกิจของเราคือการมอบพรนี้ให้กับมนุษยชาติทั้งหมด ขอให้เราร่วมมือกันบนพื้นฐานนี้เพื่อให้เป็นสหประชาชาติที่มีประสิทธิผลยิ่งขึ้น เราจะสามัคคีกันบนพื้นฐานของความต้องการพื้นฐานของสังคมมนุษย์ คือชีวิตทางจิตวิญญาณ\n\nฉันหวังว่าสิ่งนี้จะตอบสนองคุณทุกคนได้ดี\n\nขอแสดงความนับถืออย่างจริงใจ\n\nA.C. Bhaktivedanta Swami\n\n \n\n \n\nการสนทนาในห้อง\n\nประเภท: การสนทนา\n\nวันที่: 31 กรกฎาคม 1976\n\nสถานที่: New Māyāpur\n\nไฟล์เสียง: เสียง/บทบรรยาย/1976/760731R1.NMR.mp3\n\n \n\nโยเกศวร: ...ผ้าไหมทอมือ\n\nพระภูปาทะ: ผ้าไหมไทย [ไอ]\n\nโยเกศวร: ใช่ เขาเชิญผมไปเมืองไทยเพื่อพบกับนายกรัฐมนตรีในเดือนตุลาคม\n\nPrabhupāda: โอ้ ถ้ามีการสัมภาษณ์ คุณต้องไป\n\nYogeśvara: ใช่ บางทีคุณอาจต้องการบอกฉันว่าฉันควรนำเสนอการเคลื่อนไหวของพวกเราในระดับไหน\n\nPrabhupāda: ในระดับของ Bhagavad-gītā พระเจ้าเป็นผู้ควบคุมสูงสุด และเราต้องเรียนรู้ที่จะอยู่ภายใต้การควบคุมสูงสุดอย่างสันติ เช่นเดียวกับพลเมืองและรัฐบาล พลเมืองที่ดีหมายถึงผู้ที่อยู่ภายใต้การควบคุมของรัฐบาล ในทำนองเดียวกัน คนดีหมายถึงผู้ที่สำนึกถึงพระเจ้าและดำเนินชีวิตตามคำสั่งสอนของพระเจ้า ดังนั้นจึงมีคำสั่งสอนจากพระเจ้า [ไอ] เรากำลังนำเสนอสิ่งนี้ไปทั่วโลก\n\nโยเกศวร: แล้วพวกเขาควรให้สิ่งอำนวยความสะดวกแก่เราบ้างหรือไม่?\n\nพระภูปาทา: ใช่ \"เราอยากเทศนา ที่นี่ด้วย ถ้าคุณให้สิ่งอำนวยความสะดวกแก่เรา เราก็สามารถเทศนาได้ นั่นขึ้นอยู่กับความสนใจของคุณ\"\n\nโยเกศวร: สุภาพบุรุษท่านนี้เสนอบ้านหนึ่งหลังในกรุงเทพฯ ให้กับเราแล้ว เขามีบ้านที่สวยงามมากอยู่ใจกลางเมือง\n\nพระภูปาทา: โอ้ นั่นดีมาก\n\nโยเกศวร: แต่ตอนนี้ฉันสงสัยว่าควรจัดการเรื่องนี้อย่างไร ใครควรดูแลโครงการนี้\n\nพระภูปาทา: ไม่ได้ เราจะส่งคนจากอินเดียไป กรุงเทพไม่ไกลจากอินเดีย ถ้าเรามีที่อยู่อาศัยก็จะสามารถค้นหาได้ เมื่อมีข้าวสาร กาจะมา ถ้าไม่มีข้าว กาจะมาอย่างไร นี่คือปรัชญา [เสียงหัวเราะ] ถ้ามีที่อยู่อาศัย กาจะมามากมาย\n\nโยเกศวร: งั้นเราไปดูสถานการณ์ก่อนแล้วค่อยติดต่อคนของเราในอินเดีย\n\nพระภูปาทา: ใช่ครับ คนจะได้รับการสนับสนุนจากอินเดีย ชื่ออะไรครับ ส่งคำขอบคุณไปให้เขาหน่อย\n\nโยเกศวร: ครับ คุณบุญสูง เดี๋ยวผมให้ครับ จายา น่ารักมาก\n\nPrabhupāda: เขาเป็นคนฮ่องกงเหรอ?\n\nYogeśvara: ไม่ใช่ค่ะ เขาเป็นคนประเทศไทย\n\nPrabhupāda: โอ้ ใช่ค่ะ กรุงเทพมหานคร\n\nYogeśvara: แล้วเขาก็เป็นเศรษฐีพันล้านด้วย พระองค์ทรงเป็นเจ้าของที่ดินประมาณหนึ่งในสามของทั้งหมดในประเทศไทย\n\nPrabhupāda: โอ้!\n\nHari-śauri: บุคคลสำคัญมาก\n\nYogeśvara: ประธานของธุรกิจใหญ่ๆ หลายแห่ง\n\nPrabhupāda: คุณได้ถวายหนังสือหรือเปล่า\n\nYogeśvara: เขาได้รับหนังสือมาแล้ว\n\nPrabhupāda: คุณพบเขาที่ไหน\n\nYogeśvara: อดีตเลขานุการของเขาตอนนี้เป็นผู้ศรัทธาในวัดนี้ เธอมาจากประเทศไทย และเมื่อเขาไปเยี่ยมเธอที่ปารีส เธอแนะนำฉันให้เขารู้จัก และตั้งแต่นั้นมา เขาก็เล่าเรื่องของเราให้ครอบครัวของเขาฟัง กับนักธุรกิจ คนใหญ่คนโตในไทยเยอะมาก\n\nHari-śauri: คนในไทยเคร่งศาสนากันมาก\n\nPrabhupāda: ใช่ พวกเขาเป็นวัฒนธรรมอินเดีย วัฒนธรรมดั้งเดิมของพวกเขาคืออินเดีย เรียกว่าสยาม [ออกเสียงเหมือน Śyām] ซึ่งเป็นพระกฤษณะ และพวกเขาก็มีเครื่องบินชื่อครุฑด้วย\n\nHari-śauri: ใช่ สายการบิน Garuda\n\nPrabhupāda: ดังนั้นพวกเขาจึงเป็นสาวกดั้งเดิม พวกเขาเป็นสาวกของกฤษณะทั้งหมด\n\nYogeśvara: กษัตริย์ทรงพูดภาษาสันสกฤต\n\nPrabhupāda: ใช่ เป็นที่ทราบกันดี แต่ตอนนี้ได้เปลี่ยนไปแล้ว เดิมเรียกว่ารัฐสยาม สยามเป็นพระนามของพระกฤษณะ ทั้งรัฐได้รับการตั้งชื่อภายใต้พระกฤษณะองค์นั้น ดังนั้นพวกเขาจึงสร้างรูปเคารพของราธากฤษณะที่งดงามมาก พวกเขาคุ้นเคยกันดี\n\nHari-śauri: ตอนนี้พวกเขามีอิทธิพลทางพุทธศาสนาอย่างแข็งแกร่งมาก\n\nPrabhupāda: หืม?\n\nHari-śauri: พุทธ\n\nPrabhupāda: ต่อมาพวกเขาหันมานับถือพุทธ แต่เดิมพวกเขาเป็นไวษณพ\n\nYogeśvara: ดังนั้นพวกเขาจะไม่คัดค้านหากพวกเขาคิดว่าเรามาเผยแผ่ศาสนาฮินดูในประเทศพุทธใช่หรือไม่?\n\nPrabhupāda: ไม่ใช่... อย่าสถาปนาพระเจ้า พูดถึงปรัชญา\n\nYogeśvara: \"พระเจ้าเป็นผู้ควบคุมสูงสุด\"\n\nPrabhupāda: ใช่ เราถือว่าพระพุทธเจ้าเป็นอวตารของพระเจ้า แสดงให้เราเห็นในหนังสือของเราว่าเราเคารพพระพุทธเจ้ามาก เราไม่ดูหมิ่นพระพุทธเจ้าและไม่ต่อต้านพระองค์ [ไอ] ยังไงก็ตาม ถ้าเราได้บ้านสักหลังหนึ่งและผู้สนับสนุน ผู้สนับสนุนรายใหญ่ ตำแหน่งของเราจะมั่นคง และถ้าเป้าหมายของเราสุจริต ก็ไม่มีใครตรวจสอบได้\n\nโยเกศวร: ท่านกล่าวว่าก่อนอื่นข้าพเจ้าควรไปพูดกับนายกรัฐมนตรี จากนั้นจึงไปพูดที่มหาวิทยาลัย จากนั้นดูปฏิกิริยา แล้วเราจึงจะเข้าเฝ้ากษัตริย์และบอกว่านี่คือปฏิกิริยาที่มหาวิทยาลัยได้รับ\n\nพระภูปาท: ใช่ จัดการอย่างเป็นระบบ พวกเขาเข้าใจภาษาฝรั่งเศสใช่ไหม?\n\nโยเกศวร: ใช่ ภาษาอังกฤษและภาษาฝรั่งเศส พวกเขาใกล้ชิดกับเวียดนามมาก พวกเขาพูดภาษาฝรั่งเศส\n\nพระภูปาท: ดีมาก ถือโอกาสนี้ไว้ [ไอ]\n\nโยเกชวารา: ฮาเร คริชณะ.\n\nปราบภูปาดะ: ฮาเร คริชณะ จายา. [จบ]\n\n \n\n \n\nจดหมายถึง: นาย Jootee Boonsoon\n\nวันที่: 1 สิงหาคม 1976\n\nสถานที่: Valencay ประเทศฝรั่งเศส\n\nจดหมายถึง: นาย Jootee บุญสูง\n\n76-08-01\n\nเรียนคุณบุญสูง\n\nโปรดยอมรับพรของฉัน ข้าพเจ้าขออนุญาตรับของขวัญผ้าไหมอันสวยงามจากท่าน ซึ่งโยเกศวร ดาส ศิษย์ของข้าพเจ้าได้มอบให้ข้าพเจ้า ท่านยังได้บอกข้าพเจ้าด้วยว่าท่านสนใจกิจกรรมของขบวนการของเรา ข้าพเจ้าขอขอบพระคุณท่านมาก\n\nขบวนการสำนึกรู้ของพระกฤษณะนี้ยึดถือตามภควัทคีตาตามที่เป็นอยู่ เราพยายามนำเสนอปรัชญาอันยิ่งใหญ่นี้ต่อโลกด้วยวิธีที่บริสุทธิ์ ปราศจากแรงจูงใจทางวัตถุ และด้วยพระกรุณาของพระกฤษณะ ความพยายามของเราจึงประสบความสำเร็จ ผู้คนทุกแห่งต่างพากันเข้าถึงสำนึกรู้ของพระกฤษณะ ปฏิบัติตามหลักการง่ายๆ และมีความสุข อย่างน้อยก็ไม่มีใครเคยเห็นลักษณะนิสัยที่สูงส่งเช่นนี้ในตัวเด็กชายและเด็กหญิงของเรา และผู้ชายที่เอาใจใส่เช่นท่านก็ชื่นชมยินดี\n\nขอขอบคุณอีกครั้งสำหรับการพิจารณาของท่าน หวังว่าท่านจะพบสิ่งนี้ในสุขภาพที่ดี\n\nผู้หวังดีเสมอมา\nA.C. Bhaktivedanta Swami',
    },
    'wqu9tqr5': {
      'en': 'Hello World',
      'gu': 'હેલો વર્લ્ડ',
      'hi': 'हैलो वर्ल्ड',
      'th': 'สวัสดีโลก',
    },
    '59yf7bzh': {
      'en': 'Enquire',
      'gu': 'પૂછપરછ કરો',
      'hi': 'पूछताछ',
      'th': 'สอบถาม',
    },
    'r1snnc4u': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // YatrasInfo
  {
    '62b4ncl0': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PadaSevaListNOTUSED
  {
    'pm3irnf7': {
      'en': 'Pada Seva',
      'gu': 'પદ સેવા',
      'hi': 'पद सेवा',
      'th': 'ปาดาเสวา',
    },
    'qwfyn4hg': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // AudioTextOnly
  {
    'bf63y4ea': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
  },
  // VyasaPuja
  {
    'm6nznfto': {
      'en': 'Vyasa Puja',
      'gu': 'વ્યાસ પૂજા',
      'hi': 'व्यास पूजा',
      'th': 'วยาสบูชา',
    },
    'kau24xci': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // SignInPage
  {
    '6repaq3v': {
      'en': 'VVP SWAMI',
      'gu': 'વીવીપી સ્વામી',
      'hi': 'वीवीपी स्वामी',
      'th': 'วีวีพี สวามี',
    },
    'kvdbeewh': {
      'en': 'Welcome Back',
      'gu': 'ફરી સ્વાગત છે',
      'hi': 'वापसी पर स्वागत है',
      'th': 'ยินดีต้อนรับกลับ',
    },
    'jeth3xc4': {
      'en': 'Sign in into your account',
      'gu': 'તમારા ખાતામાં સાઇન ઇન કરો',
      'hi': 'अपने खाते में साइन इन करें',
      'th': 'ลงชื่อเข้าใช้บัญชีของคุณ',
    },
    '7ne8eq57': {
      'en': 'Email',
      'gu': 'ઇમેઇલ',
      'hi': 'ईमेल',
      'th': 'อีเมล',
    },
    'ksgkitn1': {
      'en': 'Enter Email here',
      'gu': 'અહીં ઇમેઇલ દાખલ કરો',
      'hi': 'यहां ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่นี่',
    },
    'hqe2aoec': {
      'en': 'Password',
      'gu': 'પાસવર્ડ',
      'hi': 'पासवर्ड',
      'th': 'รหัสผ่าน',
    },
    'aur8616e': {
      'en': 'Enter password here',
      'gu': 'અહીં પાસવર્ડ દાખલ કરો',
      'hi': 'पासवर्ड यहां दर्ज करें',
      'th': 'กรอกรหัสผ่านที่นี่',
    },
    'ok6q30aq': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '6bmrzdcq': {
      'en': 'Enter a valid email',
      'gu': 'માન્ય ઇમેઇલ દાખલ કરો',
      'hi': 'मान्य ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่ถูกต้อง',
    },
    'lokbtqk5': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'a1nwqul8': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'mhefuvyd': {
      'en': 'Minimum 8 characters required',
      'gu': 'ઓછામાં ઓછા 8 અક્ષરો જરૂરી છે',
      'hi': 'न्यूनतम 8 अक्षर आवश्यक',
      'th': 'ต้องมีอักขระขั้นต่ำ 8 ตัว',
    },
    'td8xis34': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '2lm349ji': {
      'en': 'Forgot password?',
      'gu': 'પાસવર્ડ ભૂલી ગયા છો?',
      'hi': 'पासवर्ड भूल गए?',
      'th': 'ลืมรหัสผ่าน?',
    },
    'yufaecww': {
      'en': 'Sign In',
      'gu': 'સાઇન ઇન કરો',
      'hi': 'दाखिल करना',
      'th': 'เข้าสู่ระบบ',
    },
    'fpl6us4x': {
      'en': 'or',
      'gu': 'અથવા',
      'hi': 'या',
      'th': 'หรือ',
    },
    '8h2bd1f4': {
      'en': 'Google',
      'gu': 'ગુગલ',
      'hi': 'गूगल',
      'th': 'Google',
    },
    'u3cp7mi4': {
      'en': ' Apple',
      'gu': 'સફરજન',
      'hi': 'सेब',
      'th': 'แอปเปิล',
    },
    't40iolcg': {
      'en': 'Don\'t have an account? ',
      'gu': 'ખાતું નથી?',
      'hi': 'क्या आपके पास खाता नहीं है?',
      'th': 'ยังไม่มีบัญชีใช่ไหม?',
    },
    'uq5eej12': {
      'en': 'Sign Up',
      'gu': 'સાઇન અપ કરો',
      'hi': 'साइन अप करें',
      'th': 'สมัครสมาชิก',
    },
    'sxi79kvy': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // SignUpPage
  {
    'evjdql2q': {
      'en': 'VVP SWAMI',
      'gu': 'વીવીપી સ્વામી',
      'hi': 'वीवीपी स्वामी',
      'th': 'วีวีพี สวามี',
    },
    '7z9dk0oh': {
      'en': 'Create your account',
      'gu': 'તમારું ખાતું બનાવો',
      'hi': 'अपना खाता बनाएं',
      'th': 'สร้างบัญชีของคุณ',
    },
    'vwcbgq6j': {
      'en': 'Full Name',
      'gu': 'પૂરું નામ',
      'hi': 'पूरा नाम',
      'th': 'ชื่อ-นามสกุล',
    },
    'imubsglq': {
      'en': 'Enter Name here',
      'gu': 'અહીં નામ દાખલ કરો',
      'hi': 'यहाँ नाम दर्ज करें',
      'th': 'กรอกชื่อที่นี่',
    },
    '4vrlholx': {
      'en': 'Mobile Number',
      'gu': 'મોબાઇલ નંબર',
      'hi': 'मोबाइल नंबर',
      'th': 'เบอร์มือถือ',
    },
    '6whwqszu': {
      'en': 'Enter Mobile here',
      'gu': 'અહીં મોબાઇલ દાખલ કરો',
      'hi': 'यहां मोबाइल दर्ज करें',
      'th': 'เข้าสู่มือถือที่นี่',
    },
    'cpmjccy7': {
      'en': 'Email',
      'gu': 'ઇમેઇલ',
      'hi': 'ईमेल',
      'th': 'อีเมล',
    },
    'q7dy7bui': {
      'en': 'Enter Email here',
      'gu': 'અહીં ઇમેઇલ દાખલ કરો',
      'hi': 'यहां ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่นี่',
    },
    'n6lgp11h': {
      'en': 'Password',
      'gu': 'પાસવર્ડ',
      'hi': 'पासवर्ड',
      'th': 'รหัสผ่าน',
    },
    '2xc2s6y9': {
      'en': 'Enter password here',
      'gu': 'અહીં પાસવર્ડ દાખલ કરો',
      'hi': 'पासवर्ड यहां दर्ज करें',
      'th': 'กรอกรหัสผ่านที่นี่',
    },
    't7mgephg': {
      'en': 'Are you a disciple of Guru Maharaj?',
      'gu': 'શું તમે ગુરુ મહારાજના શિષ્ય છો?',
      'hi': 'क्या आप गुरु महाराज के शिष्य हैं?',
      'th': 'คุณเป็นศิษย์ของครูมหาราชใช่ไหม?',
    },
    'fzknecxu': {
      'en': 'Please select...',
      'gu': 'કૃપા કરીને પસંદ કરો...',
      'hi': 'कृपया चयन कीजिए...',
      'th': 'กรุณาเลือก...',
    },
    'um52hz4e': {
      'en': 'Search for an item...',
      'gu': 'કોઈ વસ્તુ શોધો...',
      'hi': 'किसी आइटम की खोज करें...',
      'th': 'ค้นหาสินค้า...',
    },
    'zpoqi8cb': {
      'en': 'Yes,I am following Guru Maharaj',
      'gu': 'હા, હું ગુરુ મહારાજને અનુસરું છું.',
      'hi': 'हां, मैं गुरु महाराज का अनुसरण कर रहा हूं',
      'th': 'ใช่ ฉันกำลังติดตามครูมหาราช',
    },
    '406pkp12': {
      'en': 'No,I am not following Guru Maharaj',
      'gu': 'ના, હું ગુરુ મહારાજને અનુસરતો નથી.',
      'hi': 'नहीं, मैं गुरु महाराज का अनुसरण नहीं कर रहा हूं',
      'th': 'ไม่ ฉันไม่ได้ติดตามครูมหาราช',
    },
    'f6zx6toi': {
      'en': 'By proceeding, you agree to our Legal',
      'gu': 'આગળ વધીને, તમે અમારા કાનૂની',
      'hi': 'आगे बढ़कर, आप हमारी कानूनी शर्तों से सहमत होते हैं',
      'th': 'การดำเนินการต่อแสดงว่าคุณยอมรับข้อกำหนดทางกฎหมายของเรา',
    },
    'drgt5ctt': {
      'en': 'Term & Conditions, Privacy Policy.',
      'gu': 'નિયમો અને શરતો, ગોપનીયતા નીતિ.',
      'hi': 'नियम एवं शर्तें, गोपनीयता नीति.',
      'th': 'ข้อกำหนดและเงื่อนไข, นโยบายความเป็นส่วนตัว',
    },
    'dtw16k77': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'fevu6soe': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'j9kr12t9': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '8pnvmae8': {
      'en': 'Please enter a valid mobile number',
      'gu': 'કૃપા કરીને માન્ય મોબાઇલ નંબર દાખલ કરો.',
      'hi': 'कृपया वैध मोबाइल नंबर दर्ज करें',
      'th': 'กรุณากรอกหมายเลขโทรศัพท์มือถือที่ถูกต้อง',
    },
    'jot50bzr': {
      'en': 'Please enter a valid mobile number',
      'gu': 'કૃપા કરીને માન્ય મોબાઇલ નંબર દાખલ કરો.',
      'hi': 'कृपया वैध मोबाइल नंबर दर्ज करें',
      'th': 'กรุณากรอกหมายเลขโทรศัพท์มือถือที่ถูกต้อง',
    },
    'yuh0xeo4': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '3itx4krw': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'wui8ugk7': {
      'en': 'Enter a valid email',
      'gu': 'માન્ય ઇમેઇલ દાખલ કરો',
      'hi': 'मान्य ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่ถูกต้อง',
    },
    '5zntekwu': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'ifw1ta24': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'uas1ny13': {
      'en': 'Minimum 8 characters required',
      'gu': 'ઓછામાં ઓછા 8 અક્ષરો જરૂરી છે',
      'hi': 'न्यूनतम 8 अक्षर आवश्यक',
      'th': 'ต้องมีอักขระขั้นต่ำ 8 ตัว',
    },
    'zuipcmc8': {
      'en':
          'Password must contain at least 1 number, \n1 lower case and 1 upper case letter',
      'gu':
          'પાસવર્ડમાં ઓછામાં ઓછો 1 નંબર, 1 લોઅરકેસ અને 1 અપરકેસ અક્ષર હોવો જોઈએ.',
      'hi':
          'पासवर्ड में कम से कम 1 अंक, 1 छोटा अक्षर और 1 बड़ा अक्षर होना चाहिए',
      'th':
          'รหัสผ่านต้องประกอบด้วยตัวเลขอย่างน้อย 1 ตัว ตัวอักษรพิมพ์เล็ก 1 ตัว และตัวอักษรพิมพ์ใหญ่ 1 ตัว',
    },
    'vbi2681x': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'pcctwej2': {
      'en': 'Sign Up',
      'gu': 'સાઇન અપ કરો',
      'hi': 'साइन अप करें',
      'th': 'สมัครสมาชิก',
    },
    'xzb0ko7r': {
      'en': 'or',
      'gu': 'અથવા',
      'hi': 'या',
      'th': 'หรือ',
    },
    'lg8cd0dd': {
      'en': 'Google',
      'gu': 'ગુગલ',
      'hi': 'गूगल',
      'th': 'Google',
    },
    'a2b880wv': {
      'en': ' Apple',
      'gu': 'સફરજન',
      'hi': 'सेब',
      'th': 'แอปเปิล',
    },
    'm1tibpnq': {
      'en': 'Already have an account? ',
      'gu': 'પહેલેથી ખાતું છે?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'th': 'มีบัญชีอยู่แล้วใช่ไหม?',
    },
    'dv1v963n': {
      'en': 'Sign In',
      'gu': 'સાઇન ઇન કરો',
      'hi': 'दाखिल करना',
      'th': 'เข้าสู่ระบบ',
    },
    '2gxbbjc9': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PledgePage
  {
    '9klpqhze': {
      'en': 'Pledge Information',
      'gu': 'પ્રતિજ્ઞા માહિતી',
      'hi': 'प्रतिज्ञा सूचना',
      'th': 'ข้อมูลคำมั่นสัญญา',
    },
    '609t5i4u': {
      'en': 'Please provide the following details to complete your pledge',
      'gu': 'તમારા પ્રતિજ્ઞા પૂર્ણ કરવા માટે કૃપા કરીને નીચેની વિગતો આપો.',
      'hi':
          'कृपया अपनी प्रतिज्ञा पूरी करने के लिए निम्नलिखित विवरण प्रदान करें',
      'th':
          'กรุณาระบุรายละเอียดต่อไปนี้เพื่อดำเนินการตามคำมั่นสัญญาของคุณให้เสร็จสมบูรณ์',
    },
    '0uguhmyo': {
      'en': 'Full Name',
      'gu': 'પૂરું નામ',
      'hi': 'पूरा नाम',
      'th': 'ชื่อ-นามสกุล',
    },
    'h7aoolqs': {
      'en': 'Enter Name here',
      'gu': 'અહીં નામ દાખલ કરો',
      'hi': 'यहाँ नाम दर्ज करें',
      'th': 'กรอกชื่อที่นี่',
    },
    'd53qc162': {
      'en': 'Mobile Number',
      'gu': 'મોબાઇલ નંબર',
      'hi': 'मोबाइल नंबर',
      'th': 'เบอร์มือถือ',
    },
    'hoyda12r': {
      'en': 'Enter Mobile Number here',
      'gu': 'અહીં મોબાઇલ નંબર દાખલ કરો',
      'hi': 'यहां मोबाइल नंबर दर्ज करें',
      'th': 'กรุณากรอกหมายเลขโทรศัพท์มือถือที่นี่',
    },
    'yhdcv0im': {
      'en': 'Email',
      'gu': 'ઇમેઇલ',
      'hi': 'ईमेल',
      'th': 'อีเมล',
    },
    'afa7yxsk': {
      'en': 'Enter Email here',
      'gu': 'અહીં ઇમેઇલ દાખલ કરો',
      'hi': 'यहां ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่นี่',
    },
    'zsuylhzw': {
      'en': 'Description',
      'gu': 'વર્ણન',
      'hi': 'विवरण',
      'th': 'คำอธิบาย',
    },
    'oh19rk09': {
      'en': 'Enter description here',
      'gu': 'અહીં વર્ણન દાખલ કરો',
      'hi': 'विवरण यहाँ दर्ज करें',
      'th': 'กรอกคำอธิบายที่นี่',
    },
    'b9qs0535': {
      'en': 'By proceeding, you agree to our Legal',
      'gu': 'આગળ વધીને, તમે અમારા કાનૂની',
      'hi': 'आगे बढ़कर, आप हमारी कानूनी शर्तों से सहमत होते हैं',
      'th': 'การดำเนินการต่อแสดงว่าคุณยอมรับข้อกำหนดทางกฎหมายของเรา',
    },
    'tgfl6d78': {
      'en': 'Term & Conditions, Privacy Policy.',
      'gu': 'નિયમો અને શરતો, ગોપનીયતા નીતિ.',
      'hi': 'नियम एवं शर्तें, गोपनीयता नीति.',
      'th': 'ข้อกำหนดและเงื่อนไข, นโยบายความเป็นส่วนตัว',
    },
    'ukvyrz3z': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '5nykgnl8': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'q0xalzw3': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'koswxgsx': {
      'en': 'Please enter valid mobile number.',
      'gu': 'કૃપા કરીને માન્ય મોબાઇલ નંબર દાખલ કરો.',
      'hi': 'कृपया वैध मोबाइल नंबर दर्ज करें.',
      'th': 'โปรดกรอกหมายเลขมือถือที่ถูกต้อง',
    },
    'gtefnxx4': {
      'en': 'Please enter valid mobile number.',
      'gu': 'કૃપા કરીને માન્ય મોબાઇલ નંબર દાખલ કરો.',
      'hi': 'कृपया वैध मोबाइल नंबर दर्ज करें.',
      'th': 'โปรดกรอกหมายเลขมือถือที่ถูกต้อง',
    },
    'o21ehe0i': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '6n7m8mbb': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'm8f5vto6': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'fle3q0bo': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'xeos3c66': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '2c0gq00j': {
      'en': 'Submit',
      'gu': 'સબમિટ કરો',
      'hi': 'जमा करना',
      'th': 'ส่ง',
    },
    '2w91rhkj': {
      'en': 'You have already submitted. No further action is required.',
      'gu': 'તમે પહેલેથી જ સબમિટ કરી દીધું છે. આગળ કોઈ કાર્યવાહીની જરૂર નથી.',
      'hi':
          'आपने पहले ही सबमिट कर दिया है। आगे कोई कार्रवाई की आवश्यकता नहीं है।',
      'th': 'คุณได้ส่งเอกสารเรียบร้อยแล้ว ไม่จำเป็นต้องดำเนินการใดๆ เพิ่มเติม',
    },
    'b11xb70q': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // AboutPage
  {
    'lalrl7sr': {
      'en': 'About',
      'gu': 'વિશે',
      'hi': 'के बारे में',
      'th': 'เกี่ยวกับ',
    },
    'hbsjzqcv': {
      'en': 'His Holiness Vedavyasapriya Swami',
      'gu': 'પરમ પવિત્ર વેદવ્યાસપ્રિય સ્વામી',
      'hi': 'परम पूज्य वेदव्यासप्रिया स्वामी',
      'th': 'สมเด็จพระเวทพยสัปริยะสวามี',
    },
    'qu3ttsk9': {
      'en': 'Introduction and Early Life\n',
      'gu': 'પરિચય અને પ્રારંભિક જીવન',
      'hi': 'परिचय और प्रारंभिक जीवन',
      'th': 'บทนำและชีวิตช่วงต้น',
    },
    'o57jkpka': {
      'en':
          'His Holiness Vedavyasapriya Swami Maharaja was born into a traditional Audichya Sahasra Brahmana family in Kadod, Gujarat, India on August 1, 1944, a date marked by the auspicious Pavitra Dwadashi. He was introduced to spiritual practices at a young age by his mother and developed a strong passion for spiritual literature, especially the Bhagavad-gita, and the well-being of humanity. After moving to East Africa and eventually settling in the United States in 1971, he deepened his spiritual journey. Encountering devotees of His Divine Grace A.C. Bhaktivedanta Srila Prabhupada shortly after his arrival in US sparked his dedication to sharing Krishna Consciousness teachings while pursuing a career as a research biochemist.\n\n',
      'gu':
          'પરમ પૂજ્ય વેદવ્યાસપ્રિય સ્વામી મહારાજનો જન્મ ૧ ઓગસ્ટ, ૧૯૪૪ ના રોજ ગુજરાતના કડોદમાં એક પરંપરાગત ઔડિચ્ય સહસ્ત્ર બ્રાહ્મણ પરિવારમાં થયો હતો, જે પવિત્ર દ્વાદશીની તિથિ હતી. તેમની માતાએ તેમને નાની ઉંમરે આધ્યાત્મિક સાધનાનો પરિચય કરાવ્યો હતો અને આધ્યાત્મિક સાહિત્ય, ખાસ કરીને ભગવદ ગીતા અને માનવતાના કલ્યાણ માટે તેમનો ઉત્સાહ વધ્યો હતો. ૧૯૭૧ માં પૂર્વ આફ્રિકા ગયા પછી અને આખરે યુનાઇટેડ સ્ટેટ્સમાં સ્થાયી થયા પછી, તેમણે તેમની આધ્યાત્મિક યાત્રાને વધુ ગાઢ બનાવી. અમેરિકામાં આગમન પછી તરત જ તેમના દૈવી કૃપા એ.સી. ભક્તિવેદાંત શ્રીલ પ્રભુપાદના ભક્તોને મળવાથી કૃષ્ણ ભાવનામૃતના ઉપદેશો વહેંચવા પ્રત્યેના તેમના સમર્પણને પ્રેરણા મળી, અને સાથે સાથે એક સંશોધન બાયોકેમિસ્ટ તરીકે કારકિર્દી બનાવી.',
      'hi':
          'परम पावन वेदव्यासप्रिय स्वामी महाराज का जन्म 1 अगस्त, 1944 को गुजरात के कडोद में एक पारंपरिक औदिच्य सहस्र ब्राह्मण परिवार में हुआ था, यह तिथि पवित्र द्वादशी के दिन मनाई जाती है। उन्हें उनकी माँ ने छोटी उम्र में ही आध्यात्मिक अभ्यासों से परिचित कराया था और आध्यात्मिक साहित्य, विशेष रूप से भगवद-गीता और मानवता की भलाई के लिए उनका गहरा जुनून था। पूर्वी अफ्रीका जाने और अंततः 1971 में संयुक्त राज्य अमेरिका में बसने के बाद, उन्होंने अपनी आध्यात्मिक यात्रा को और गहरा किया। अमेरिका पहुंचने के कुछ समय बाद ही परम पूज्य ए.सी. भक्तिवेदांत श्रील प्रभुपाद के भक्तों से मुलाकात ने एक शोध जैव रसायनज्ञ के रूप में अपना करियर बनाते हुए कृष्ण चेतना की शिक्षाओं को साझा करने के प्रति उनके समर्पण को प्रेरित किया।',
      'th':
          'พระมหาราชาเวทาวยาสปริยะเกิดในครอบครัวพราหมณ์สายอาวัชรแบบดั้งเดิมในเมืองกาโดด รัฐคุชราต ประเทศอินเดีย เมื่อวันที่ 1 สิงหาคม พ.ศ. 2487 ซึ่งเป็นวันมงคลตามปฏิทินปาวิตรา ทวาทสี พระองค์ทรงได้รับการแนะนำให้รู้จักแนวทางปฏิบัติทางจิตวิญญาณตั้งแต่ยังทรงพระเยาว์จากพระมารดา และทรงมีความหลงใหลในวรรณกรรมทางจิตวิญญาณอย่างแรงกล้า โดยเฉพาะภควัทคีตา และความเป็นอยู่ที่ดีของมนุษยชาติ หลังจากทรงย้ายไปแอฟริกาตะวันออกและตั้งรกรากในสหรัฐอเมริกาในที่สุดในปีพ.ศ. 2514 พระองค์ได้ทรงเดินทางทางจิตวิญญาณอย่างลึกซึ้งยิ่งขึ้น การได้พบกับผู้ศรัทธาในพระคุณอันศักดิ์สิทธิ์ของพระองค์ เอ.ซี. ภักติเวทานตะ ศรีลา ปรภูปาดะ ไม่นานหลังจากที่พระองค์มาถึงสหรัฐอเมริกา ทำให้เกิดความมุ่งมั่นในการเผยแพร่คำสอนเรื่องพระกฤษณะในขณะที่ประกอบอาชีพเป็นนักชีวเคมีวิจัย',
    },
    '0or3s5q7': {
      'en': 'Contributions to ISKCON and Community Service\n',
      'gu': 'ઇસ્કોન અને સમુદાય સેવામાં યોગદાન',
      'hi': 'इस्कॉन और सामुदायिक सेवा में योगदान',
      'th': 'การมีส่วนสนับสนุนต่อ ISKCON และการบริการชุมชน',
    },
    '8lnli6tp': {
      'en':
          'His Holiness Vedavyasapriya Swami Maharaja is a dedicated advocate for community service within ISKCON. Starting in the United States, he worked to foster unity among diverse cultural backgrounds by establishing worship of the Sri Nathji deity, strengthening connections between Indian devotees, especially the Gujarati community, and ISKCON. In addition to his administrative roles, such as serving as the president of the Queens temple and later the Director of Bharatiya Community Services in New Vrindaban, he raised awareness about Vedic teachings and promoted spiritual growth. Transitioning his focus to India, as had been directed by Srila Prabhupada, he continues to inspire and guide devotees through preaching and personal example.\n\n',
      'gu':
          'પરમ પૂજ્ય વેદવ્યાસપ્રિય સ્વામી મહારાજ ઇસ્કોનમાં સમુદાય સેવાના સમર્પિત હિમાયતી છે. યુનાઇટેડ સ્ટેટ્સમાં શરૂઆત કરીને, તેમણે શ્રી નાથજી દેવતાની પૂજા સ્થાપિત કરીને, ભારતીય ભક્તો, ખાસ કરીને ગુજરાતી સમુદાય અને ઇસ્કોન વચ્ચે જોડાણ મજબૂત કરીને વિવિધ સાંસ્કૃતિક પૃષ્ઠભૂમિઓમાં એકતાને પ્રોત્સાહન આપવાનું કામ કર્યું. ક્વીન્સ મંદિરના પ્રમુખ અને બાદમાં ન્યૂ વૃંદાવનમાં ભારતીય સમુદાય સેવાઓના નિયામક તરીકે સેવા આપવા જેવી તેમની વહીવટી ભૂમિકાઓ ઉપરાંત, તેમણે વૈદિક ઉપદેશો વિશે જાગૃતિ ફેલાવી અને આધ્યાત્મિક વિકાસને પ્રોત્સાહન આપ્યું. શ્રીલ પ્રભુપાદ દ્વારા નિર્દેશિત ભારત પર પોતાનું ધ્યાન કેન્દ્રિત કરીને, તેઓ ઉપદેશ અને વ્યક્તિગત ઉદાહરણ દ્વારા ભક્તોને પ્રેરણા અને માર્ગદર્શન આપવાનું ચાલુ રાખે છે.',
      'hi':
          'परम पावन वेदव्यासप्रिया स्वामी महाराज इस्कॉन के भीतर सामुदायिक सेवा के लिए समर्पित अधिवक्ता हैं। संयुक्त राज्य अमेरिका से शुरू करके, उन्होंने श्री नाथजी देवता की पूजा की स्थापना करके, भारतीय भक्तों, विशेष रूप से गुजराती समुदाय और इस्कॉन के बीच संबंधों को मजबूत करके विविध सांस्कृतिक पृष्ठभूमि के बीच एकता को बढ़ावा देने का काम किया। अपनी प्रशासनिक भूमिकाओं के अलावा, जैसे कि क्वींस मंदिर के अध्यक्ष और बाद में न्यू वृंदावन में भारतीय सामुदायिक सेवाओं के निदेशक के रूप में सेवा करते हुए, उन्होंने वैदिक शिक्षाओं के बारे में जागरूकता बढ़ाई और आध्यात्मिक विकास को बढ़ावा दिया। श्रील प्रभुपाद द्वारा निर्देशित भारत पर अपना ध्यान केंद्रित करते हुए, वे उपदेश और व्यक्तिगत उदाहरण के माध्यम से भक्तों को प्रेरित और मार्गदर्शन करना जारी रखते हैं।',
      'th':
          'พระองค์ Vedavyasapriya Swami Maharaja ทรงเป็นผู้สนับสนุนที่ทุ่มเทให้กับการบริการชุมชนภายใน ISKCON พระองค์ทรงเริ่มต้นที่สหรัฐอเมริกาและทรงทำงานเพื่อส่งเสริมความสามัคคีในหมู่วัฒนธรรมที่หลากหลายโดยก่อตั้งการบูชาเทพเจ้า Sri Nathji เสริมสร้างความสัมพันธ์ระหว่างผู้ศรัทธาชาวอินเดีย โดยเฉพาะชุมชนชาวคุชราตและ ISKCON นอกเหนือจากบทบาทในการบริหารของพระองค์ เช่น ดำรงตำแหน่งประธานของวัด Queens และต่อมาเป็นผู้อำนวยการ Bharatiya Community Services ใน New Vrindaban แล้ว พระองค์ยังทรงสร้างความตระหนักรู้เกี่ยวกับคำสอนของพระเวทและส่งเสริมการเติบโตทางจิตวิญญาณอีกด้วย พระองค์ทรงเปลี่ยนความสนใจไปที่อินเดียตามที่ Srila Prabhupada ทรงชี้นำ พระองค์ยังคงสร้างแรงบันดาลใจและชี้นำผู้ศรัทธาผ่านการเทศนาและตัวอย่างส่วนตัว',
    },
    'suqp5s2a': {
      'en': 'Establishment of Sri Nathji Deity in New Vrindaban, US\n',
      'gu': 'અમેરિકાના નવા વૃંદાવનમાં શ્રીનાથજી દેવતાની સ્થાપના',
      'hi': 'न्यू वृंदावन, अमेरिका में श्री नाथजी विग्रह की स्थापना',
      'th': 'การสถาปนาเทวรูปศรีนาถจิในเมืองนิววรินดาบัน สหรัฐอเมริกา',
    },
    'w6cmlv4i': {
      'en':
          'The journey to establish the worship of the Sri Nathji Gopal deity in the Western world can be traced back to Vedavyasapriya Swami\'s vision in 1978. This vision was fuelled by the aspirations of the Gujarati community and the support of ISKCON life members. Recognising the deep historical and devotional significance of Sri Nathji, who had been unveiled by Sri Madhavendra Puri after being hidden for protection, the Swami sought to bring this beloved deity to New York. The Governing Body Commission (GBC) approved his plans, leading to the commissioning of a deity made by devotee Mahesvara Das. \nThe deity was initially installed at the 55th Street temple, but the worship faced challenges, including the sale of the temple and the subsequent shift toward establishing multiple worship centres. However, the determination of Vedavyasapriya Swami and his community ultimately triumphed. This culminated in the successful installation of Sri Nathji in New Vrindaban in 1983, fostering a vibrant spiritual legacy that continues to inspire devotees across the globe.\n\n',
      'gu':
          'પશ્ચિમી વિશ્વમાં શ્રી નાથજી ગોપાલ દેવતાની પૂજા સ્થાપિત કરવાની યાત્રા ૧૯૭૮માં વેદવ્યાસપ્રિય સ્વામીના વિઝન સુધી પહોંચી શકે છે. આ વિઝન ગુજરાતી સમુદાયની આકાંક્ષાઓ અને ઇસ્કોનના આજીવન સભ્યોના સમર્થનથી પ્રેરિત થયું હતું. શ્રી નાથજીના ઊંડા ઐતિહાસિક અને ભક્તિમય મહત્વને ઓળખીને, જેમને શ્રી માધવેન્દ્ર પુરી દ્વારા રક્ષણ માટે છુપાયેલા રાખવામાં આવ્યા હતા, સ્વામીએ આ પ્રિય દેવતાને ન્યૂ યોર્ક લાવવાનો પ્રયાસ કર્યો. ગવર્નિંગ બોડી કમિશન (GBC) એ તેમની યોજનાઓને મંજૂરી આપી, જેના કારણે ભક્ત મહેશ્વર દાસ દ્વારા બનાવેલા દેવતાનું કાર્ય શરૂ થયું. \n શરૂઆતમાં આ દેવતા ૫૫મી સ્ટ્રીટ મંદિરમાં સ્થાપિત કરવામાં આવ્યા હતા, પરંતુ પૂજામાં પડકારોનો સામનો કરવો પડ્યો, જેમાં મંદિરનું વેચાણ અને ત્યારબાદ અનેક પૂજા કેન્દ્રો સ્થાપવા તરફનો ફેરફાર સામેલ હતો. જોકે, વેદવ્યાસપ્રિય સ્વામી અને તેમના સમુદાયનો નિર્ણય આખરે સફળ રહ્યો. આનો અંત ૧૯૮૩માં ન્યૂ વૃંદાવનમાં શ્રી નાથજીની સફળ સ્થાપનામાં થયો, જેનાથી એક જીવંત આધ્યાત્મિક વારસો બન્યો જે વિશ્વભરના ભક્તોને પ્રેરણા આપતો રહે છે.',
      'hi':
          'पश्चिमी दुनिया में श्री नाथजी गोपाल देवता की पूजा को स्थापित करने की यात्रा का पता वेदव्यासप्रिया स्वामी के 1978 के दर्शन से लगाया जा सकता है। यह दर्शन गुजराती समुदाय की आकांक्षाओं और इस्कॉन के आजीवन सदस्यों के समर्थन से प्रेरित था। श्री नाथजी के गहरे ऐतिहासिक और भक्ति महत्व को पहचानते हुए, जिन्हें सुरक्षा के लिए छुपाए जाने के बाद श्री माधवेंद्र पुरी ने अनावरण किया था, स्वामी ने इस प्रिय देवता को न्यूयॉर्क लाने की मांग की। शासी निकाय आयोग (GBC) ने उनकी योजनाओं को मंजूरी दी, जिसके परिणामस्वरूप भक्त महेश्वर दास द्वारा बनाए गए देवता की स्थापना हुई। \nदेवी को शुरू में 55वें स्ट्रीट मंदिर में स्थापित किया गया था, लेकिन पूजा को चुनौतियों का सामना करना पड़ा, जिसमें मंदिर की बिक्री और बाद में कई पूजा केंद्र स्थापित करने की ओर बदलाव शामिल था इसकी परिणति 1983 में नए वृंदावन में श्री नाथजी की सफल स्थापना के रूप में हुई, जिससे एक जीवंत आध्यात्मिक विरासत का विकास हुआ, जो दुनिया भर के भक्तों को प्रेरित करती रही है।',
      'th':
          'การเดินทางเพื่อสถาปนาการบูชาเทพเจ้าศรีนาถจีโกปาลในโลกตะวันตกสามารถสืบย้อนไปถึงวิสัยทัศน์ของ Vedavyasapriya Swami ในปี 1978 วิสัยทัศน์นี้ได้รับแรงผลักดันจากความปรารถนาของชุมชนชาวคุชราตและการสนับสนุนของสมาชิกตลอดชีพของ ISKCON เมื่อตระหนักถึงความสำคัญทางประวัติศาสตร์และความศรัทธาอันลึกซึ้งของ Sri Nathji ซึ่งถูกเปิดเผยโดย Sri Madhavendra Puri หลังจากถูกซ่อนไว้เพื่อปกป้อง Swami จึงพยายามนำเทพเจ้าอันเป็นที่รักนี้มาที่นิวยอร์ก คณะกรรมการบริหาร (GBC) อนุมัติแผนของเขา ส่งผลให้มีการแต่งตั้งเทพเจ้าที่สร้างโดยผู้ศรัทธาอย่าง Mahesvara Das \nในตอนแรก เทพเจ้าถูกติดตั้งที่วัด 55th Street แต่การบูชาต้องเผชิญกับความท้าทาย รวมถึงการขายวัดและการเปลี่ยนแปลงในเวลาต่อมาเพื่อจัดตั้งศูนย์บูชาหลายแห่ง อย่างไรก็ตาม ความมุ่งมั่นของ Vedavyasapriya Swami และชุมชนของเขาในที่สุดก็ได้รับชัยชนะ ซึ่งจุดสุดยอดดังกล่าวคือความสำเร็จในการสถาปนา Sri Nathji ใน New Vrindaban เมื่อปี 1983 ซึ่งช่วยส่งเสริมมรดกทางจิตวิญญาณอันมีชีวิตชีวาที่ยังคงสร้างแรงบันดาลใจให้กับผู้ศรัทธาทั่วโลก',
    },
    'h5lz9wg6': {
      'en':
          'Assisting in the Construction and Finishing of Sri Sri Radha Damodara in Sigatoka, Fiji\n',
      'gu':
          'ફીજીના સિગાટોકામાં શ્રી શ્રી રાધા દામોદરાના બાંધકામ અને પૂર્ણાહુતિમાં સહાયતા',
      'hi':
          'सिगाटोका, फिजी में श्री श्री राधा दामोदर के निर्माण और परिष्करण में सहायता करना',
      'th':
          'ช่วยเหลือในการก่อสร้างและการตกแต่ง Sri Sri Radha Damodara ใน Sigatoka ฟิจิ',
    },
    'q95yut3z': {
      'en':
          'When two of His Holiness Tamal Krishna Goswami Maharaja\'s disciples expressed a desire to build a magnificent temple in Sigatoka, Fiji, as an offering to their spiritual master, His Holiness Tamal Krishna Goswami, His Holiness Vedavyasapriya Swami took on the role of project coordinator. He assisted with all stages of the temple\'s design and construction, personally spending months in Sigatoka to oversee the process.\nVedavyasapriya Swami designed the temple\'s appearance to evoke the mood of Kusum Sarovar in Govardhan. He also arranged for skilled artists in India to create wonderful dioramas inspired by Srimad Bhagavatam, especially depicting the pastimes of Sri Sri Radha Damodara and Lord Ramachandra. These displays are will continue to attract the local community, devotees worldwide, and even tourists visiting the seaside resort town.\n\n',
      'gu':
          'જ્યારે પરમ પૂજ્ય તમાલ કૃષ્ણ ગોસ્વામી મહારાજના બે શિષ્યોએ તેમના આધ્યાત્મિક ગુરુ, પરમ પૂજ્ય તમાલ કૃષ્ણ ગોસ્વામીને અર્પણ તરીકે ફીજીના સિગાટોકામાં એક ભવ્ય મંદિર બનાવવાની ઇચ્છા વ્યક્ત કરી, ત્યારે પરમ પૂજ્ય વેદવ્યાસપ્રિય સ્વામીએ પ્રોજેક્ટ સંયોજકની ભૂમિકા સંભાળી. તેમણે મંદિરની ડિઝાઇન અને બાંધકામના તમામ તબક્કામાં મદદ કરી, વ્યક્તિગત રીતે પ્રક્રિયાની દેખરેખ માટે મહિનાઓ સિગાટોકામાં વિતાવ્યા.\n વેદવ્યાસપ્રિય સ્વામીએ ગોવર્ધનમાં કુસુમ સરોવરના મૂડને ઉજાગર કરવા માટે મંદિરના દેખાવની રચના કરી. તેમણે શ્રીમદ્ ભાગવતમથી પ્રેરિત અદ્ભુત ડાયરોમા બનાવવા માટે ભારતમાં કુશળ કલાકારોની પણ વ્યવસ્થા કરી, ખાસ કરીને શ્રી શ્રી રાધા દામોદર અને ભગવાન રામચંદ્રના લીલાછમ કાર્યોનું ચિત્રણ. આ પ્રદર્શનો સ્થાનિક સમુદાય, વિશ્વભરના ભક્તો અને દરિયા કિનારે આવેલા રિસોર્ટ શહેરની મુલાકાત લેતા પ્રવાસીઓને પણ આકર્ષિત કરતા રહેશે.',
      'hi':
          'जब परम पूज्य तमाल कृष्ण गोस्वामी महाराज के दो शिष्यों ने अपने आध्यात्मिक गुरु परम पूज्य तमाल कृष्ण गोस्वामी को भेंट स्वरूप फिजी के सिगाटोका में एक भव्य मंदिर बनाने की इच्छा व्यक्त की, तो परम पूज्य वेदव्यासप्रिया स्वामी ने परियोजना समन्वयक की भूमिका निभाई। उन्होंने मंदिर के डिजाइन और निर्माण के सभी चरणों में सहायता की, इस प्रक्रिया की देखरेख के लिए व्यक्तिगत रूप से सिगाटोका में कई महीने बिताए।\nवेदव्यासप्रिया स्वामी ने गोवर्धन में कुसुम सरोवर के मूड को जगाने के लिए मंदिर का स्वरूप तैयार किया। उन्होंने श्रीमद् भागवतम से प्रेरित अद्भुत चित्रावली बनाने के लिए भारत में कुशल कलाकारों की भी व्यवस्था की, विशेष रूप से श्री श्री राधा दामोदर और भगवान रामचंद्र की लीलाओं को दर्शाते हुए। ये प्रदर्शन स्थानीय समुदाय, दुनिया भर के भक्तों और यहां तक ​​कि समुद्र तटीय रिसॉर्ट शहर में आने वाले पर्यटकों को भी आकर्षित करते रहेंगे।',
      'th':
          'เมื่อสาวกของพระองค์ Tamal Krishna Goswami Maharaja สององค์แสดงความปรารถนาที่จะสร้างวิหารอันงดงามในเมือง Sigatoka ประเทศฟิจิ เพื่อถวายแด่พระอาจารย์ทางจิตวิญญาณของพระองค์ Tamal Krishna Goswami พระองค์ Vedavyasapriya Swami จึงรับหน้าที่เป็นผู้ประสานงานโครงการ พระองค์ช่วยเหลือในทุกขั้นตอนของการออกแบบและก่อสร้างวิหาร โดยใช้เวลาหลายเดือนใน Sigatoka เป็นการส่วนตัวเพื่อดูแลกระบวนการ\nVedavyasapriya Swami ออกแบบรูปลักษณ์ของวิหารเพื่อให้เกิดอารมณ์ของ Kusum Sarovar ใน Govardhan พระองค์ยังได้จัดเตรียมศิลปินที่มีทักษะในอินเดียเพื่อสร้างไดโอรามาที่สวยงามซึ่งได้รับแรงบันดาลใจจาก Srimad Bhagavatam โดยเฉพาะอย่างยิ่งการแสดงภาพการเล่นสนุกของ Sri Sri Radha Damodara และ Lord Ramachandra การจัดแสดงเหล่านี้จะดึงดูดชุมชนในท้องถิ่น ผู้ศรัทธาจากทั่วโลก และแม้แต่นักท่องเที่ยวที่มาเยือนเมืองตากอากาศริมทะเลแห่งนี้',
    },
    '4u3dbil9': {
      'en':
          'Aspiration to Fulfil Srila Prabhupada’s desires for a temple in Bangkok\n',
      'gu':
          'બેંગકોકમાં મંદિર બનાવવાની શ્રીલ પ્રભુપાદની ઇચ્છા પૂર્ણ કરવાની આકાંક્ષા',
      'hi':
          'बैंकॉक में मंदिर बनाने की श्रील प्रभुपाद की इच्छा को पूरा करने की आकांक्षा',
      'th':
          'ความปรารถนาที่จะสนองความปรารถนาของศรีลาพระภูปาทในการสร้างวัดในกรุงเทพฯ',
    },
    'vmykdt39': {
      'en':
          'His Holiness Vedavyasapriya Swami has now turned his attention to fulfilling Srila Prabhupada\'s desire to establish a Vedic center and preaching facility in Bangkok, Thailand. Vedavyasapriya Swami was inspired and encouraged by his god-brother, Yogeshwar Das, who Srila Prabhupada had personally encouraged to set up a centre in Bangkok in 1974 (unfortunately Yogeshwar was unable to make much progress on Srila Prabhupada\'s vision at that time). \nHis Holiness Vedavyasapriya Swami has designed a wonderful Vedic complex with exterior in the mood of Hawah Mahal in Jaipur, India, including a guesthouse, Vedic cultural and education centre, and a place of worship for deities of Sri Sri Radha Siamsunder (aligning with the original name of this area of Siam Desh), along with Sri Nathji and Gaura Nitai.\n\n',
      'gu':
          'પરમ પૂજ્ય વેદવ્યાસપ્રિય સ્વામીએ હવે થાઈલેન્ડના બેંગકોકમાં વૈદિક કેન્દ્ર અને ઉપદેશ સુવિધા સ્થાપિત કરવાની શ્રીલ પ્રભુપાદની ઇચ્છાને પૂર્ણ કરવા તરફ ધ્યાન કેન્દ્રિત કર્યું છે. વેદવ્યાસપ્રિય સ્વામીને તેમના ધર્મ-ભાઈ, યોગેશ્વર દાસ દ્વારા પ્રેરણા અને પ્રોત્સાહન મળ્યું હતું, જેમને શ્રીલ પ્રભુપાદે વ્યક્તિગત રીતે 1974 માં બેંગકોકમાં એક કેન્દ્ર સ્થાપવા માટે પ્રોત્સાહિત કર્યા હતા (કમનસીબે યોગેશ્વર તે સમયે શ્રીલ પ્રભુપાદના દ્રષ્ટિકોણ પર વધુ પ્રગતિ કરી શક્યા ન હતા). \n પરમ પૂજ્ય વેદવ્યાસપ્રિય સ્વામીએ ભારતના જયપુરમાં હવાહ મહેલના મૂડમાં બાહ્ય દેખાવ સાથે એક અદ્ભુત વૈદિક સંકુલ ડિઝાઇન કર્યું છે, જેમાં એક ગેસ્ટહાઉસ, વૈદિક સાંસ્કૃતિક અને શિક્ષણ કેન્દ્ર અને શ્રી શ્રી રાધા સિયામસુંદર (સિયામ દેશના આ વિસ્તારના મૂળ નામ સાથે સંરેખિત) ના દેવતાઓ માટે પૂજા સ્થળનો સમાવેશ થાય છે, જેમાં શ્રી નાથજી અને ગૌર નિતાઈનો સમાવેશ થાય છે.',
      'hi':
          'परम पूज्य वेदव्यासप्रिया स्वामी ने अब अपना ध्यान श्रील प्रभुपाद की इच्छा को पूरा करने की ओर लगाया है, जो कि थाईलैंड के बैंकॉक में एक वैदिक केंद्र और प्रचार केंद्र स्थापित करने की है। वेदव्यासप्रिया स्वामी को उनके धर्म-भाई योगेश्वर दास ने प्रेरित और प्रोत्साहित किया था, जिन्हें श्रील प्रभुपाद ने व्यक्तिगत रूप से 1974 में बैंकॉक में एक केंद्र स्थापित करने के लिए प्रोत्साहित किया था (दुर्भाग्य से योगेश्वर उस समय श्रील प्रभुपाद की दृष्टि पर अधिक प्रगति करने में असमर्थ थे)। \nपरम पूज्य वेदव्यासप्रिया स्वामी ने भारत के जयपुर में हवा महल के माहौल में एक अद्भुत वैदिक परिसर का डिज़ाइन तैयार किया है, जिसमें एक गेस्टहाउस, वैदिक सांस्कृतिक और शिक्षा केंद्र, और श्री श्री राधा श्यामसुंदर (सियाम देश के इस क्षेत्र के मूल नाम के साथ संरेखित), श्री नाथजी और गौरा निताई के साथ पूजा का स्थान शामिल है।',
      'th':
          'บัดนี้ พระองค์เวทาวยาสปริยะสวามีทรงหันความสนใจไปที่การสนองความปรารถนาของศรีลาพระภูปาทที่จะก่อตั้งศูนย์พระเวทและสถานที่เผยแผ่พระธรรมเทศนาในกรุงเทพมหานคร ประเทศไทย พระองค์เวทาวยาสปริยะสวามีได้รับแรงบันดาลใจและกำลังใจจากโยเกศวาร์ ดาส พี่ชายผู้เป็นเทพของพระองค์ ซึ่งศรีลาพระภูปาทได้สนับสนุนเป็นการส่วนตัวให้ก่อตั้งศูนย์ในกรุงเทพมหานครในปี 1974 (น่าเสียดายที่โยเกศวาร์ไม่สามารถทำให้วิสัยทัศน์ของศรีลาพระภูปาทก้าวหน้าไปได้มากนักในตอนนั้น) \nพระองค์เวทาวยาสปริยะสวามีทรงออกแบบอาคารพระเวทที่สวยงามพร้อมภายนอกที่ให้ความรู้สึกเหมือนฮาวาห์มาฮาลในเมืองชัยปุระ ประเทศอินเดีย ซึ่งรวมถึงเกสต์เฮาส์ ศูนย์วัฒนธรรมและการศึกษาพระเวท และสถานที่สักการะบูชาเทพเจ้าของศรีศรีราธาสยามสุนเดอร์ (ซึ่งสอดคล้องกับชื่อเดิมของพื้นที่สยามเดชนี้) ร่วมกับศรีนาถจีและเคารานิไต',
    },
    'edp9yszp': {
      'en': 'Conclusion\n',
      'gu': 'નિષ્કર્ષ',
      'hi': 'निष्कर्ष',
      'th': 'บทสรุป',
    },
    'deutile5': {
      'en':
          'Vedavyasapriya Swami Maharaja\'s unwavering commitment to spiritual advancement and community service has left an indelible mark on countless lives. Shifting from biochemist to a revered ISKCON figure, his experiences reflect a profound understanding of the interconnectedness of faith and duty. He facilitated the establishment of Sri Nathji worship in the West and helped disseminate Srila Prabhupada\'s teachings globally, fostering devotion across diverse communities. As an Initiating Spiritual Master, Vedavyasapriya Swami prioritises guidance and spiritual growth over administrative duties. Continuing to nurture disciples and share the teachings of Sri Guru and Sri Krishna, he remains a pillar of strength and inspiration within the devotional community. His life stands as both a testament and an invitation to explore the depths of spiritual fulfilment through dedicated practice and compassionate service.',
      'gu':
          'વેદવ્યાસપ્રિય સ્વામી મહારાજની આધ્યાત્મિક પ્રગતિ અને સમુદાય સેવા પ્રત્યેની અતૂટ પ્રતિબદ્ધતાએ અસંખ્ય જીવન પર અમીટ છાપ છોડી છે. બાયોકેમિસ્ટથી એક આદરણીય ઇસ્કોન વ્યક્તિત્વ તરફ પ્રયાણ કરતા, તેમના અનુભવો શ્રદ્ધા અને ફરજના પરસ્પર જોડાણની ઊંડી સમજણ દર્શાવે છે. તેમણે પશ્ચિમમાં શ્રીનાથજી ઉપાસનાની સ્થાપનામાં મદદ કરી અને શ્રીલ પ્રભુપાદના ઉપદેશોને વૈશ્વિક સ્તરે પ્રસારિત કરવામાં મદદ કરી, વિવિધ સમુદાયોમાં ભક્તિને પ્રોત્સાહન આપ્યું. એક દીક્ષા આપનાર આધ્યાત્મિક ગુરુ તરીકે, વેદવ્યાસપ્રિય સ્વામી વહીવટી ફરજો કરતાં માર્ગદર્શન અને આધ્યાત્મિક વિકાસને પ્રાથમિકતા આપે છે. શિષ્યોનું પાલનપોષણ કરવાનું અને શ્રી ગુરુ અને શ્રી કૃષ્ણના ઉપદેશોને શેર કરવાનું ચાલુ રાખીને, તેઓ ભક્તિ સમુદાયમાં શક્તિ અને પ્રેરણાના સ્તંભ તરીકે રહે છે. તેમનું જીવન સમર્પિત અભ્યાસ અને કરુણાપૂર્ણ સેવા દ્વારા આધ્યાત્મિક પરિપૂર્ણતાના ઊંડાણોને શોધવા માટે એક વસિયતનામું અને આમંત્રણ બંને તરીકે ઊભું છે.',
      'hi':
          'आध्यात्मिक उन्नति और सामुदायिक सेवा के प्रति वेदव्यासप्रिया स्वामी महाराज की अटूट प्रतिबद्धता ने अनगिनत लोगों के जीवन पर अमिट छाप छोड़ी है। बायोकेमिस्ट से लेकर एक प्रतिष्ठित इस्कॉन व्यक्ति तक, उनके अनुभवों में आस्था और कर्तव्य के परस्पर संबंध की गहन समझ झलकती है। उन्होंने पश्चिम में श्री नाथजी पूजा की स्थापना में मदद की और विभिन्न समुदायों में भक्ति को बढ़ावा देते हुए श्रील प्रभुपाद की शिक्षाओं को वैश्विक स्तर पर फैलाने में मदद की। एक आरंभिक आध्यात्मिक गुरु के रूप में, वेदव्यासप्रिया स्वामी प्रशासनिक कर्तव्यों पर मार्गदर्शन और आध्यात्मिक विकास को प्राथमिकता देते हैं। शिष्यों का पोषण करना और श्री गुरु और श्री कृष्ण की शिक्षाओं को साझा करना जारी रखते हुए, वे भक्ति समुदाय के भीतर शक्ति और प्रेरणा का एक स्तंभ बने हुए हैं। उनका जीवन समर्पित अभ्यास और करुणामय सेवा के माध्यम से आध्यात्मिक पूर्णता की गहराई का पता लगाने के लिए एक वसीयतनामा और एक निमंत्रण दोनों के रूप में खड़ा है।',
      'th':
          'ความมุ่งมั่นอย่างไม่ลดละของ Vedavyasapriya Swami ในการพัฒนาจิตวิญญาณและการบริการชุมชนได้ทิ้งรอยประทับที่ลบไม่ออกไว้ในชีวิตนับไม่ถ้วน จากนักชีวเคมีไปสู่บุคคลสำคัญที่ได้รับการยกย่องของ ISKCON ประสบการณ์ของเขาสะท้อนให้เห็นความเข้าใจอย่างลึกซึ้งถึงความเชื่อมโยงกันของศรัทธาและหน้าที่ เขาอำนวยความสะดวกในการก่อตั้งการบูชา Sri Nathji ในโลกตะวันตกและช่วยเผยแพร่คำสอนของ Srila Prabhupada ไปทั่วโลก ส่งเสริมความศรัทธาในชุมชนที่หลากหลาย ในฐานะปรมาจารย์ทางจิตวิญญาณผู้ริเริ่ม Vedavyasapriya Swami ให้ความสำคัญกับการชี้นำและการเติบโตทางจิตวิญญาณมากกว่าหน้าที่การบริหาร เขายังคงดูแลลูกศิษย์และแบ่งปันคำสอนของ Sri Guru และ Sri Krishna และยังคงเป็นเสาหลักของความแข็งแกร่งและแรงบันดาลใจในชุมชนผู้อุทิศตน ชีวิตของเขายืนหยัดเป็นทั้งพยานหลักฐานและคำเชิญชวนให้สำรวจความลึกซึ้งของความสำเร็จทางจิตวิญญาณผ่านการฝึกฝนอย่างทุ่มเทและการให้บริการด้วยความเมตตา',
    },
    '7uxrdawd': {
      'en':
          'Introduction and Early Life\nHis Holiness Vedavyasapriya Swami Maharaja was born into a traditional Audichya Sahasra Brahmana family in Kadod, Gujarat, India on August 1, 1944, a date marked by the auspicious Pavitra Dwadashi. He was introduced to spiritual practices at a young age by his mother and developed a strong passion for spiritual literature, especially the Bhagavad-gita, and the well-being of humanity. After moving to East Africa and eventually settling in the United States in 1971, he deepened his spiritual journey. Encountering devotees of His Divine Grace A.C. Bhaktivedanta Srila Prabhupada shortly after his arrival in US sparked his dedication to sharing Krishna Consciousness teachings while pursuing a career as a research biochemist.\nContributions to ISKCON and Community Service\nHis Holiness Vedavyasapriya Swami Maharaja is a dedicated advocate for community service within ISKCON. Starting in the United States, he worked to foster unity among diverse cultural backgrounds by establishing worship of the Sri Nathji deity, strengthening connections between Indian devotees, especially the Gujarati community, and ISKCON. In addition to his administrative roles, such as serving as the president of the Queens temple and later the Director of Bharatiya Community Services in New Vrindaban, he raised awareness about Vedic teachings and promoted spiritual growth. Transitioning his focus to India, as had been directed by Srila Prabhupada, he continues to inspire and guide devotees through preaching and personal example.\nEstablishment of Sri Nathji Deity in New Vrindaban, US\nThe journey to establish the worship of the Sri Nathji Gopal deity in the Western world can be traced back to Vedavyasapriya Swami\'s vision in 1978. This vision was fuelled by the aspirations of the Gujarati community and the support of ISKCON life members. Recognising the deep historical and devotional significance of Sri Nathji, who had been unveiled by Sri Madhavendra Puri after being hidden for protection, the Swami sought to bring this beloved deity to New York. The Governing Body Commission (GBC) approved his plans, leading to the commissioning of a deity made by devotee Mahesvara Das.\nThe deity was initially installed at the 55th Street temple, but the worship faced challenges, including the sale of the temple and the subsequent shift toward establishing multiple worship centres. However, the determination of Vedavyasapriya Swami and his community ultimately triumphed. This culminated in the successful installation of Sri Nathji in New Vrindaban in 1983, fostering a vibrant spiritual legacy that continues to inspire devotees across the globe.\nAssisting in the Construction and Finishing of Sri Sri Radha Damodara in Sigatoka, Fiji\nWhen two of His Holiness Tamal Krishna Goswami Maharaja\'s disciples expressed a desire to build a magnificent temple in Sigatoka, Fiji, as an offering to their spiritual master, His Holiness Tamal Krishna Goswami, His Holiness Vedavyasapriya Swami took on the role of project coordinator. He assisted with all stages of the temple\'s design and construction, personally spending months in Sigatoka to oversee the process.\nVedavyasapriya Swami designed the temple\'s appearance to evoke the mood of Kusum Sarovar in Govardhan. He also arranged for skilled artists in India to create wonderful dioramas inspired by Srimad Bhagavatam, especially depicting the pastimes of Sri Sri Radha Damodara and Lord Ramachandra. These displays are will continue to attract the local community, devotees worldwide, and even tourists visiting the seaside resort town.\nAspiration to Fulfil Srila Prabhupada’s desires for a temple in Bangkok\nHis Holiness Vedavyasapriya Swami has now turned his attention to fulfilling Srila Prabhupada\'s desire to establish a Vedic center and preaching facility in Bangkok, Thailand. Vedavyasapriya Swami was inspired and encouraged by his god-brother, Yogeshwar Das, who Srila Prabhupada had personally encouraged to set up a centre in Bangkok in 1974 (unfortunately Yogeshwar was unable to make much progress on Srila Prabhupada\'s vision at that time).\nHis Holiness Vedavyasapriya Swami has designed a wonderful Vedic complex with exterior in the mood of Hawah Mahal in Jaipur, India, including a guesthouse, Vedic cultural and education centre, and a place of worship for deities of Sri Sri Radha Siamsunder (aligning with the original name of this area of Siam Desh), along with Sri Nathji and Gaura Nitai.\nConclusion\nVedavyasapriya Swami Maharaja\'s unwavering commitment to spiritual advancement and community service has left an indelible mark on countless lives. Shifting from biochemist to a revered ISKCON figure, his experiences reflect a profound understanding of the interconnectedness of faith and duty. He facilitated the establishment of Sri Nathji worship in the West and helped disseminate Srila Prabhupada\'s teachings globally, fostering devotion across diverse communities. As an Initiating Spiritual Master, Vedavyasapriya Swami prioritises guidance and spiritual growth over administrative duties. Continuing to nurture disciples and share the teachings of Sri Guru and Sri Krishna, he remains a pillar of strength and inspiration within the devotional community. His life stands as both a testament and an invitation to explore the depths of spiritual fulfilment through dedicated practice and compassionate service.',
      'gu':
          'પરિચય અને પ્રારંભિક જીવન\n પૂજ્ય વેદવ્યાસપ્રિય સ્વામી મહારાજનો જન્મ ૧ ઓગસ્ટ, ૧૯૪૪ ના રોજ ગુજરાતના કડોદમાં એક પરંપરાગત ઔડિચ્ય સહસ્ત્ર બ્રાહ્મણ પરિવારમાં થયો હતો, જે પવિત્ર દ્વાદશીની તારીખ હતી. તેમની માતાએ તેમને નાની ઉંમરે આધ્યાત્મિક પ્રથાઓનો પરિચય કરાવ્યો હતો અને આધ્યાત્મિક સાહિત્ય, ખાસ કરીને ભગવદ-ગીતા અને માનવતાના કલ્યાણ માટે તેમનો ઉત્સાહ વધ્યો હતો. ૧૯૭૧ માં પૂર્વ આફ્રિકા ગયા પછી અને આખરે યુનાઇટેડ સ્ટેટ્સમાં સ્થાયી થયા પછી, તેમણે તેમની આધ્યાત્મિક યાત્રાને વધુ ગાઢ બનાવી. અમેરિકામાં આગમન પછી તરત જ તેમના દૈવી કૃપા એ.સી. ભક્તિવેદાંત શ્રીલ પ્રભુપાદના ભક્તોને મળ્યા અને તેમણે સંશોધન બાયોકેમિસ્ટ તરીકે કારકિર્દી બનાવતા કૃષ્ણ ભાવનામૃત ઉપદેશો શેર કરવા માટે તેમના સમર્પણને વેગ આપ્યો.\n ઇસ્કોન અને સમુદાય સેવામાં યોગદાન\n પૂજ્ય વેદવ્યાસપ્રિય સ્વામી મહારાજ ઇસ્કોનમાં સમુદાય સેવા માટે સમર્પિત હિમાયતી છે. યુનાઇટેડ સ્ટેટ્સમાં શરૂઆત કરીને, તેમણે શ્રી નાથજી દેવતાની પૂજા સ્થાપિત કરીને, ભારતીય ભક્તો, ખાસ કરીને ગુજરાતી સમુદાય અને ઇસ્કોન વચ્ચે જોડાણો મજબૂત કરીને વિવિધ સાંસ્કૃતિક પૃષ્ઠભૂમિઓમાં એકતા લાવવાનું કામ કર્યું. ક્વીન્સ મંદિરના પ્રમુખ અને બાદમાં ન્યૂ વૃંદાવનમાં ભારતીય સમુદાય સેવાઓના ડિરેક્ટર તરીકે સેવા આપવા જેવી તેમની વહીવટી ભૂમિકાઓ ઉપરાંત, તેમણે વૈદિક ઉપદેશો વિશે જાગૃતિ ફેલાવી અને આધ્યાત્મિક વિકાસને પ્રોત્સાહન આપ્યું. શ્રીલ પ્રભુપાદ દ્વારા નિર્દેશિત ભારત તરફ ધ્યાન કેન્દ્રિત કરીને, તેઓ ઉપદેશ અને વ્યક્તિગત ઉદાહરણ દ્વારા ભક્તોને પ્રેરણા અને માર્ગદર્શન આપવાનું ચાલુ રાખે છે.\nયુએસના ન્યૂ વૃંદાવનમાં શ્રી નાથજી દેવતાની સ્થાપના\nપશ્ચિમી વિશ્વમાં શ્રી નાથજી ગોપાલ દેવતાની પૂજા સ્થાપિત કરવાની સફર 1978 માં વેદવ્યાસપ્રિય સ્વામીના દ્રષ્ટિકોણથી શરૂ થાય છે. આ દ્રષ્ટિ ગુજરાતી સમુદાયની આકાંક્ષાઓ અને ઇસ્કોનના આજીવન સભ્યોના સમર્થનથી પ્રેરિત થઈ હતી. શ્રી નાથજીના ઊંડા ઐતિહાસિક અને ભક્તિમય મહત્વને ઓળખીને, જેમને શ્રી માધવેન્દ્ર પુરી દ્વારા રક્ષણ માટે છુપાવવામાં આવ્યા બાદ અનાવરણ કરવામાં આવ્યું હતું, સ્વામીએ આ પ્રિય દેવતાને ન્યૂ યોર્ક લાવવાનો પ્રયાસ કર્યો. ગવર્નિંગ બોડી કમિશન (GBC) એ તેમની યોજનાઓને મંજૂરી આપી, જેના કારણે ભક્ત મહેશ્વર દાસ દ્વારા બનાવેલા દેવતાનું કાર્ય શરૂ થયું.\n શરૂઆતમાં આ દેવતા 55મી સ્ટ્રીટ મંદિરમાં સ્થાપિત કરવામાં આવ્યા હતા, પરંતુ પૂજામાં પડકારોનો સામનો કરવો પડ્યો, જેમાં મંદિરનું વેચાણ અને ત્યારબાદ અનેક પૂજા કેન્દ્રો સ્થાપવા તરફનો ફેરફાર શામેલ હતો. જોકે, વેદવ્યાસપ્રિય સ્વામી અને તેમના સમુદાયનો નિર્ણય આખરે સફળ થયો. આનો અંત ૧૯૮૩ માં નવા વૃંદાવનમાં શ્રી નાથજીની સફળ સ્થાપનામાં થયો, જેનાથી એક જીવંત આધ્યાત્મિક વારસો બન્યો જે વિશ્વભરના ભક્તોને પ્રેરણા આપે છે.\nફિજીના સિગાટોકામાં શ્રી શ્રી રાધા દામોદરના નિર્માણ અને સમાપ્તિમાં સહાય\nજ્યારે પરમ પૂજ્ય તમાલ કૃષ્ણ ગોસ્વામી મહારાજના બે શિષ્યોએ તેમના આધ્યાત્મિક ગુરુ, પરમ પૂજ્ય તમાલ કૃષ્ણ ગોસ્વામીને અર્પણ તરીકે ફીજીના સિગાટોકામાં એક ભવ્ય મંદિર બનાવવાની ઇચ્છા વ્યક્ત કરી, ત્યારે પરમ પૂજ્ય વેદવ્યાસપ્રિય સ્વામીએ પ્રોજેક્ટ સંયોજકની ભૂમિકા નિભાવી. તેમણે મંદિરની ડિઝાઇન અને બાંધકામના તમામ તબક્કામાં મદદ કરી, પ્રક્રિયાની દેખરેખ માટે વ્યક્તિગત રીતે મહિનાઓ સિગાટોકામાં વિતાવ્યા.\nવેદવ્યાસપ્રિય સ્વામીએ ગોવર્ધનમાં કુસુમ સરોવરના મૂડને ઉત્તેજીત કરવા માટે મંદિરના દેખાવની રચના કરી. તેમણે શ્રીમદ્ ભાગવતમથી પ્રેરિત અદ્ભુત ડાયરોમા બનાવવા માટે ભારતમાં કુશળ કલાકારોની પણ વ્યવસ્થા કરી, ખાસ કરીને શ્રી શ્રી રાધા દામોદર અને ભગવાન રામચંદ્રના લીલાઓનું ચિત્રણ. આ પ્રદર્શનો સ્થાનિક સમુદાય, વિશ્વભરના ભક્તો અને દરિયા કિનારે આવેલા રિસોર્ટ શહેરની મુલાકાત લેતા પ્રવાસીઓને પણ આકર્ષિત કરશે.\nબેંગકોકમાં મંદિર માટે શ્રીલ પ્રભુપાદની ઇચ્છા પૂર્ણ કરવાની આકાંક્ષા\nપરમ પૂજ્ય વેદવ્યાસપ્રિય સ્વામીએ હવે થાઇલેન્ડના બેંગકોકમાં વૈદિક કેન્દ્ર અને ઉપદેશ સુવિધા સ્થાપિત કરવાની શ્રીલ પ્રભુપાદની ઇચ્છા પૂર્ણ કરવા તરફ ધ્યાન કેન્દ્રિત કર્યું છે. વેદવ્યાસપ્રિય સ્વામીને તેમના ધર્મ-ભાઈ, યોગેશ્વર દાસ દ્વારા પ્રેરણા અને પ્રોત્સાહન મળ્યું હતું, જેમને શ્રીલ પ્રભુપાદે વ્યક્તિગત રીતે ૧૯૭૪ માં બેંગકોકમાં એક કેન્દ્ર સ્થાપવા માટે પ્રોત્સાહિત કર્યા હતા (કમનસીબે, યોગેશ્વર તે સમયે શ્રીલ પ્રભુપાદના દ્રષ્ટિકોણ પર વધુ પ્રગતિ કરી શક્યા ન હતા).\n તેમના પવિત્ર વેદવ્યાસપ્રિય સ્વામીએ ભારતના જયપુરમાં હવા મહેલના મૂડ સાથે એક અદ્ભુત વૈદિક સંકુલ ડિઝાઇન કર્યું છે, જેમાં એક ગેસ્ટહાઉસ, વૈદિક સાંસ્કૃતિક અને શિક્ષણ કેન્દ્ર અને શ્રી શ્રી રાધા સિયામસુંદર (સિયામ દેશના આ વિસ્તારના મૂળ નામ સાથે સંરેખિત) ના દેવતાઓ માટે પૂજા સ્થળનો સમાવેશ થાય છે, જેમાં શ્રી નાથજી અને ગૌર નિતાઈનો સમાવેશ થાય છે.\nનિષ્કર્ષ\n વેદવ્યાસપ્રિય સ્વામી મહારાજની આધ્યાત્મિક પ્રગતિ અને સમુદાય સેવા પ્રત્યેની અવિશ્વસનીય પ્રતિબદ્ધતાએ અસંખ્ય જીવન પર અમીટ છાપ છોડી છે. બાયોકેમિસ્ટથી એક આદરણીય ઇસ્કોન વ્યક્તિત્વ તરફ સ્થળાંતર કરીને, તેમના અનુભવો શ્રદ્ધા અને ફરજના પરસ્પર જોડાણની ગહન સમજણને પ્રતિબિંબિત કરે છે. તેમણે પશ્ચિમમાં શ્રીનાથજી ઉપાસનાની સ્થાપનામાં મદદ કરી અને શ્રીલ પ્રભુપાદના ઉપદેશોને વૈશ્વિક સ્તરે પ્રસારિત કરવામાં મદદ કરી, વિવિધ સમુદાયોમાં ભક્તિને પ્રોત્સાહન આપ્યું. એક દીક્ષા આપનાર આધ્યાત્મિક ગુરુ તરીકે, વેદવ્યાસપ્રિય સ્વામી વહીવટી ફરજો કરતાં માર્ગદર્શન અને આધ્યાત્મિક વિકાસને પ્રાથમિકતા આપે છે. શિષ્યોનું પાલનપોષણ કરવાનું અને શ્રી ગુરુ અને શ્રી કૃષ્ણના ઉપદેશોને શેર કરવાનું ચાલુ રાખીને, તેઓ ભક્તિ સમુદાયમાં શક્તિ અને પ્રેરણાના સ્તંભ તરીકે રહે છે. તેમનું જીવન સમર્પિત અભ્યાસ અને કરુણાપૂર્ણ સેવા દ્વારા આધ્યાત્મિક પરિપૂર્ણતાના ઊંડાણોને શોધવા માટે એક વસિયતનામું અને આમંત્રણ બંને તરીકે ઊભું છે.',
      'hi':
          'परिचय और प्रारंभिक जीवन\nपरम पूज्य वेदव्यासप्रिया स्वामी महाराज का जन्म 1 अगस्त, 1944 को भारत के गुजरात के कडोद में एक पारंपरिक औदीच्य सहस्र ब्राह्मण परिवार में हुआ था, यह तिथि पवित्र द्वादशी के शुभ अवसर पर मनाई जाती है। उन्हें उनकी माँ ने छोटी उम्र में ही आध्यात्मिक अभ्यासों से परिचित कराया और आध्यात्मिक साहित्य, विशेष रूप से भगवद-गीता और मानवता की भलाई के लिए उनमें गहरी लगन विकसित हुई। पूर्वी अफ्रीका जाने और अंततः 1971 में संयुक्त राज्य अमेरिका में बसने के बाद, उन्होंने अपनी आध्यात्मिक यात्रा को और गहरा किया। अमेरिका पहुंचने के तुरंत बाद परम पूज्य ए.सी. भक्तिवेदांत श्रील प्रभुपाद के भक्तों से मुलाकात ने एक शोध जैव रसायनज्ञ के रूप में अपना करियर बनाते हुए कृष्ण चेतना की शिक्षाओं को साझा करने के लिए उनके समर्पण को जगाया।\nइस्कॉन और सामुदायिक सेवा में योगदान\nपरम पूज्य वेदव्यासप्रिया स्वामी महाराज इस्कॉन के भीतर सामुदायिक सेवा के एक समर्पित समर्थक हैं। संयुक्त राज्य अमेरिका से शुरुआत करते हुए, उन्होंने श्री नाथजी देवता की पूजा की स्थापना करके, भारतीय भक्तों, विशेष रूप से गुजराती समुदाय और इस्कॉन के बीच संबंधों को मजबूत करके विविध सांस्कृतिक पृष्ठभूमि के बीच एकता को बढ़ावा देने के लिए काम किया। अपनी प्रशासनिक भूमिकाओं के अलावा, जैसे कि क्वींस मंदिर के अध्यक्ष और बाद में न्यू वृंदावन में भारतीय सामुदायिक सेवाओं के निदेशक के रूप में सेवा करते हुए, उन्होंने वैदिक शिक्षाओं के बारे में जागरूकता बढ़ाई और आध्यात्मिक विकास को बढ़ावा दिया। अपना ध्यान भारत पर केंद्रित करते हुए, जैसा कि श्रील प्रभुपाद ने निर्देशित किया था, वे उपदेश और व्यक्तिगत उदाहरण के माध्यम से भक्तों को प्रेरित और मार्गदर्शन करना जारी रखते हैं।\nन्यू वृंदावन, यूएस में श्री नाथजी देवता की स्थापना\nपश्चिमी दुनिया में श्री नाथजी गोपाल देवता की पूजा स्थापित करने की यात्रा का पता 1978 में वेदव्यासप्रिय स्वामी के दृष्टिकोण से लगाया जा सकता है श्री नाथजी के गहरे ऐतिहासिक और भक्ति महत्व को पहचानते हुए, जिन्हें श्री माधवेंद्र पुरी ने सुरक्षा के लिए छिपाए जाने के बाद प्रकट किया था, स्वामी ने इस प्रिय देवता को न्यूयॉर्क लाने की कोशिश की। गवर्निंग बॉडी कमीशन (GBC) ने उनकी योजनाओं को मंजूरी दे दी, जिसके परिणामस्वरूप भक्त महेश्वर दास द्वारा बनाए गए देवता की स्थापना की गई।\n देवता को शुरू में 55वें स्ट्रीट मंदिर में स्थापित किया गया था, लेकिन पूजा में चुनौतियों का सामना करना पड़ा, जिसमें मंदिर की बिक्री और उसके बाद कई पूजा केंद्र स्थापित करने की ओर बदलाव शामिल था। हालाँकि, वेदव्यासप्रिया स्वामी और उनके समुदाय के दृढ़ संकल्प ने अंततः जीत हासिल की। इसकी परिणति 1983 में न्यू वृंदावन में श्री नाथजी की सफल स्थापना के रूप में हुई, जिससे एक जीवंत आध्यात्मिक विरासत का विकास हुआ, जो दुनिया भर में भक्तों को प्रेरित करती रही है।\nफिजी के सिगाटोका में श्री श्री राधा दामोदर के निर्माण और समापन में सहायता करना\nजब परम पावन तमाल कृष्ण गोस्वामी महाराज के दो शिष्यों ने अपने आध्यात्मिक गुरु परम पावन तमाल कृष्ण गोस्वामी को भेंट स्वरूप फिजी के सिगाटोका में एक भव्य मंदिर बनाने की इच्छा व्यक्त की, तो परम पावन वेदव्यासप्रिय स्वामी ने परियोजना समन्वयक की भूमिका निभाई। उन्होंने मंदिर के डिजाइन और निर्माण के सभी चरणों में सहायता की, इस प्रक्रिया की देखरेख के लिए व्यक्तिगत रूप से कई महीने सिगाटोका में बिताए।\nवेदव्यासप्रिया स्वामी ने मंदिर के स्वरूप को गोवर्धन के कुसुम सरोवर के भाव को जगाने के लिए डिजाइन किया। उन्होंने श्रीमद्भागवतम् से प्रेरित अद्भुत चित्रावली बनाने के लिए भारत में कुशल कलाकारों की भी व्यवस्था की, जिसमें विशेष रूप से श्री श्री राधा दामोदर और भगवान रामचंद्र की लीलाओं को दर्शाया गया है। ये प्रदर्शन स्थानीय समुदाय, दुनिया भर के भक्तों और यहां तक ​​कि समुद्र तटीय रिसॉर्ट शहर में आने वाले पर्यटकों को भी आकर्षित करते रहेंगे।\nबैंकॉक में मंदिर के लिए श्रील प्रभुपाद की इच्छा को पूरा करने की आकांक्षा\nपरम पूज्य वेदव्यासप्रिया स्वामी ने अब अपना ध्यान बैंकॉक, थाईलैंड में एक वैदिक केंद्र और उपदेश सुविधा स्थापित करने की श्रील प्रभुपाद की इच्छा को पूरा करने पर केंद्रित कर दिया है। वेदव्यासप्रिय स्वामी अपने धर्म-भाई योगेश्वर दास से प्रेरित और प्रोत्साहित थे, जिन्हें श्रील प्रभुपाद ने व्यक्तिगत रूप से 1974 में बैंकाक में एक केंद्र स्थापित करने के लिए प्रोत्साहित किया था (दुर्भाग्य से योगेश्वर उस समय श्रील प्रभुपाद की दृष्टि पर अधिक प्रगति नहीं कर सके)।\nपरम पूज्य वेदव्यासप्रिय स्वामी ने भारत के जयपुर में हवा महल के माहौल में बाहरी रूप से एक अद्भुत वैदिक परिसर डिजाइन किया है, जिसमें एक गेस्टहाउस, वैदिक सांस्कृतिक और शिक्षा केंद्र, और श्री श्री राधा स्यामसुंदर (स्याम देश के इस क्षेत्र के मूल नाम के साथ संरेखित), श्री नाथजी और गौरा निताई के देवताओं के लिए पूजा स्थल शामिल है।\nनिष्कर्ष\nवेदव्यासप्रिय स्वामी महाराज की आध्यात्मिक उन्नति और सामुदायिक सेवा के प्रति अटूट प्रतिबद्धता ने अनगिनत जीवन पर एक अमिट छाप छोड़ी है। बायोकेमिस्ट से एक प्रतिष्ठित इस्कॉन व्यक्ति बनने तक, उनके अनुभवों में आस्था और कर्तव्य के परस्पर संबंध की गहन समझ झलकती है। उन्होंने पश्चिम में श्री नाथजी पूजा की स्थापना में मदद की और श्रील प्रभुपाद की शिक्षाओं को वैश्विक स्तर पर प्रसारित करने में मदद की, जिससे विभिन्न समुदायों में भक्ति को बढ़ावा मिला। एक आरंभिक आध्यात्मिक गुरु के रूप में, वेदव्यासप्रिया स्वामी प्रशासनिक कर्तव्यों पर मार्गदर्शन और आध्यात्मिक विकास को प्राथमिकता देते हैं। शिष्यों का पोषण करना और श्री गुरु और श्री कृष्ण की शिक्षाओं को साझा करना जारी रखते हुए, वे भक्ति समुदाय के भीतर शक्ति और प्रेरणा का एक स्तंभ बने हुए हैं। उनका जीवन समर्पित अभ्यास और करुणामय सेवा के माध्यम से आध्यात्मिक पूर्णता की गहराई का पता लगाने के लिए एक वसीयतनामा और निमंत्रण दोनों के रूप में खड़ा है।',
      'th':
          'บทนำและชีวิตช่วงต้น\nสมเด็จพระสังฆราชเวทาวยาสปริยะสวามีมหาราชาประสูติในครอบครัวพราหมณ์สายอาธีจยะสหัสระแบบดั้งเดิมในเมืองกาโดด รัฐคุชราต ประเทศอินเดีย เมื่อวันที่ 1 สิงหาคม พ.ศ. 2487 ซึ่งเป็นวันที่พระแม่ปาวิตราทวาทสีทรงเป็นสิริมงคล พระองค์ได้รับการแนะนำให้รู้จักแนวทางปฏิบัติทางจิตวิญญาณตั้งแต่ยังทรงพระเยาว์และทรงมีความหลงใหลในวรรณกรรมทางจิตวิญญาณ โดยเฉพาะภควัทคีตาและความเป็นอยู่ที่ดีของมนุษยชาติ หลังจากย้ายไปแอฟริกาตะวันออกและในที่สุดก็ตั้งรกรากในสหรัฐอเมริกาในปีพ.ศ. 2514 พระองค์ได้เดินทางทางจิตวิญญาณอย่างลึกซึ้งยิ่งขึ้น การได้พบกับผู้ศรัทธาในพระคุณอันศักดิ์สิทธิ์ของพระองค์ A.C. Bhaktivedanta Srila Prabhupada ไม่นานหลังจากที่พระองค์มาถึงสหรัฐอเมริกา ทำให้เกิดความมุ่งมั่นในการเผยแพร่คำสอนเรื่องจิตวิญญาณแห่งพระกฤษณะในขณะที่ประกอบอาชีพเป็นนักชีวเคมีวิจัย\nการมีส่วนสนับสนุนต่อ ISKCON และการบริการชุมชน\nพระองค์ Vedavyasapriya Swami Maharaja ทรงเป็นผู้สนับสนุนที่ทุ่มเทให้กับการบริการชุมชนภายใน ISKCON พระองค์เริ่มต้นที่สหรัฐอเมริกาและทรงทำงานเพื่อส่งเสริมความสามัคคีในหมู่พื้นเพทางวัฒนธรรมที่หลากหลายโดยก่อตั้งการบูชาเทพเจ้า Sri Nathji เสริมสร้างความสัมพันธ์ระหว่างผู้ศรัทธาชาวอินเดีย โดยเฉพาะชุมชนชาวคุชราต และ ISKCON นอกเหนือจากบทบาทในการบริหารของพระองค์ เช่น ดำรงตำแหน่งประธานวัดควีนส์และต่อมาเป็นผู้อำนวยการ Bharatiya Community Services ใน New Vrindaban แล้ว พระองค์ยังทรงสร้างความตระหนักรู้เกี่ยวกับคำสอนของพระเวทและส่งเสริมการเติบโตทางจิตวิญญาณอีกด้วย เขาเปลี่ยนความสนใจไปที่อินเดียตามคำแนะนำของศรีลาพระภูปาท เขายังคงสร้างแรงบันดาลใจและชี้แนะผู้ศรัทธาผ่านการเทศนาและตัวอย่างส่วนตัว\nการสถาปนาเทพศรีนาถจีในนิววรินดาบัน สหรัฐอเมริกา\nการเดินทางเพื่อสถาปนาการบูชาเทพศรีนาถจีโกปาลในโลกตะวันตกสามารถสืบย้อนไปถึงวิสัยทัศน์ของ Vedavyasapriya Swami ในปี 1978 วิสัยทัศน์นี้ได้รับแรงผลักดันจากความปรารถนาของชุมชนชาวคุชราตและการสนับสนุนจากสมาชิกตลอดชีพของ ISKCON เมื่อตระหนักถึงความสำคัญทางประวัติศาสตร์และความศรัทธาอันลึกซึ้งของศรีนาถจี ซึ่งถูกเปิดเผยโดยศรีมาธเวนทระ ปูรี หลังจากถูกซ่อนไว้เพื่อปกป้อง สวามีจึงพยายามนำเทพอันเป็นที่รักนี้มาที่นิวยอร์ก คณะกรรมการบริหาร (GBC) อนุมัติแผนของเขา ส่งผลให้มีการแต่งตั้งเทพเจ้าองค์หนึ่งซึ่งสร้างโดยผู้ศรัทธาอย่างมเหศวร ดาส\nในตอนแรก เทพเจ้าองค์นี้ถูกติดตั้งที่วัดถนนสายที่ 55 แต่การบูชาต้องเผชิญกับความท้าทายต่างๆ รวมถึงการขายวัดและการเปลี่ยนมาสร้างศูนย์บูชาหลายแห่งในเวลาต่อมา อย่างไรก็ตาม ความมุ่งมั่นของ Vedavyasapriya Swami และชุมชนของเขาในที่สุดก็ได้รับชัยชนะ ความสำเร็จนี้ส่งผลให้การสถาปนา Sri Nathji ใน New Vrindaban สำเร็จลุล่วงในปี 1983 ซึ่งช่วยส่งเสริมมรดกทางจิตวิญญาณอันมีชีวิตชีวาที่ยังคงสร้างแรงบันดาลใจให้กับผู้ศรัทธาทั่วโลก\nการช่วยเหลือในการก่อสร้างและการตกแต่ง Sri Sri Radha Damodara ใน Sigatoka ประเทศฟิจิ\nเมื่อสาวกของพระองค์ Tamal Krishna Goswami Maharaja สององค์แสดงความปรารถนาที่จะสร้างวิหารอันงดงามใน Sigatoka ประเทศฟิจิ เพื่อถวายแด่อาจารย์ทางจิตวิญญาณของพวกเขา ซึ่งก็คือ Tamal Krishna Goswami พระองค์ Vedavyasapriya Swami จึงรับหน้าที่เป็นผู้ประสานงานโครงการ พระองค์ช่วยเหลือในทุกขั้นตอนของการออกแบบและการก่อสร้างวิหาร โดยใช้เวลาหลายเดือนใน Sigatoka ด้วยตนเองเพื่อดูแลกระบวนการ\nVedavyasapriya Swami ออกแบบรูปลักษณ์ของวิหารเพื่อให้เกิดอารมณ์ของ Kusum Sarovar ใน Govardhan พระองค์ยังทรงจัดเตรียมศิลปินที่มีทักษะในอินเดียเพื่อสร้างไดโอรามาอันสวยงามที่ได้รับแรงบันดาลใจจากศรีมัทภควตัม โดยเฉพาะอย่างยิ่งการแสดงภาพการเล่นสนุกของศรีศรีราธาดาโมดาราและพระรามจันทรา การจัดแสดงเหล่านี้จะดึงดูดชุมชนในท้องถิ่น ผู้ศรัทธาจากทั่วโลก และแม้แต่นักท่องเที่ยวที่มาเยือนเมืองตากอากาศริมทะเล\nความปรารถนาที่จะสนองความปรารถนาของศรีลาพระภูปาทในการสร้างวัดในกรุงเทพฯ\nขณะนี้พระองค์เวดาวยาสปริยะสวามีทรงหันความสนใจไปที่การสนองความปรารถนาของศรีลาพระภูปาทในการก่อตั้งศูนย์พระเวทและสถานที่เผยแผ่ศาสนาในกรุงเทพฯ ประเทศไทย Vedavyasapriya Swami ได้รับแรงบันดาลใจและกำลังใจจากพี่ชายของเขา Yogeshwar Das ซึ่ง Srila Prabhupada ได้สนับสนุนด้วยตนเองให้ตั้งศูนย์ในกรุงเทพฯ เมื่อปี 1974 (แต่น่าเสียดายที่ Yogeshwar ไม่สามารถทำให้วิสัยทัศน์ของ Srila Prabhupada ก้าวหน้าไปมากนักในขณะนั้น)\nพระองค์ผู้ศักดิ์สิทธิ์ Vedavyasapriya Swami ได้ออกแบบอาคารพระเวทอันงดงามโดยมีภายนอกคล้ายกับ Hawah Mahal ในเมืองชัยปุระ ประเทศอินเดีย ซึ่งรวมถึงเกสต์เฮาส์ ศูนย์วัฒนธรรมและการศึกษาด้านพระเวท และสถานที่สักการะบูชาเทพเจ้าของ Sri Sri Radha Siamsunder (ซึ่งตรงกับชื่อเดิมของพื้นที่นี้ใน Siam Desh) ร่วมกับ Sri Nathji และ Gaura Nitai\nบทสรุป\nความมุ่งมั่นอย่างไม่ลดละของ Vedavyasapriya Swami Maharaja ในการพัฒนาจิตวิญญาณและการบริการชุมชนได้ทิ้งรอยประทับที่ลบไม่ออกในชีวิตนับไม่ถ้วน จากการเปลี่ยนจากนักชีวเคมีมาเป็นบุคคลสำคัญใน ISKCON ที่ได้รับการเคารพนับถือ ประสบการณ์ของเขาสะท้อนให้เห็นความเข้าใจอย่างลึกซึ้งถึงความเชื่อมโยงกันระหว่างศรัทธาและหน้าที่ เขาช่วยอำนวยความสะดวกในการก่อตั้งการบูชาศรีนาถจีในตะวันตก และช่วยเผยแพร่คำสอนของศรีลาพระภูปาทไปทั่วโลก ส่งเสริมความศรัทธาในชุมชนที่หลากหลาย ในฐานะปรมาจารย์ทางจิตวิญญาณผู้ริเริ่ม เวดาวยาสปริยะสวามีให้ความสำคัญกับการชี้นำและการเติบโตทางจิตวิญญาณมากกว่าหน้าที่บริหาร เขายังคงดูแลลูกศิษย์และแบ่งปันคำสอนของศรีคุรุและศรีกฤษณะ และยังคงเป็นเสาหลักของความแข็งแกร่งและแรงบันดาลใจในชุมชนผู้ศรัทธา ชีวิตของเขายืนหยัดเป็นทั้งพยานหลักฐานและคำเชิญชวนให้สำรวจความลึกซึ้งของความสมบูรณ์ทางจิตวิญญาณผ่านการฝึกฝนอย่างทุ่มเทและการให้บริการด้วยความเมตตา',
    },
    'y2f7xcxu': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // ComingSoon
  {
    '1k4qk3ud': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // AudioTesterDonotDelete
  {
    'gkeb6wgg': {
      'en': 'UP Next',
      'gu': 'આગળ ઉપર',
      'hi': 'अगला',
      'th': 'ถัดไป',
    },
    'z5ihmto0': {
      'en': 'Shloka',
      'gu': 'શ્લોકા',
      'hi': 'श्लोक',
      'th': 'โศลกา',
    },
    'm5fidvvw': {
      'en': 'Transcript',
      'gu': 'ટ્રાન્સક્રિપ્ટ',
      'hi': 'प्रतिलिपि',
      'th': 'บทถอดความ',
    },
    'yglweda3': {
      'en': 'Page Title',
      'gu': 'પૃષ્ઠ શીર્ષક',
      'hi': 'पृष्ठ शीर्षक',
      'th': 'หัวข้อหน้า',
    },
    'w2k3vekb': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // VideoList
  {
    '4nosdnqu': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'zxtbk63x': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // VideoPost
  {
    'vy7bk28k': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
  },
  // ProfilePage
  {
    'ybvzufb9': {
      'en': 'Profile',
      'gu': 'પ્રોફાઇલ',
      'hi': 'प्रोफ़ाइल',
      'th': 'ประวัติโดยย่อ',
    },
    'ib42eqv2': {
      'en': 'Full Name',
      'gu': 'પૂરું નામ',
      'hi': 'पूरा नाम',
      'th': 'ชื่อ-นามสกุล',
    },
    '2kxcb7o6': {
      'en': 'Enter Name here',
      'gu': 'અહીં નામ દાખલ કરો',
      'hi': 'यहाँ नाम दर्ज करें',
      'th': 'กรอกชื่อที่นี่',
    },
    '1mm1kkp3': {
      'en': 'Mobile Number',
      'gu': 'મોબાઇલ નંબર',
      'hi': 'मोबाइल नंबर',
      'th': 'เบอร์มือถือ',
    },
    'm78nu16d': {
      'en': 'Select',
      'gu': 'પસંદ કરો',
      'hi': 'चुनना',
      'th': 'เลือก',
    },
    'srhbl2l2': {
      'en': 'Search for an item...',
      'gu': 'કોઈ વસ્તુ શોધો...',
      'hi': 'किसी आइटम की खोज करें...',
      'th': 'ค้นหาสินค้า...',
    },
    'm3hzroab': {
      'en': 'India',
      'gu': 'ભારત',
      'hi': 'भारत',
      'th': 'อินเดีย',
    },
    'unhzkjm6': {
      'en': 'Australia',
      'gu': 'ઓસ્ટ્રેલિયા',
      'hi': 'ऑस्ट्रेलिया',
      'th': 'ออสเตรเลีย',
    },
    'wxs93f81': {
      'en': 'New Zealand',
      'gu': 'ન્યૂઝીલેન્ડ',
      'hi': 'न्यूज़ीलैंड',
      'th': 'นิวซีแลนด์',
    },
    'xtf7p7xo': {
      'en': 'USA',
      'gu': 'યુનાઈટેડ સ્ટેટ્સ',
      'hi': 'यूएसए',
      'th': 'สหรัฐอเมริกา',
    },
    '0ix5dp6r': {
      'en': '',
      'gu': 'અહીં ઈમેલ દાખલ કરો',
      'hi': 'यहां ईमेल दर्ज करें',
      'th': '',
    },
    'yun7ipd6': {
      'en': 'Email',
      'gu': 'ઇમેઇલ',
      'hi': 'ईमेल',
      'th': 'อีเมล',
    },
    'xcngh6j1': {
      'en': 'Enter Email here',
      'gu': 'અહીં ઇમેઇલ દાખલ કરો',
      'hi': 'यहां ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่นี่',
    },
    'gklq9aho': {
      'en': 'Date of Birth',
      'gu': 'જન્મ તારીખ',
      'hi': 'जन्म तिथि',
      'th': 'วันเกิด',
    },
    'u0zj2dq9': {
      'en': 'Label here...',
      'gu': 'અહીં લેબલ કરો...',
      'hi': 'यहां लेबल करें...',
      'th': 'ติดป้ายไว้ที่นี่...',
    },
    'wyhscyny': {
      'en': 'Gender',
      'gu': 'લિંગ',
      'hi': 'लिंग',
      'th': 'เพศ',
    },
    'wtwak65g': {
      'en': 'Please select...',
      'gu': 'કૃપા કરીને પસંદ કરો...',
      'hi': 'कृपया चयन कीजिए...',
      'th': 'กรุณาเลือก...',
    },
    'g0enn6f1': {
      'en': 'Search for an item...',
      'gu': 'કોઈ વસ્તુ શોધો...',
      'hi': 'किसी आइटम की खोज करें...',
      'th': 'ค้นหาสินค้า...',
    },
    '2co4tai9': {
      'en': 'Male',
      'gu': 'પુરુષ',
      'hi': 'पुरुष',
      'th': 'ชาย',
    },
    'zvb37hie': {
      'en': 'Female',
      'gu': 'સ્ત્રી',
      'hi': 'महिला',
      'th': 'หญิง',
    },
    'igouacjs': {
      'en': 'Are you a disciple of Guru Maharaj?',
      'gu': 'શું તમે ગુરુ મહારાજના શિષ્ય છો?',
      'hi': 'क्या आप गुरु महाराज के शिष्य हैं?',
      'th': 'คุณเป็นศิษย์ของครูมหาราชใช่ไหม?',
    },
    'b7db6wzv': {
      'en': 'Please select...',
      'gu': 'કૃપા કરીને પસંદ કરો...',
      'hi': 'कृपया चयन कीजिए...',
      'th': 'กรุณาเลือก...',
    },
    'pt3cdkm1': {
      'en': 'Search for an item...',
      'gu': 'કોઈ વસ્તુ શોધો...',
      'hi': 'किसी आइटम की खोज करें...',
      'th': 'ค้นหาสินค้า...',
    },
    'mwfc5twi': {
      'en': 'Yes,I am following Guru Maharaj',
      'gu': 'હા, હું ગુરુ મહારાજને અનુસરું છું.',
      'hi': 'हां, मैं गुरु महाराज का अनुसरण कर रहा हूं',
      'th': 'ใช่ ฉันกำลังติดตามครูมหาราช',
    },
    '82oojy42': {
      'en': 'No,I am not following Guru Maharaj',
      'gu': 'ના, હું ગુરુ મહારાજને અનુસરતો નથી.',
      'hi': 'नहीं, मैं गुरु महाराज का अनुसरण नहीं कर रहा हूं',
      'th': 'ไม่ ฉันไม่ได้ติดตามครูมหาราช',
    },
    'oq1cm4de': {
      'en': 'Bio',
      'gu': 'બાયો',
      'hi': 'जैव',
      'th': 'ชีวประวัติ',
    },
    'm1b2t1pe': {
      'en': 'Enter Bio here',
      'gu': 'અહીં બાયો દાખલ કરો',
      'hi': 'बायो यहाँ दर्ज करें',
      'th': 'เข้าสู่ข้อมูลประวัติที่นี่',
    },
    'rww9ekcy': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '4e7yj8no': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'vwwlasnu': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '6bv739zb': {
      'en': 'Please enter valid mobile number.',
      'gu': 'કૃપા કરીને માન્ય મોબાઇલ નંબર દાખલ કરો.',
      'hi': 'कृपया वैध मोबाइल नंबर दर्ज करें.',
      'th': 'โปรดกรอกหมายเลขมือถือที่ถูกต้อง',
    },
    'io18p2md': {
      'en': 'Please enter valid mobile number.',
      'gu': 'કૃપા કરીને માન્ય મોબાઇલ નંબર દાખલ કરો.',
      'hi': 'कृपया वैध मोबाइल नंबर दर्ज करें.',
      'th': 'โปรดกรอกหมายเลขมือถือที่ถูกต้อง',
    },
    'j4ux1xbi': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'w5j29t95': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '70reowzx': {
      'en': 'Please enter valid email.',
      'gu': 'કૃપા કરીને માન્ય મોબાઇલ નંબર દાખલ કરો.',
      'hi': 'कृपया वैध मोबाइल नंबर दर्ज करें.',
      'th': 'โปรดกรอกหมายเลขมือถือที่ถูกต้อง',
    },
    'szax6ap8': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '1ve1pog5': {
      'en': 'Date of Birth is required',
      'gu': 'જન્મ તારીખ જરૂરી છે',
      'hi': 'जन्म तिथि आवश्यक है',
      'th': 'จำเป็นต้องระบุวันที่เกิด',
    },
    'bctf8ino': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'mvwsmsc6': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'ae2djcoc': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'd41voy22': {
      'en': 'Update',
      'gu': 'અપડેટ',
      'hi': 'अद्यतन',
      'th': 'อัปเดต',
    },
    'cxsjcqzb': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // VyasPoojaCategoryPage
  {
    'z1je2bqu': {
      'en': 'Vyasa Puja',
      'gu': 'વ્યાસ પૂજા',
      'hi': 'व्यास पूजा',
      'th': 'วยาสบูชา',
    },
    'zri05x2w': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '0xwcl3vu': {
      'en': 'Search ',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
    'hxhqbhej': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // VyasPujaPdfViewer
  {
    'mynfiq3h': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Library
  {
    '5j11c4sx': {
      'en': 'Library',
      'gu': 'પુસ્તકાલય',
      'hi': 'पुस्तकालय',
      'th': 'ห้องสมุด',
    },
    'egaqczbj': {
      'en': 'Favorite',
      'gu': 'મનપસંદ',
      'hi': 'पसंदीदा',
      'th': 'ที่ชื่นชอบ',
    },
    'a11mb9sd': {
      'en': 'Playlist',
      'gu': 'પ્લેલિસ્ટ',
      'hi': 'प्लेलिस्ट',
      'th': 'เพลย์ลิสต์',
    },
    'avc1h9ad': {
      'en': 'Notes',
      'gu': 'નોંધો',
      'hi': 'नोट्स',
      'th': 'หมายเหตุ',
    },
    '3lj8x3xs': {
      'en': 'Downloads',
      'gu': 'ડાઉનલોડ',
      'hi': 'डाउनलोड',
      'th': 'ดาวน์โหลด',
    },
    'f483l2l6': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Onboarding
  {
    'wdacoy29': {
      'en': 'A.C.Bhaktivedanta\nSwami Prabhupad',
      'gu': 'A.C. ભક્તિવેદાંત\nસ્વામી પ્રભુપાદ',
      'hi': 'ए.सी.भक्तिवेदांत\nस्वामी प्रभुपाद',
      'th': 'อ.ซี.ภักติเวทันตะ\nสวามี ปราภูปัท',
    },
    'rxpyi01y': {
      'en': 'Next',
      'gu': 'આગળ',
      'hi': 'अगला',
      'th': 'ต่อไป',
    },
    'uksvc2oe': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // BookPostPage
  {
    'ot62dz5l': {
      'en': 'Book',
      'gu': 'પુસ્તક',
      'hi': 'किताब',
      'th': 'หนังสือ',
    },
    '9v704vfm': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // FavoriteList
  {
    'qrqdecbl': {
      'en': 'Favorite',
      'gu': 'મનપસંદ',
      'hi': 'पसंदीदा',
      'th': 'ที่ชื่นชอบ',
    },
    'mk12tkv5': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    'oklvzehp': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'rknf8ax9': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'rprgngwb': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'koxaun3y': {
      'en': 'Video',
      'gu': 'વિડિઓ',
      'hi': 'वीडियो',
      'th': 'วีดีโอ',
    },
    '7vzdv83f': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'nq8ruoge': {
      'en': 'News',
      'gu': 'ગેલેરી',
      'hi': 'गैलरी',
      'th': 'แกลเลอรี่',
    },
    '046ehejs': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PlaylistPage
  {
    '9yzcdnh5': {
      'en': 'Playlist',
      'gu': 'પ્લેલિસ્ટ',
      'hi': 'प्लेलिस्ट',
      'th': 'เพลย์ลิสต์',
    },
    'znp49n5r': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // VerifyCode
  {
    '2942spcm': {
      'en': 'Verify Code',
      'gu': 'કોડ ચકાસો',
      'hi': 'कोड सत्यापित करें',
      'th': 'ยืนยันรหัส',
    },
    'm06s59kl': {
      'en': 'Please enter the 4 digit code sent to',
      'gu': 'કૃપા કરીને મોકલેલ 4 અંકનો કોડ દાખલ કરો',
      'hi': 'कृपया भेजा गया 4 अंकों का कोड दर्ज करें',
      'th': 'กรุณากรอกรหัส 4 หลักที่ส่งไปยัง',
    },
    '8n1v8xn1': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'neu6ljb3': {
      'en': 'Enter a valid email',
      'gu': 'માન્ય ઇમેઇલ દાખલ કરો',
      'hi': 'मान्य ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่ถูกต้อง',
    },
    'rj33nc34': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'i3j4gm77': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'z7nqp588': {
      'en': 'Minimum 8 characters required',
      'gu': 'ઓછામાં ઓછા 8 અક્ષરો જરૂરી છે',
      'hi': 'न्यूनतम 8 अक्षर आवश्यक',
      'th': 'ต้องมีอักขระขั้นต่ำ 8 ตัว',
    },
    '6gbayd2r': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '5v0tgxcd': {
      'en': 'Resend Code ',
      'gu': 'કોડ ફરીથી મોકલો',
      'hi': 'पुन: कोड भेजे',
      'th': 'ส่งรหัสอีกครั้ง',
    },
    'hah1f82f': {
      'en': '(',
      'gu': '(',
      'hi': '(',
      'th': '-',
    },
    'khgivj6h': {
      'en': ')',
      'gu': ')',
      'hi': ')',
      'th': '-',
    },
    '4fczmafm': {
      'en': 'Verify',
      'gu': 'ચકાસો',
      'hi': 'सत्यापित करें',
      'th': 'ตรวจสอบ',
    },
    'qnf737bi': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Playlist
  {
    'b2ll1ccw': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    '1zrptsoc': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'ou3rfk1n': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'tx5m0q3z': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'oq1g9v1q': {
      'en': 'Video',
      'gu': 'વિડિઓ',
      'hi': 'वीडियो',
      'th': 'วีดีโอ',
    },
    '0ofdiyip': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'iazhoaob': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // ForgotPassword
  {
    'kd2n8e7i': {
      'en': 'Forgot Password',
      'gu': 'પાસવર્ડ ભૂલી ગયા છો',
      'hi': 'पासवर्ड भूल गए',
      'th': 'ลืมรหัสผ่าน',
    },
    'cv6ggthj': {
      'en': 'Please enter your email address to\n receive a ',
      'gu': '\n મેળવવા માટે કૃપા કરીને તમારું ઇમેઇલ સરનામું દાખલ કરો',
      'hi': 'कृपया अपना ईमेल पता दर्ज करें \n एक संदेश प्राप्त करने के लिए',
      'th': 'กรุณากรอกอีเมล์ของคุณ\nเพื่อรับ',
    },
    'l1howrdo': {
      'en': 'verification code',
      'gu': 'ચકાસણી કોડ',
      'hi': 'सत्यापन कोड',
      'th': 'รหัสตรวจสอบ',
    },
    'n6i4d4rt': {
      'en': 'Email',
      'gu': 'ઇમેઇલ',
      'hi': 'ईमेल',
      'th': 'อีเมล',
    },
    'd52b7jar': {
      'en': 'Enter Email here',
      'gu': 'અહીં ઇમેઇલ દાખલ કરો',
      'hi': 'यहां ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่นี่',
    },
    'gxl3x9he': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'gx6qt2wz': {
      'en': 'Enter a valid email',
      'gu': 'માન્ય ઇમેઇલ દાખલ કરો',
      'hi': 'मान्य ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่ถูกต้อง',
    },
    'hp2w9i9c': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'zwer8xh9': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '98xyppaw': {
      'en': 'Minimum 8 characters required',
      'gu': 'ઓછામાં ઓછા 8 અક્ષરો જરૂરી છે',
      'hi': 'न्यूनतम 8 अक्षर आवश्यक',
      'th': 'ต้องมีอักขระขั้นต่ำ 8 ตัว',
    },
    '6rue91mq': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '720edjuk': {
      'en': 'Continue',
      'gu': 'ચાલુ રાખો',
      'hi': 'जारी रखना',
      'th': 'ดำเนินการต่อ',
    },
    'cyy6w4qs': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // SetNewPassword
  {
    '3qa3r97a': {
      'en': 'Reset Password',
      'gu': 'પાસવર્ડ રીસેટ કરો',
      'hi': 'पासवर्ड रीसेट',
      'th': 'รีเซ็ตรหัสผ่าน',
    },
    '1qz4971s': {
      'en': 'Your new password must be different from previously used password',
      'gu': 'તમારો નવો પાસવર્ડ પહેલા વપરાયેલા પાસવર્ડથી અલગ હોવો જોઈએ.',
      'hi': 'आपका नया पासवर्ड पहले इस्तेमाल किए गए पासवर्ड से अलग होना चाहिए',
      'th': 'รหัสผ่านใหม่ของคุณจะต้องแตกต่างจากรหัสผ่านที่ใช้ก่อนหน้านี้',
    },
    'ys4mk05a': {
      'en': 'New Password',
      'gu': 'નવો પાસવર્ડ',
      'hi': 'नया पासवर्ड',
      'th': 'รหัสผ่านใหม่',
    },
    'dxjlbbd7': {
      'en': 'Enter password here',
      'gu': 'અહીં પાસવર્ડ દાખલ કરો',
      'hi': 'पासवर्ड यहां दर्ज करें',
      'th': 'กรอกรหัสผ่านที่นี่',
    },
    'l5sci7n3': {
      'en': 'Confirm Password',
      'gu': 'પાસવર્ડ કન્ફર્મ કરો',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'th': 'ยืนยันรหัสผ่าน',
    },
    '9o1tksdc': {
      'en': 'Enter password here',
      'gu': 'અહીં પાસવર્ડ દાખલ કરો',
      'hi': 'पासवर्ड यहां दर्ज करें',
      'th': 'กรอกรหัสผ่านที่นี่',
    },
    'i6qainzf': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    '6n95eowv': {
      'en': 'Enter a valid email',
      'gu': 'માન્ય ઇમેઇલ દાખલ કરો',
      'hi': 'मान्य ईमेल दर्ज करें',
      'th': 'กรอกอีเมล์ที่ถูกต้อง',
    },
    'u783po7q': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    'j45ozt7m': {
      'en': 'Field is required',
      'gu': 'ફીલ્ડ જરૂરી છે',
      'hi': 'ये स्थान भरा जाना है',
      'th': 'จำเป็นต้องกรอกข้อมูล',
    },
    'q734djel': {
      'en': 'Minimum 8 characters required',
      'gu': 'ઓછામાં ઓછા 8 અક્ષરો જરૂરી છે',
      'hi': 'न्यूनतम 8 अक्षर आवश्यक',
      'th': 'ต้องมีอักขระขั้นต่ำ 8 ตัว',
    },
    '3noioh2h': {
      'en': 'Please choose an option from the dropdown',
      'gu': 'કૃપા કરીને ડ્રોપડાઉનમાંથી એક વિકલ્પ પસંદ કરો.',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
      'th': 'กรุณาเลือกตัวเลือกจากเมนูแบบดรอปดาวน์',
    },
    '0pukwtbn': {
      'en': 'Reset Password',
      'gu': 'પાસવર્ડ રીસેટ કરો',
      'hi': 'पासवर्ड रीसेट',
      'th': 'รีเซ็ตรหัสผ่าน',
    },
    'p4a80lia': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PrabhupadaCategoryPage
  {
    '7k9i1on1': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'atc98riw': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '9q6tv90r': {
      'en': 'Search ',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
    'bnzzuon8': {
      'en': 'Playlist',
      'gu': 'પ્લેલિસ્ટ',
      'hi': 'प्लेलिस्ट',
      'th': 'เพลย์ลิสต์',
    },
    'l67v6dab': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Prabhupada
  {
    'j13cy696': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'ehkru8rs': {
      'en': 'His Divine Grace Srila Prabhupada',
      'gu': 'શ્રીલ પ્રભુપાદની દિવ્ય કૃપા',
      'hi': 'परम कृपालु श्रील प्रभुपाद',
      'th': 'พระกรุณาธิคุณของพระองค์ศรีลาพระภูปาทา',
    },
    'aftxfhpw': {
      'en':
          'For millennia the teachings and the rich culture of bhakti-yoga, or Krishna Consciousness, had been hidden within the borders of India. Today, millions around the globe express their gratitude to Srila Prabhupada for revealing the timeless wisdom of bhakti to a world.\n\nBorn as Abhay Charan De on September 1, 1896, in Calcutta, as a young man he joined Mahatma Gandhi’s civil disobedience movement. In 1922, a meeting with the prominent scholar and spiritual leader, Srila Bhaktisiddhanta Sarasvati, proved to be most influential on young Abhay’s future calling.\n\nSrila Bhaktisiddhanta was a leader in the Gaudiya Vaishnava community, a monotheistic tradition within the broader Hindu culture. At their very first meeting, Srila Bhaktisiddhanta asked Abhay to bring the teachings of Lord Krishna to the English-speaking world. Deeply moved by his devotion and wisdom, Abhay became a disciple of Srila Bhaktisiddhanta in 1933, and resolved to carry out his mentor’s request. Abhay, later known by the honorific A.C. Bhaktivedanta Swami Prabhupada, spent the next 32 years preparing for his journey west.\n\nIn 1965, at the age of sixty-nine, Srila Prabhupada begged a free passage and boarded a cargo ship, the Jaladhuta, to New York. The journey proved to be treacherous and he suffered two heart attacks aboard. After 35 days at sea, he first arrived at a lonely Brooklyn pier with just seven dollars in Indian rupees and a crate of his translations of sacred Sanskrit texts.\n\nIn New York, he faced great hardships and began his mission humbly by giving classes on the Bhagavad-gita in lofts on the Bowery and leading kirtan (traditional devotional chants) in Tompkins Square Park. His message of peace and goodwill resonated with many young people, some of whom came forward to become serious students of the Krishna-bhakti tradition. With the help of these students, Bhaktivedanta Swami rented a small storefront on New York’s Lower East Side to use as a temple.\n\nIn July of 1966, Bhaktivedanta Swami established the International Society for Krishna Consciousness (ISKCON) for the purpose he stated of “checking the imbalance of values in the world and working for real unity and peace”.\n\nIn the eleven years that followed, Srila Prabhupada circled the globe 14 times on lecture tours spreading the teachings of Lord Krishna. Men and women from all backgrounds and walks of life came forward to accept his message. With their help, Srila Prabhupada established temples, farm communities, a publishing house, and educational institutions around the world. And, he began what has now become the world’s largest vegetarian food relief program, Hare Krishna Food for Life.\n\nWith the desire to nourish the roots of Krishna consciousness in its home, Srila Prabhupada returned to India several times, where he sparked a revival in the Vaishnava tradition. In India, he opened dozens of temples, including large centers in the holy towns of Vrindavana and Mayapura.\n\nSrila Prabhupada’s most significant contributions, perhaps, are his books. He authored over 70 volumes on the Krishna tradition, which are highly respected by scholars for their authority, depth, fidelity to the tradition, and clarity. Several of his works are used as textbooks in numerous college courses. His writings have been translated into 76 languages. His most prominent works include: Bhagavad-gita As It Is, the 30-volume Srimad-Bhagavatam, and the 17-volume Sri Caitanya-caritamrita.\nA.C. Bhaktivedanta Swami Srila Prabhupada passed away on November 14, 1977, in the holy town of Vrindavana, surrounded by his loving disciples who carry on his mission today.',
      'gu':
          'હજારો વર્ષોથી ભક્તિ-યોગ, અથવા કૃષ્ણ ભાવનામૃતના ઉપદેશો અને સમૃદ્ધ સંસ્કૃતિ ભારતની સરહદોમાં છુપાયેલી હતી. આજે, વિશ્વભરમાં લાખો લોકો શ્રીલ પ્રભુપાદનો આભાર માને છે કે તેમણે ભક્તિના કાલાતીત જ્ઞાનને વિશ્વ સમક્ષ પ્રગટ કર્યું.\n\n ૧ સપ્ટેમ્બર, ૧૮૯૬ના રોજ કલકત્તામાં અભય ચરણ દે તરીકે જન્મેલા, યુવાનીમાં તેઓ મહાત્મા ગાંધીના નાગરિક અસહકાર ચળવળમાં જોડાયા. ૧૯૨૨માં, અગ્રણી વિદ્વાન અને આધ્યાત્મિક નેતા, શ્રીલ ભક્તિસિદ્ધાંત સરસ્વતી સાથેની મુલાકાત, યુવાન અભયના ભાવિ આમંત્રણ પર સૌથી વધુ પ્રભાવશાળી સાબિત થઈ.\n\nશ્રીલ ભક્તિસિદ્ધાંત ગૌડિય વૈષ્ણવ સમુદાયના નેતા હતા, જે વ્યાપક હિન્દુ સંસ્કૃતિમાં એકેશ્વરવાદી પરંપરા હતી. તેમની પહેલી જ મુલાકાતમાં, શ્રીલ ભક્તિસિદ્ધાંતે અભયને ભગવાન કૃષ્ણના ઉપદેશોને અંગ્રેજી બોલતા વિશ્વમાં લાવવા કહ્યું. તેમની ભક્તિ અને શાણપણથી ખૂબ પ્રભાવિત થઈને, અભય ૧૯૩૩ માં શ્રીલ ભક્તિસિદ્ધાંતના શિષ્ય બન્યા, અને તેમના માર્ગદર્શકની વિનંતીને પૂર્ણ કરવાનો સંકલ્પ કર્યો. અભય, જેને પાછળથી માનનીય એ.સી. ભક્તિવેદાંત સ્વામી પ્રભુપાદ તરીકે ઓળખવામાં આવ્યા, તેમણે આગામી ૩૨ વર્ષ પશ્ચિમ તરફની તેમની યાત્રાની તૈયારીમાં વિતાવ્યા.\n\n૧૯૬૫ માં, ઓગણચાસ વર્ષની ઉંમરે, શ્રીલ પ્રભુપાદે મફત માર્ગ માંગ્યો અને ન્યૂ યોર્ક જનારા માલવાહક જહાજ, જલધૂતમાં ચઢી ગયા. આ યાત્રા કપટી સાબિત થઈ અને તેમને બે હૃદયરોગના હુમલાનો સામનો કરવો પડ્યો. ૩૫ દિવસ દરિયામાં રહ્યા પછી, તેઓ સૌપ્રથમ એકાંત બ્રુકલિન પિયર પર ભારતીય રૂપિયામાં માત્ર સાત ડોલર અને પવિત્ર સંસ્કૃત ગ્રંથોના તેમના અનુવાદોનો એક બોક્સ લઈને પહોંચ્યા.\n\nન્યૂ યોર્કમાં, તેમણે ખૂબ મુશ્કેલીઓનો સામનો કર્યો અને બોવરી પરના લોફ્ટમાં ભગવદ-ગીતાના વર્ગો આપીને અને ટોમ્પકિન્સ સ્ક્વેર પાર્કમાં કીર્તન (પરંપરાગત ભક્તિ મંત્રો)નું નેતૃત્વ કરીને નમ્રતાપૂર્વક પોતાનું મિશન શરૂ કર્યું. શાંતિ અને સદ્ભાવનાનો તેમનો સંદેશ ઘણા યુવાનોમાં પડઘો પાડતો હતો, જેમાંથી કેટલાક કૃષ્ણ-ભક્તિ પરંપરાના ગંભીર વિદ્યાર્થીઓ બનવા માટે આગળ આવ્યા હતા. આ વિદ્યાર્થીઓની મદદથી, ભક્તિવેદાંત સ્વામીએ ન્યૂ યોર્કના લોઅર ઇસ્ટ સાઇડ પર મંદિર તરીકે ઉપયોગ કરવા માટે એક નાનું સ્ટોરફ્રન્ટ ભાડે લીધું.\n\n જુલાઈ 1966 માં, ભક્તિવેદાંત સ્વામીએ \"વિશ્વમાં મૂલ્યોના અસંતુલનને રોકવા અને વાસ્તવિક એકતા અને શાંતિ માટે કામ કરવા\" ના હેતુ માટે ઇન્ટરનેશનલ સોસાયટી ફોર કૃષ્ણ કોન્શિયસનેસ (ઇસ્કોન) ની સ્થાપના કરી.\n\n ત્યારપછીના અગિયાર વર્ષોમાં, શ્રીલ પ્રભુપાદે ભગવાન કૃષ્ણના ઉપદેશોનો ફેલાવો કરવા માટે વ્યાખ્યાન પ્રવાસો પર 14 વખત વિશ્વભરમાં પરિક્રમા કરી. જીવનના તમામ ક્ષેત્રો અને ક્ષેત્રોના પુરુષો અને સ્ત્રીઓ તેમના સંદેશને સ્વીકારવા માટે આગળ આવ્યા. તેમની મદદથી, શ્રીલ પ્રભુપાદે વિશ્વભરમાં મંદિરો, ખેડૂત સમુદાયો, પ્રકાશન ગૃહ અને શૈક્ષણિક સંસ્થાઓની સ્થાપના કરી. અને, તેમણે વિશ્વનો સૌથી મોટો શાકાહારી ખોરાક રાહત કાર્યક્રમ, હરે કૃષ્ણ ફૂડ ફોર લાઇફ, શરૂ કર્યો.\n\nકૃષ્ણ ભાવનામૃતના મૂળને તેના ઘરમાં પોષવાની ઇચ્છા સાથે, શ્રીલ પ્રભુપાદ ઘણી વખત ભારત પાછા ફર્યા, જ્યાં તેમણે વૈષ્ણવ પરંપરામાં પુનરુત્થાનનો પ્રારંભ કર્યો. ભારતમાં, તેમણે વૃંદાવન અને માયાપુરા જેવા પવિત્ર નગરોમાં મોટા કેન્દ્રો સહિત ડઝનબંધ મંદિરો ખોલ્યા.\n\nશ્રીલ પ્રભુપાદનું સૌથી મહત્વપૂર્ણ યોગદાન, કદાચ, તેમના પુસ્તકો છે. તેમણે કૃષ્ણ પરંપરા પર 70 થી વધુ ગ્રંથો લખ્યા, જે વિદ્વાનો દ્વારા તેમની સત્તા, ઊંડાણ, પરંપરા પ્રત્યેની વફાદારી અને સ્પષ્ટતા માટે ખૂબ માન આપવામાં આવે છે. તેમની ઘણી કૃતિઓનો ઉપયોગ અસંખ્ય કોલેજ અભ્યાસક્રમોમાં પાઠ્યપુસ્તકો તરીકે થાય છે. તેમના લખાણોનો 76 ભાષાઓમાં અનુવાદ થયો છે. તેમના સૌથી પ્રખ્યાત કાર્યોમાં શામેલ છે: ભગવદ-ગીતા એઝ ઈટ ઈઝ, ૩૦ ખંડનું શ્રીમદ્-ભાગવતમ, અને ૧૭ ખંડનું શ્રી ચૈતન્ય-ચરિતામૃત.\n એ.સી. ભક્તિવેદાંત સ્વામી શ્રીલ પ્રભુપાદનું ૧૪ નવેમ્બર, ૧૯૭૭ ના રોજ પવિત્ર નગરી વૃંદાવનમાં અવસાન થયું, જ્યાં તેમના પ્રેમાળ શિષ્યો આજે તેમના મિશનને આગળ ધપાવી રહ્યા છે.',
      'hi':
          'सहस्राब्दियों से भक्ति-योग या कृष्ण चेतना की शिक्षाएं और समृद्ध संस्कृति भारत की सीमाओं के भीतर छिपी हुई थी। आज, दुनिया भर में लाखों लोग भक्ति के कालातीत ज्ञान को दुनिया के सामने लाने के लिए श्रील प्रभुपाद के प्रति अपना आभार व्यक्त करते हैं।\n\nअभय चरण डे के रूप में 1 सितंबर, 1896 को कलकत्ता में जन्मे, एक युवा के रूप में वे महात्मा गांधी के सविनय अवज्ञा आंदोलन में शामिल हो गए। 1922 में, प्रमुख विद्वान और आध्यात्मिक नेता, श्रील भक्तिसिद्धांत सरस्वती के साथ एक मुलाकात, युवा अभय के भविष्य के आह्वान पर सबसे प्रभावशाली साबित हुई।\n\nश्रील भक्तिसिद्धांत गौड़ीय वैष्णव समुदाय के एक नेता थे, जो व्यापक हिंदू संस्कृति के भीतर एक एकेश्वरवादी परंपरा थी उनकी भक्ति और ज्ञान से बहुत प्रभावित होकर, अभय 1933 में श्रील भक्तिसिद्धांत के शिष्य बन गए और अपने गुरु के अनुरोध को पूरा करने का संकल्प लिया। अभय, जिन्हें बाद में ए.सी. भक्तिवेदांत स्वामी प्रभुपाद के नाम से जाना गया, ने अगले 32 साल पश्चिम की अपनी यात्रा की तैयारी में बिताए।\n\n1965 में, उनहत्तर वर्ष की आयु में, श्रील प्रभुपाद ने मुफ्त यात्रा की भीख मांगी और न्यूयॉर्क जाने के लिए एक मालवाहक जहाज, जलधुता पर सवार हो गए। यात्रा खतरनाक साबित हुई और उन्हें जहाज पर दो बार दिल का दौरा पड़ा। समुद्र में 35 दिन बिताने के बाद, वे सबसे पहले ब्रुकलिन के एक सुनसान घाट पर पहुंचे, उनके पास भारतीय रुपयों में सिर्फ़ सात डॉलर और पवित्र संस्कृत ग्रंथों के उनके अनुवादों का एक टोकरा था।\n\nन्यू यॉर्क में, उन्होंने बहुत सी कठिनाइयों का सामना किया और बोवेरी के मचानों में भगवद-गीता पर कक्षाएं देकर और टॉमपकिंस स्क्वायर पार्क में कीर्तन (पारंपरिक भक्ति मंत्र) का नेतृत्व करके विनम्रतापूर्वक अपना मिशन शुरू किया। शांति और सद्भावना का उनका संदेश कई युवाओं के दिलों में गूंज उठा, जिनमें से कुछ कृष्ण-भक्ति परंपरा के गंभीर छात्र बनने के लिए आगे आए। इन छात्रों की मदद से, भक्तिवेदांत स्वामी ने मंदिर के रूप में उपयोग करने के लिए न्यूयॉर्क के लोअर ईस्ट साइड पर एक छोटी सी दुकान किराए पर ली।\n\nजुलाई 1966 में, भक्तिवेदांत स्वामी ने अंतर्राष्ट्रीय कृष्ण भावनामृत संघ (इस्कॉन) की स्थापना की जिसका उद्देश्य उन्होंने \"दुनिया में मूल्यों के असंतुलन की जाँच करना और वास्तविक एकता और शांति के लिए काम करना\" बताया।\n\nइसके बाद के ग्यारह वर्षों में, श्रील प्रभुपाद ने भगवान कृष्ण की शिक्षाओं का प्रसार करने के लिए व्याख्यान यात्राओं पर 14 बार दुनिया की परिक्रमा की। सभी पृष्ठभूमि और जीवन के सभी क्षेत्रों से पुरुष और महिलाएँ उनके संदेश को स्वीकार करने के लिए आगे आए। उनकी मदद से, श्रील प्रभुपाद ने दुनिया भर में मंदिर, कृषि समुदाय, एक प्रकाशन गृह और शैक्षणिक संस्थान स्थापित किए। और, उन्होंने एक ऐसा कार्यक्रम शुरू किया जो अब दुनिया का सबसे बड़ा शाकाहारी भोजन राहत कार्यक्रम बन गया है, हरे कृष्ण फूड फॉर लाइफ।\n\nकृष्ण चेतना की जड़ों को उसके घर में पोषित करने की इच्छा से, श्रील प्रभुपाद कई बार भारत लौटे, जहाँ उन्होंने वैष्णव परंपरा में पुनरुत्थान की अलख जगाई। भारत में, उन्होंने दर्जनों मंदिर खोले, जिनमें वृंदावन और मायापुर के पवित्र शहरों में बड़े केंद्र शामिल हैं।\n\nश्रील प्रभुपाद का सबसे महत्वपूर्ण योगदान, शायद, उनकी पुस्तकें हैं। उन्होंने कृष्ण परंपरा पर 70 से अधिक खंड लिखे, जिन्हें विद्वानों द्वारा उनके अधिकार, गहराई, परंपरा के प्रति निष्ठा और स्पष्टता के लिए बहुत सम्मान दिया जाता है। उनके कई कार्यों का उपयोग कई कॉलेज पाठ्यक्रमों में पाठ्यपुस्तकों के रूप में किया जाता है। उनके लेखन का 76 भाषाओं में अनुवाद किया गया है। उनकी सबसे प्रमुख कृतियों में शामिल हैं: भगवद्गीता यथारूप, 30 खंडों वाली श्रीमद्भागवतम्, और 17 खंडों वाली श्री चैतन्य चरितामृत।\nअ. चरण चरण भक्तिवेदांत स्वामी श्रील प्रभुपाद का निधन 14 नवंबर, 1977 को पवित्र नगरी वृंदावन में उनके प्रिय शिष्यों की उपस्थिति में हुआ, जो आज भी उनके मिशन को आगे बढ़ा रहे हैं।',
      'th':
          'เป็นเวลาหลายพันปีที่คำสอนและวัฒนธรรมอันล้ำค่าของภักติโยคะหรือจิตวิญญาณแห่งพระกฤษณะถูกซ่อนอยู่ภายในพรมแดนของอินเดีย ปัจจุบัน ผู้คนนับล้านทั่วโลกแสดงความขอบคุณศรีลาพระภูปาทที่เปิดเผยภูมิปัญญาอันเหนือกาลเวลาของภักติให้คนทั้งโลกได้รู้\n\nศรีลาเกิดเมื่อวันที่ 1 กันยายน พ.ศ. 2439 ในชื่ออภัย จารัน เด ที่เมืองกัลกัตตา เมื่อเขายังเป็นชายหนุ่ม เขาเข้าร่วมขบวนการต่อต้านการไม่เชื่อฟังของมหาตมะ คานธี ในปี พ.ศ. 2465 การประชุมกับนักวิชาการและผู้นำทางจิตวิญญาณที่มีชื่อเสียง ศรีลาภักติสิทธานตะ สรัสวดี พิสูจน์ให้เห็นว่ามีอิทธิพลมากที่สุดต่ออาชีพในอนาคตของอภัยในวัยหนุ่ม\n\nศรีลาภักติสิทธานตะเป็นผู้นำในชุมชนไวษณพกาวที ซึ่งเป็นประเพณีเทวนิยมในวัฒนธรรมฮินดูที่กว้างขวางกว่า ในการพบกันครั้งแรก ศรีลา ภักติสิทธานตะ ได้ขอให้อภัยนำคำสอนของพระกฤษณะไปสู่โลกที่ใช้ภาษาอังกฤษ อภัยรู้สึกซาบซึ้งในความศรัทธาและปัญญาของเขาเป็นอย่างยิ่ง จึงได้กลายมาเป็นสาวกของศรีลา ภักติสิทธานตะในปี 1933 และตั้งใจว่าจะปฏิบัติตามคำร้องขอของอาจารย์ อภัย ซึ่งต่อมาได้รับฉายาว่า เอ.ซี. ภักติเวทานตะ สวามี ปรภูปาดะ ได้ใช้เวลา 32 ปีถัดมาในการเตรียมตัวเดินทางไปทางตะวันตก\n\nในปี 1965 เมื่ออายุได้ 69 ปี ศรีลา ปรภูปาดะ ได้ขอเดินทางฟรีและขึ้นเรือสินค้าชื่อ Jaladhuta ไปยังนิวยอร์ก การเดินทางครั้งนั้นเต็มไปด้วยอันตราย และเขาประสบภาวะหัวใจวายถึงสองครั้งบนเรือลำนี้ หลังจากอยู่กลางทะเลเป็นเวลา 35 วัน เขาก็มาถึงท่าเรือที่เงียบเหงาในบรู๊คลินเป็นครั้งแรกด้วยเงินเพียง 7 ดอลลาร์ในรูปีอินเดีย และลังไม้บรรจุข้อความภาษาสันสกฤตที่แปลเป็นภาษาศักดิ์สิทธิ์ของเขา\n\nในนิวยอร์ก เขาเผชิญกับความยากลำบากมากมายและเริ่มภารกิจของเขาอย่างสมถะด้วยการสอนคัมภีร์ภควัทคีตาในห้องใต้หลังคาบนถนนโบเวรี และเป็นผู้นำในการสวดคีร์ตัน (บทสวดภาวนาตามประเพณีดั้งเดิม) ในทอมป์กินส์สแควร์พาร์ค ข้อความแห่งสันติภาพและความปรารถนาดีของเขาได้รับการตอบรับจากคนหนุ่มสาวจำนวนมาก ซึ่งบางคนได้กลายมาเป็นนักเรียนที่จริงจังของประเพณีกฤษณะ-ภักติ ด้วยความช่วยเหลือของนักเรียนเหล่านี้ Bhaktivedanta Swami ได้เช่าร้านค้าเล็กๆ แห่งหนึ่งในย่าน Lower East Side ของนิวยอร์กเพื่อใช้เป็นวัด\n\nในเดือนกรกฎาคม พ.ศ. 2509 Bhaktivedanta Swami ได้ก่อตั้ง International Society for Krishna Consciousness (ISKCON) เพื่อวัตถุประสงค์ที่เขาประกาศไว้ว่า \"ตรวจสอบความไม่สมดุลของค่านิยมในโลกและทำงานเพื่อความสามัคคีและสันติภาพที่แท้จริง\"\n\nในสิบเอ็ดปีต่อมา Srila Prabhupada ได้เดินทางไปทั่วโลก 14 ครั้งเพื่อไปบรรยายเพื่อเผยแพร่คำสอนของพระกฤษณะ ผู้ชายและผู้หญิงจากทุกภูมิหลังและทุกอาชีพต่างก็เข้ามายอมรับคำสอนของเขา ด้วยความช่วยเหลือของพวกเขา Srila Prabhupada ได้ก่อตั้งวัด ชุมชนเกษตรกรรม สำนักพิมพ์ และสถาบันการศึกษาต่างๆ ทั่วโลก และเขาได้เริ่มโครงการบรรเทาทุกข์อาหารมังสวิรัติที่ใหญ่ที่สุดในโลกที่เรียกว่า Hare Krishna Food for Life\n\nด้วยความปรารถนาที่จะหล่อเลี้ยงรากเหง้าของจิตวิญญาณแห่งพระกฤษณะในบ้านเกิดของพระกฤษณะ ศรีลาพระภูปาทาจึงได้เดินทางกลับไปอินเดียหลายครั้ง ซึ่งที่นั่นเขาได้จุดประกายการฟื้นฟูประเพณีไวษณพ ในอินเดีย เขาได้เปิดวัดหลายสิบแห่ง รวมถึงศูนย์กลางขนาดใหญ่ในเมืองศักดิ์สิทธิ์อย่าง Vrindavana และ Mayapura\n\nผลงานที่สำคัญที่สุดของศรีลาพระภูปาทาอาจเป็นหนังสือของเขา เขาเป็นผู้แต่งหนังสือเกี่ยวกับประเพณีพระกฤษณะมากกว่า 70 เล่ม ซึ่งนักวิชาการให้ความเคารพนับถืออย่างสูงในด้านความน่าเชื่อถือ ความลึกซึ้ง ความซื่อสัตย์ต่อประเพณี และความชัดเจน ผลงานหลายชิ้นของเขาถูกใช้เป็นตำราเรียนในหลักสูตรระดับวิทยาลัยจำนวนมาก ผลงานเขียนของเขาได้รับการแปลเป็น 76 ภาษา ผลงานที่โดดเด่นที่สุดของพระองค์ ได้แก่ Bhagavad-gita As It Is, Srimad-Bhagavatam จำนวน 30 เล่ม และ Sri Caitanya-caritamrita จำนวน 17 เล่ม\nA.C. Bhaktivedanta Swami Srila Prabhupada สิ้นพระชนม์เมื่อวันที่ 14 พฤศจิกายน พ.ศ. 2520 ณ เมืองศักดิ์สิทธิ์แห่ง Vrindavana โดยมีศิษย์ผู้เปี่ยมด้วยความรักรายล้อมอยู่เคียงข้าง ซึ่งสานต่อพันธกิจของพระองค์จนถึงทุกวันนี้',
    },
    '78id4t9h': {
      'en': 'Explore Playlist',
      'gu': 'પ્લેલિસ્ટનું અન્વેષણ કરો',
      'hi': 'प्लेलिस्ट देखें',
      'th': 'สำรวจเพลย์ลิสต์',
    },
    'sje3fwnx': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Yatra
  {
    'se2w37yx': {
      'en': 'Yatras',
      'gu': 'યાત્રાઓ',
      'hi': 'यात्राएं',
      'th': 'ยาตรา',
    },
    'au4lvauc': {
      'en': 'Sri Sri Radha Gopinath',
      'gu': 'શ્રી શ્રી રાધા ગોપીનાથ',
      'hi': 'श्री श्री राधा गोपीनाथ',
      'th': 'ศรีศรีราธาโกปินาถ',
    },
    'crkjzcqz': {
      'en': 'Canada',
      'gu': 'કેનેડા',
      'hi': 'कनाडा',
      'th': 'แคนาดา',
    },
    'owhg6fwy': {
      'en': '2009',
      'gu': '૨૦૦૯',
      'hi': '2009',
      'th': '2009',
    },
    'qwb2tcur': {
      'en': 'Pashupatinath Temple',
      'gu': 'પશુપતિનાથ મંદિર',
      'hi': 'पशुपतिनाथ मंदिर',
      'th': 'วัดปศุปฏินาถ',
    },
    'nz1qxful': {
      'en': 'Vietnam',
      'gu': 'વિયેતનામ',
      'hi': 'वियतनाम',
      'th': 'เวียดนาม',
    },
    'ur7x30vp': {
      'en': '2012',
      'gu': '૨૦૧૨',
      'hi': '2012',
      'th': '2012',
    },
    'xds44rto': {
      'en': 'Sri Ranganathaswamy',
      'gu': 'શ્રી રંગનાથસ્વામી',
      'hi': 'श्री रंगनाथस्वामी',
      'th': 'ศรีรังคนาถสวามี',
    },
    'auw1jgvt': {
      'en': 'Myanmar',
      'gu': 'મ્યાનમાર',
      'hi': 'म्यांमार',
      'th': 'พม่า',
    },
    'wwqav071': {
      'en': '2013',
      'gu': '૨૦૧૩',
      'hi': '2013',
      'th': '2013',
    },
    '6ome8app': {
      'en': 'Shwedagon Pagoda',
      'gu': 'શ્વેડાગોન પેગોડા',
      'hi': 'श्वेडागोन पगोडा',
      'th': 'เจดีย์ชเวดากอง',
    },
    'vha9xv1i': {
      'en': 'Mongolia',
      'gu': 'મંગોલિયા',
      'hi': 'मंगोलिया',
      'th': 'มองโกเลีย',
    },
    'ngsy6lc0': {
      'en': '2014',
      'gu': '૨૦૧૪',
      'hi': '2014',
      'th': '2014',
    },
    'h4av9xyw': {
      'en': 'Sri Sri Radha Gopinath',
      'gu': 'શ્રી શ્રી રાધા ગોપીનાથ',
      'hi': 'श्री श्री राधा गोपीनाथ',
      'th': 'ศรีศรีราธาโกปินาถ',
    },
    'ds9gusx5': {
      'en': 'Germany',
      'gu': 'જર્મની',
      'hi': 'जर्मनी',
      'th': 'เยอรมนี',
    },
    'qnc66tth': {
      'en': '2015',
      'gu': '૨૦૧૫',
      'hi': '2015',
      'th': '2015',
    },
    'ifwelpkp': {
      'en': 'Jokhang Temple',
      'gu': 'જોખાંગ મંદિર',
      'hi': 'जोखांग मंदिर',
      'th': 'วัดโจคัง',
    },
    'ycj5bpbs': {
      'en': 'United States',
      'gu': 'સંયુક્ત રાજ્ય અમેરિકા',
      'hi': 'संयुक्त राज्य अमेरिका',
      'th': 'ประเทศสหรัฐอเมริกา',
    },
    '9fx384h1': {
      'en': '2016',
      'gu': '૨૦૧૬',
      'hi': '2016',
      'th': '2016',
    },
    'qwi4b8xn': {
      'en': 'Wat Phra Kaew',
      'gu': 'વાટ ફ્રા કાવ',
      'hi': 'वाट फ्रा काऊ',
      'th': 'วัดพระแก้ว',
    },
    '5rrnpqya': {
      'en': 'Nepal',
      'gu': 'નેપાળ',
      'hi': 'नेपाल',
      'th': 'เนปาล',
    },
    'odbmhnhs': {
      'en': '2017',
      'gu': '૨૦૧૭',
      'hi': '2017',
      'th': '2017',
    },
    'q809d1wt': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // NotesList
  {
    'h7h494zj': {
      'en': 'Notes',
      'gu': 'નોંધો',
      'hi': 'नोट्स',
      'th': 'หมายเหตุ',
    },
    'lpwabci5': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    'xi7nlu25': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    '8u64zgm6': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'o5r6d5tz': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'ophukpt1': {
      'en': 'Video',
      'gu': 'વિડિઓ',
      'hi': 'वीडियो',
      'th': 'วีดีโอ',
    },
    'g9lsiqnq': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'bceuv4sn': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // RadioPage
  {
    'r79sn3ox': {
      'en': 'Now Playing',
      'gu': 'હમણાં ચાલી રહ્યું છે',
      'hi': 'अब खेल रहे हैं',
      'th': 'กำลังเล่นอยู่',
    },
    'q8nf1zl5': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
  },
  // Tutorial
  {
    'xyu3gqjt': {
      'en': 'Tutorial',
      'gu': 'ટ્યુટોરીયલ',
      'hi': 'ट्यूटोरियल',
      'th': 'บทช่วยสอน',
    },
    'ghffl02b': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // Settings
  {
    '6xh5rv3z': {
      'en': 'Settings',
      'gu': 'સેટિંગ્સ',
      'hi': 'सेटिंग्स',
      'th': 'การตั้งค่า',
    },
    '7qy7kdzh': {
      'en': 'Notification',
      'gu': 'સૂચના',
      'hi': 'अधिसूचना',
      'th': 'การแจ้งเตือน',
    },
    'af5v0qrx': {
      'en': 'Delete Account',
      'gu': 'એકાઉન્ટ કાઢી નાખો',
      'hi': 'खाता हटा दो',
      'th': 'ลบบัญชี',
    },
    'htfronso': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // Contact
  {
    'ohtr9x34': {
      'en': 'Contact',
      'gu': 'સંપર્ક કરો',
      'hi': 'संपर्क',
      'th': 'ติดต่อ',
    },
    '1a9p8isq': {
      'en': 'Help & Support',
      'gu': 'મદદ અને સપોર્ટ',
      'hi': 'सहायता एवं समर्थन',
      'th': 'ช่วยเหลือและการสนับสนุน',
    },
    '45e9vxz8': {
      'en': 'Email',
      'gu': 'ઇમેઇલ',
      'hi': 'ईमेल',
      'th': 'อีเมล',
    },
    'd9txyabi': {
      'en': 'Talk to us',
      'gu': 'અમારી સાથે વાત કરો',
      'hi': 'हमसे बात करें',
      'th': 'พูดคุยกับเรา',
    },
    'n75hvjeh': {
      'en': 'Web',
      'gu': 'વેબ',
      'hi': 'वेब',
      'th': 'เว็บไซต์',
    },
    'mkihl1k2': {
      'en': 'WhatsApp',
      'gu': 'વોટ્સએપ',
      'hi': 'WhatsApp',
      'th': 'วอทส์แอป',
    },
    '4kakhx2c': {
      'en': 'Contact Developer',
      'gu': 'વિકાસકર્તાનો સંપર્ક કરો',
      'hi': 'डेवलपर से संपर्क करें',
      'th': 'ติดต่อผู้พัฒนา',
    },
    '92730i0c': {
      'en': 'Email',
      'gu': 'ઇમેઇલ',
      'hi': 'ईमेल',
      'th': 'อีเมล',
    },
    '2xq5ecur': {
      'en': 'Talk to us',
      'gu': 'અમારી સાથે વાત કરો',
      'hi': 'हमसे बात करें',
      'th': 'พูดคุยกับเรา',
    },
    'lv939j0d': {
      'en': 'Web',
      'gu': 'વેબ',
      'hi': 'वेब',
      'th': 'เว็บไซต์',
    },
    'cvm78kas': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // PadaSeva
  {
    'bodkbcuh': {
      'en': 'Pada Seva',
      'gu': 'પદ સેવા',
      'hi': 'पद सेवा',
      'th': 'ปาดาเสวา',
    },
    '3zcd73lo': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    'tqfkobgv': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'u4atimj4': {
      'en': 'Video',
      'gu': 'વિડિઓ',
      'hi': 'वीडियो',
      'th': 'วีดีโอ',
    },
    'gi20ndh7': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'm7msw15o': {
      'en': 'Books',
      'gu': 'પુસ્તકો',
      'hi': 'पुस्तकें',
      'th': 'หนังสือ',
    },
    '11en9uu4': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // LegalInformation
  {
    '3khr3phq': {
      'en': 'Legal Information',
      'gu': 'કાનૂની માહિતી',
      'hi': 'कानूनी जानकारी',
      'th': 'ข้อมูลทางกฎหมาย',
    },
    'qe5vfso7': {
      'en': '📜 VVP Swami App',
      'gu': '📜 વીવીપી સ્વામી એપ',
      'hi': '📜 वीवीपी स्वामी ऐप',
      'th': '📜 แอป VVP Swami',
    },
    'rbeh9pwy': {
      'en':
          '1. Ownership and Management:\nThe VVP Swami App is jointly developed and maintained by Grey Cloud Pty Ltd (DUNS 747089661, ACN 642575077, ABN 53642575077) in collaboration with VVP Swami Media Team. The app is managed exclusively by the VVP Swami Media Team.\n\n2. Purpose of the App:\nThe app is developed purely for educational purposes. It offers access to the teachings, lectures, audio recordings, and books of Vedavyasa Priya Swami for devotees and followers.\n\n3. No Commercial Transactions:\nThe VVP Swami App does not involve any financial transactions. No products or services are sold through the app. No online payment options are integrated.\n\n4. Content Rights:\nAll audios, lectures, books, and related materials available on the app are the intellectual property of VVP Swami Media Team and are meant for educational and devotional use only. Unauthorized copying, reproduction, or distribution is prohibited.\n\n5. User Responsibility:\nUsers are expected to access the app respectfully and responsibly. Any misuse of the app or its content will lead to appropriate action, including access restrictions.\n\n6. Privacy:\nThe app does not collect personal information from users except basic app usage data necessary for technical improvement and security. No data is shared with third parties.\n\n7. Contact Information:\nFor any queries or support related to the app, please contact: vvpswami.media@gmail.com \nVed Gupta (VVP Swami Media Team)',
      'gu':
          '1. માલિકી અને સંચાલન:\nVVP સ્વામી એપ ગ્રે ક્લાઉડ પ્રાઇવેટ લિમિટેડ (DUNS 747089661, ACN 642575077, ABN 53642575077) દ્વારા VVP સ્વામી મીડિયા ટીમના સહયોગથી સંયુક્ત રીતે વિકસાવવામાં અને જાળવવામાં આવી છે. આ એપનું સંચાલન ફક્ત VVP સ્વામી મીડિયા ટીમ દ્વારા કરવામાં આવે છે.\n\n2. એપનો હેતુ:\nએપ સંપૂર્ણપણે શૈક્ષણિક હેતુઓ માટે વિકસાવવામાં આવી છે. તે ભક્તો અને અનુયાયીઓ માટે વેદવ્યાસ પ્રિયા સ્વામીના ઉપદેશો, વ્યાખ્યાનો, ઓડિયો રેકોર્ડિંગ્સ અને પુસ્તકોની ઍક્સેસ પ્રદાન કરે છે.\n\n3. કોઈ વાણિજ્યિક વ્યવહારો નહીં:\nVVP સ્વામી એપમાં કોઈપણ નાણાકીય વ્યવહારો શામેલ નથી. એપ દ્વારા કોઈ ઉત્પાદનો અથવા સેવાઓ વેચવામાં આવતી નથી. કોઈ ઓનલાઈન ચુકવણી વિકલ્પો સંકલિત નથી.\n\n4. સામગ્રી અધિકારો:\nએપ પર ઉપલબ્ધ બધા ઑડિયો, વ્યાખ્યાનો, પુસ્તકો અને સંબંધિત સામગ્રી VVP સ્વામી મીડિયા ટીમની બૌદ્ધિક સંપત્તિ છે અને ફક્ત શૈક્ષણિક અને ભક્તિના ઉપયોગ માટે છે. અનધિકૃત નકલ, પુનઃઉત્પાદન અથવા વિતરણ પ્રતિબંધિત છે.\n\n5. વપરાશકર્તા જવાબદારી:\nવપરાશકર્તાઓ પાસેથી આદર અને જવાબદારીપૂર્વક એપ્લિકેશનને ઍક્સેસ કરવાની અપેક્ષા રાખવામાં આવે છે. એપ્લિકેશન અથવા તેની સામગ્રીનો કોઈપણ દુરુપયોગ યોગ્ય કાર્યવાહી તરફ દોરી જશે, જેમાં ઍક્સેસ પ્રતિબંધો શામેલ છે.\n\n6. ગોપનીયતા:\nએપ તકનીકી સુધારણા અને સુરક્ષા માટે જરૂરી મૂળભૂત એપ્લિકેશન ઉપયોગ ડેટા સિવાય વપરાશકર્તાઓ પાસેથી વ્યક્તિગત માહિતી એકત્રિત કરતી નથી. કોઈ ડેટા તૃતીય પક્ષો સાથે શેર કરવામાં આવતો નથી.\n\n7. સંપર્ક માહિતી:\nએપ સંબંધિત કોઈપણ પ્રશ્નો અથવા સમર્થન માટે, કૃપા કરીને સંપર્ક કરો:\nવેદ ગુપ્તા (VVP સ્વામી મીડિયા ટીમ)',
      'hi':
          '1. स्वामित्व और प्रबंधन:\nवीवीपी स्वामी ऐप को ग्रे क्लाउड प्राइवेट लिमिटेड (DUNS 747089661, ACN 642575077, ABN 53642575077) द्वारा वीवीपी स्वामी मीडिया टीम के सहयोग से संयुक्त रूप से विकसित और रखरखाव किया गया है। ऐप का प्रबंधन विशेष रूप से वीवीपी स्वामी मीडिया टीम द्वारा किया जाता है।\n\n2. ऐप का उद्देश्य:\nऐप को विशुद्ध रूप से शैक्षिक उद्देश्यों के लिए विकसित किया गया है। यह भक्तों और अनुयायियों के लिए वेदव्यास प्रिय स्वामी की शिक्षाओं, व्याख्यानों, ऑडियो रिकॉर्डिंग और पुस्तकों तक पहुंच प्रदान करता है।\n\n3. कोई वाणिज्यिक लेनदेन नहीं:\nवीवीपी स्वामी ऐप में कोई वित्तीय लेनदेन शामिल नहीं है सामग्री अधिकार:\nऐप पर उपलब्ध सभी ऑडियो, व्याख्यान, पुस्तकें और संबंधित सामग्री वीवीपी स्वामी मीडिया टीम की बौद्धिक संपदा हैं और केवल शैक्षणिक और भक्ति उपयोग के लिए हैं। अनधिकृत नकल, पुनरुत्पादन या वितरण निषिद्ध है।\n\n5. उपयोगकर्ता की जिम्मेदारी:\nउपयोगकर्ताओं से अपेक्षा की जाती है कि वे ऐप को सम्मानपूर्वक और जिम्मेदारी से एक्सेस करें। ऐप या इसकी सामग्री का कोई भी दुरुपयोग उचित कार्रवाई करेगा, जिसमें एक्सेस प्रतिबंध भी शामिल हैं।\n\n6. गोपनीयता:\nऐप तकनीकी सुधार और सुरक्षा के लिए आवश्यक बुनियादी ऐप उपयोग डेटा को छोड़कर उपयोगकर्ताओं से व्यक्तिगत जानकारी एकत्र नहीं करता है। कोई भी डेटा तीसरे पक्ष के साथ साझा नहीं किया जाता है।\n\n7. संपर्क जानकारी:\nऐप से संबंधित किसी भी प्रश्न या सहायता के लिए, कृपया संपर्क करें:\nवेद गुप्ता (वीवीपी स्वामी मीडिया टीम)',
      'th':
          '1. ความเป็นเจ้าของและการจัดการ:\nแอป VVP Swami ได้รับการพัฒนาและดูแลร่วมกันโดย Grey Cloud Pty Ltd (DUNS 747089661, ACN 642575077, ABN 53642575077) ร่วมกับ VVP Swami Media Team แอปนี้จัดการโดย VVP Swami Media Team เท่านั้น\n\n2. วัตถุประสงค์ของแอป:\nแอปนี้ได้รับการพัฒนาขึ้นเพื่อวัตถุประสงค์ทางการศึกษาเท่านั้น โดยให้การเข้าถึงคำสอน บทบรรยาย บันทึกเสียง และหนังสือของ Vedavyasa Priya Swami สำหรับผู้ศรัทธาและผู้ติดตาม\n\n3. ไม่มีธุรกรรมเชิงพาณิชย์:\nแอป VVP Swami ไม่เกี่ยวข้องกับธุรกรรมทางการเงินใดๆ ไม่มีการขายสินค้าหรือบริการผ่านแอป ไม่มีการรวมตัวเลือกการชำระเงินออนไลน์\n\n4. สิทธิ์เนื้อหา:\nไฟล์เสียง บทบรรยาย หนังสือ และสื่อที่เกี่ยวข้องทั้งหมดที่มีในแอปเป็นทรัพย์สินทางปัญญาของ VVP Swami Media Team และมีไว้สำหรับการศึกษาและการอุทิศตนเท่านั้น ห้ามคัดลอก ทำซ้ำ หรือแจกจ่ายโดยไม่ได้รับอนุญาต\n\n5. ความรับผิดชอบของผู้ใช้:\nผู้ใช้ควรเข้าถึงแอปอย่างเคารพและรับผิดชอบ การใช้แอปหรือเนื้อหาในทางที่ผิดจะนำไปสู่การดำเนินการที่เหมาะสม รวมถึงการจำกัดการเข้าถึง\n\n6. ความเป็นส่วนตัว:\nแอปไม่รวบรวมข้อมูลส่วนบุคคลจากผู้ใช้ ยกเว้นข้อมูลการใช้งานแอปพื้นฐานที่จำเป็นสำหรับการปรับปรุงทางเทคนิคและความปลอดภัย ไม่มีการแบ่งปันข้อมูลกับบุคคลที่สาม\n\n7. ข้อมูลการติดต่อ:\nสำหรับคำถามหรือการสนับสนุนใดๆ ที่เกี่ยวข้องกับแอป โปรดติดต่อ:\nVed Gupta (VVP Swami Media Team)',
    },
    'duqnd9uv': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // AppInformation
  {
    '5tds72gu': {
      'en': 'App Information',
      'gu': 'એપ્લિકેશન માહિતી',
      'hi': 'ऐप जानकारी',
      'th': 'ข้อมูลแอป',
    },
    'dqymtj7d': {
      'en': 'VVPS',
      'gu': 'વીવીપીએસ',
      'hi': 'वीवीपीएस',
      'th': 'วีวีพีเอส',
    },
    'i7uxouom': {
      'en': 'App Name : VVP Swami App',
      'gu': 'એપ્લિકેશન નામ: વીવીપી સ્વામી એપ્લિકેશન',
      'hi': 'ऐप का नाम : वीवीपी स्वामी ऐप',
      'th': 'ชื่อแอป: VVP Swami App',
    },
    'umfl3kms': {
      'en': 'Developed by:',
      'gu': 'વિકસિત:',
      'hi': 'द्वारा विकसित:',
      'th': 'พัฒนาโดย:',
    },
    'whvpaujo': {
      'en':
          '\n•Concept and content managed by VVP Swami Media Team\n•Technical development and maintenance by Bytesor Private Limited\n\n',
      'gu':
          '•વિભાવના અને સામગ્રીનું સંચાલન VVP સ્વામી મીડિયા ટીમ દ્વારા\n •ટેકનિકલ વિકાસ અને જાળવણી બાઇટસર પ્રાઇવેટ લિમિટેડ દ્વારા',
      'hi':
          '• अवधारणा और सामग्री का प्रबंधन वीवीपी स्वामी मीडिया टीम द्वारा किया गया\n• तकनीकी विकास और रखरखाव बाइट्सॉर प्राइवेट लिमिटेड द्वारा किया गया',
      'th':
          '•แนวคิดและเนื้อหาได้รับการจัดการโดยทีมงาน VVP Swami Media\n•การพัฒนาด้านเทคนิคและการบำรุงรักษาโดย Bytesor Private Limited',
    },
    'tf2k6ymd': {
      'en': 'Purpose:',
      'gu': 'હેતુ:',
      'hi': 'उद्देश्य:',
      'th': 'วัตถุประสงค์:',
    },
    'ugvegksf': {
      'en':
          '\n•To provide devotees and followers of Vedavyasa Priya Swami with easy access to his lectures, audios, and books.\n•To support educational and spiritual learning based on the teachings of VVP Swami.\n\n',
      'gu':
          '•વેદવ્યાસ પ્રિય સ્વામીના ભક્તો અને અનુયાયીઓને તેમના પ્રવચનો, ઑડિઓ અને પુસ્તકોની સરળ ઍક્સેસ પૂરી પાડવા માટે.\n •વી.વી.પી. સ્વામીના ઉપદેશો પર આધારિત શૈક્ષણિક અને આધ્યાત્મિક શિક્ષણને સમર્થન આપવા માટે.',
      'hi':
          '•वेदव्यास प्रिय स्वामी के भक्तों और अनुयायियों को उनके व्याख्यानों, ऑडियो और पुस्तकों तक आसान पहुंच प्रदान करना।\n•वीवीपी स्वामी की शिक्षाओं के आधार पर शैक्षिक और आध्यात्मिक शिक्षा का समर्थन करना।',
      'th':
          '• เพื่อมอบการเข้าถึงคำบรรยาย ไฟล์เสียง และหนังสือของพระองค์ได้อย่างง่ายดายแก่ผู้ศรัทธาและผู้ติดตามของ Vedavyasa Priya Swami\n• เพื่อสนับสนุนการเรียนรู้ทางการศึกษาและจิตวิญญาณตามคำสอนของ VVP Swami',
    },
    'bvyrf9ry': {
      'en': 'Key Features:',
      'gu': 'મુખ્ય વિશેષતાઓ:',
      'hi': 'प्रमुख विशेषताऐं:',
      'th': 'คุณสมบัติหลัก:',
    },
    'fjhzn401': {
      'en':
          '\n•Audio lectures and spiritual discourses\n•Access to educational books and study materials\n•Devotee-friendly, simple, and clean user experience\n•No financial transactions or advertisements\n\n\n',
      'gu':
          '•ઓડિયો વ્યાખ્યાનો અને આધ્યાત્મિક પ્રવચનો\n•શૈક્ષણિક પુસ્તકો અને અભ્યાસ સામગ્રીની ઍક્સેસ\n•ભક્ત-મૈત્રીપૂર્ણ, સરળ અને સ્વચ્છ વપરાશકર્તા અનુભવ\n•કોઈ નાણાકીય વ્યવહારો કે જાહેરાતો નહીં',
      'hi':
          '•ऑडियो व्याख्यान और आध्यात्मिक प्रवचन\n•शैक्षणिक पुस्तकों और अध्ययन सामग्री तक पहुंच\n•भक्त-अनुकूल, सरल और स्वच्छ उपयोगकर्ता अनुभव\n•कोई वित्तीय लेनदेन या विज्ञापन नहीं',
      'th':
          '• บทบรรยายเสียงและพระธรรมเทศนา\n• เข้าถึงหนังสือและสื่อการเรียนรู้ทางการศึกษา\n• ประสบการณ์ผู้ใช้ที่เป็นมิตรต่อผู้ศรัทธา เรียบง่าย และสะอาด\n• ไม่มีธุรกรรมทางการเงินหรือโฆษณา',
    },
    'rb66ybii': {
      'en': 'Target Audience:',
      'gu': 'લક્ષ્ય પ્રેક્ષકો:',
      'hi': 'लक्षित दर्शक:',
      'th': 'กลุ่มเป้าหมาย:',
    },
    'c885x9t9': {
      'en':
          '\n\n•Devotees of Vedavyasa Priya Swami\n•Spiritual seekers wanting educational resources for personal growth\n\n',
      'gu':
          '•વેદવ્યાસ પ્રિયા સ્વામીના ભક્તો\n•વ્યક્તિગત વિકાસ માટે શૈક્ષણિક સંસાધનો ઇચ્છતા આધ્યાત્મિક સાધકો',
      'hi':
          '•वेदव्यास प्रिय स्वामी के भक्त\n•व्यक्तिगत विकास के लिए शैक्षिक संसाधन चाहने वाले आध्यात्मिक साधक',
      'th':
          '•ผู้ศรัทธาของ Vedavyasa Priya Swami\n•ผู้แสวงหาทางจิตวิญญาณที่ต้องการแหล่งข้อมูลทางการศึกษาเพื่อการเติบโตส่วนบุคคล',
    },
    'q0akj7jj': {
      'en': 'Commercial Activity:',
      'gu': 'વાણિજ્યિક પ્રવૃત્તિ:',
      'hi': 'वाणिज्यिक गतिविधि:',
      'th': 'กิจกรรมเชิงพาณิชย์:',
    },
    'ip4fgxyy': {
      'en':
          '\n•The app is completely free of charge.\n•No subscription fees, no purchases, and no in-app payments.\n\n',
      'gu':
          '•આ એપ સંપૂર્ણપણે મફત છે.\n•કોઈ સબ્સ્ક્રિપ્શન ફી નથી, કોઈ ખરીદી નથી અને કોઈ ઇન-એપ ચુકવણી નથી.',
      'hi':
          '•ऐप पूरी तरह से निःशुल्क है।\n•कोई सदस्यता शुल्क नहीं, कोई खरीदारी नहीं, और कोई इन-ऐप भुगतान नहीं।',
      'th':
          '• แอปนี้ไม่มีค่าใช้จ่ายใดๆ ทั้งสิ้น\n• ไม่มีค่าธรรมเนียมการสมัคร ไม่ต้องซื้อ และไม่มีการชำระเงินในแอป',
    },
    'onds8p6x': {
      'en': 'Management:',
      'gu': 'સંચાલન:',
      'hi': 'प्रबंध:',
      'th': 'การจัดการ:',
    },
    'ep0yug05': {
      'en':
          '\n•All content (audio, ectures, books) is curated and updated by the VVP Swami Media Team.\n•The technical platform and maintenance are handled by Bytesor Private Limited.\n\nContact for Support and Inquiries:\nVed Gupta\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\nRepresentative, VVP Swami Media Team',
      'gu':
          '•બધી સામગ્રી (ઓડિયો, એક્ચ્યુર, પુસ્તકો) VVP સ્વામી મીડિયા ટીમ દ્વારા ક્યુરેટ અને અપડેટ કરવામાં આવે છે.\n•ટેકનિકલ પ્લેટફોર્મ અને જાળવણી બાઇટસર પ્રાઇવેટ લિમિટેડ દ્વારા સંભાળવામાં આવે છે.\n\nસહાય અને પૂછપરછ માટે સંપર્ક કરો:\nવેદ ગુપ્તા\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\nપ્રતિનિધિ, VVP સ્વામી મીડિયા ટીમ',
      'hi':
          '•सभी सामग्री (ऑडियो, व्याख्यान, पुस्तकें) वीवीपी स्वामी मीडिया टीम द्वारा क्यूरेट और अपडेट की जाती है।\n•तकनीकी प्लेटफ़ॉर्म और रखरखाव बाइट्सॉर प्राइवेट लिमिटेड द्वारा संभाला जाता है।\n\nसहायता और पूछताछ के लिए संपर्क करें:\nवेद गुप्ता\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\nप्रतिनिधि, वीवीपी स्वामी मीडिया टीम',
      'th':
          '•เนื้อหาทั้งหมด (เสียง บทบรรยาย หนังสือ) ได้รับการดูแลและอัปเดตโดยทีม VVP Swami Media\n•แพลตฟอร์มทางเทคนิคและการบำรุงรักษาได้รับการดูแลโดย Bytesor Private Limited\n\nติดต่อสำหรับการสนับสนุนและการสอบถาม:\nVed Gupta\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\nตัวแทน ทีม VVP Swami Media',
    },
    'y1bwuy0a': {
      'en':
          'Developed by:\n\nConcept and content managed by VVP Swami Media Team\n\nTechnical development and maintenance by Bytesor Private Limited\n\nPurpose:\n\nTo provide devotees and followers of Vedavyasa Priya Swami with easy access to his lectures, audios, and books.\n\nTo support educational and spiritual learning based on the teachings of VVP Swami.\n\nKey Features:\n\nAudio lectures and spiritual discourses\n\nAccess to educational books and study materials\n\nDevotee-friendly, simple, and clean user experience\n\nNo financial transactions or advertisements\n\nTarget Audience:\n\nDevotees of Vedavyasa Priya Swami\n\nSpiritual seekers wanting educational resources for personal growth\n\nCommercial Activity:\n\nThe app is completely free of charge.\n\nNo subscription fees, no purchases, and no in-app payments.\n\nManagement:\n\nAll content (audio, lectures, books) is curated and updated by the VVP Swami Media Team.\n\nThe technical platform and maintenance are handled by Bytesor Private Limited.\n\nContact for Support and Inquiries:\n\nVed Gupta\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\nRepresentative, VVP Swami Media Team',
      'gu':
          'વિકસિત:\n\n VVP સ્વામી મીડિયા ટીમ દ્વારા સંચાલિત ખ્યાલ અને સામગ્રી\n\nબાઇટ્સર પ્રાઇવેટ લિમિટેડ દ્વારા ટેકનિકલ વિકાસ અને જાળવણી\n\nહેતુ:\n\nવેદવ્યાસ પ્રિયા સ્વામીના ભક્તો અને અનુયાયીઓને તેમના વ્યાખ્યાનો, ઑડિઓ અને પુસ્તકોની સરળ ઍક્સેસ પ્રદાન કરવા માટે.\n\n VVP સ્વામીના ઉપદેશો પર આધારિત શૈક્ષણિક અને આધ્યાત્મિક શિક્ષણને સમર્થન આપવા માટે.\n\nમુખ્ય વિશેષતાઓ:\n\nઑડિઓ વ્યાખ્યાનો અને આધ્યાત્મિક પ્રવચનો\n\nશૈક્ષણિક પુસ્તકો અને અભ્યાસ સામગ્રીની ઍક્સેસ\n\nભક્ત-મૈત્રીપૂર્ણ, સરળ અને સ્વચ્છ વપરાશકર્તા અનુભવ\n\nકોઈ નાણાકીય વ્યવહારો અથવા જાહેરાતો નથી\n\nલક્ષ્ય પ્રેક્ષકો:\n\nવેદવ્યાસ પ્રિયા સ્વામીના ભક્તો\n\nવ્યક્તિગત વિકાસ માટે શૈક્ષણિક સંસાધનો ઇચ્છતા આધ્યાત્મિક સાધકો\n\nવાણિજ્યિક પ્રવૃત્તિ:\n\nએપ સંપૂર્ણપણે મફત છે.\n\nકોઈ સબ્સ્ક્રિપ્શન ફી નથી, કોઈ ખરીદી નથી અને કોઈ ઇન-એપ ચુકવણી નથી.\n\nમેનેજમેન્ટ:\n\nબધી સામગ્રી (ઓડિયો, વ્યાખ્યાનો, પુસ્તકો) VVP સ્વામી મીડિયા ટીમ દ્વારા ક્યુરેટ અને અપડેટ કરવામાં આવે છે.\n\nટેકનિકલ પ્લેટફોર્મ અને જાળવણી બાયટેસર પ્રાઇવેટ લિમિટેડ દ્વારા સંચાલિત થાય છે.\n\nસહાય અને પૂછપરછ માટે સંપર્ક કરો:\n\nવેદ ગુપ્તા\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\n પ્રતિનિધિ, VVP સ્વામી મીડિયા ટીમ',
      'hi':
          'द्वारा विकसित:\n\nवीवीपी स्वामी मीडिया टीम द्वारा अवधारणा और सामग्री प्रबंधित\n\nबाइट्सर प्राइवेट लिमिटेड द्वारा तकनीकी विकास और रखरखाव\n\nउद्देश्य:\n\nवेदव्यास प्रिय स्वामी के भक्तों और अनुयायियों को उनके व्याख्यान, ऑडियो और पुस्तकों तक आसान पहुंच प्रदान करना।\n\nवीवीपी स्वामी की शिक्षाओं के आधार पर शैक्षिक और आध्यात्मिक शिक्षा का समर्थन करना।\n\nप्रमुख विशेषताएं:\n\nऑडियो व्याख्यान और आध्यात्मिक प्रवचन\n\nशैक्षिक पुस्तकों और अध्ययन सामग्री तक पहुंच\n\nभक्त-अनुकूल, सरल और स्वच्छ उपयोगकर्ता अनुभव\n\nकोई वित्तीय लेनदेन या विज्ञापन\n\nलक्षित दर्शक:\n\nवेदव्यास प्रिया स्वामी के भक्त\n\nव्यक्तिगत विकास के लिए शैक्षिक संसाधन चाहने वाले आध्यात्मिक साधक\n\nवाणिज्यिक गतिविधि:\n\nऐप पूरी तरह से निःशुल्क है।\n\nकोई सदस्यता शुल्क नहीं, कोई खरीदारी नहीं, और कोई इन-ऐप भुगतान नहीं।\n\nप्रबंधन:\n\nसभी सामग्री (ऑडियो, व्याख्यान, पुस्तकें) वीवीपी स्वामी मीडिया टीम द्वारा क्यूरेट और अपडेट की जाती है।\n\nतकनीकी प्लेटफ़ॉर्म और रखरखाव बाइट्सॉर प्राइवेट लिमिटेड द्वारा नियंत्रित किया जाता है।\n\nसहायता और पूछताछ के लिए संपर्क करें:\n\nवेद गुप्ता\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\nप्रतिनिधि, वीवीपी स्वामी मीडिया टीम',
      'th':
          'พัฒนาโดย:\n\nแนวคิดและเนื้อหาจัดการโดย VVP Swami Media Team\n\nการพัฒนาทางเทคนิคและการบำรุงรักษาโดย Bytesor Private Limited\n\nวัตถุประสงค์:\n\nเพื่อให้ผู้ศรัทธาและผู้ติดตามของ Vedavyasa Priya Swami เข้าถึงการบรรยาย ไฟล์เสียง และหนังสือของเขาได้อย่างง่ายดาย\n\nเพื่อสนับสนุนการเรียนรู้ทางการศึกษาและจิตวิญญาณตามคำสอนของ VVP Swami\n\nคุณสมบัติหลัก:\n\nการบรรยายเสียงและคำเทศนาทางจิตวิญญาณ\n\nการเข้าถึงหนังสือการศึกษาและสื่อการเรียนรู้\n\nประสบการณ์ผู้ใช้ที่เป็นมิตรต่อผู้ศรัทธา เรียบง่าย และสะอาด\n\nไม่มีธุรกรรมทางการเงินหรือโฆษณา\n\nเป้าหมาย ผู้ชม:\n\nผู้ศรัทธาของ Vedavyasa Priya Swami\n\nผู้แสวงหาทางจิตวิญญาณที่ต้องการแหล่งข้อมูลทางการศึกษาเพื่อการพัฒนาตนเอง\n\nกิจกรรมเชิงพาณิชย์:\n\nแอพนี้ไม่มีค่าใช้จ่ายใดๆ ทั้งสิ้น\n\nไม่มีค่าธรรมเนียมการสมัครสมาชิก ไม่มีการซื้อ และไม่มีการชำระเงินในแอพ\n\nการจัดการ:\n\nเนื้อหาทั้งหมด (เสียง บทบรรยาย หนังสือ) ได้รับการดูแลและอัปเดตโดยทีม VVP Swami Media\n\nแพลตฟอร์มทางเทคนิคและการบำรุงรักษาได้รับการจัดการโดย Bytesor Private Limited\n\nติดต่อสำหรับการสนับสนุนและการสอบถาม:\n\nVed Gupta\n\n+61 411 450 830\nvvpswami.media@gmail.com\n\nตัวแทน ทีม VVP Swami Media',
    },
    '9tnbq8ad': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Blog
  {
    'a63re2o0': {
      'en': 'Blog',
      'gu': 'બ્લોગ',
      'hi': 'ब्लॉग',
      'th': 'บล็อก',
    },
    '7wc93kie': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // BlogPost
  {
    '8xvmgqur': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // PadaSevaCategory
  {
    'wk1qittf': {
      'en': 'Pada Seva',
      'gu': 'પદ સેવા',
      'hi': 'पद सेवा',
      'th': 'ปาดาเสวา',
    },
    'e1jd7gay': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Downloads
  {
    '1j2hwygd': {
      'en': 'Downloads',
      'gu': 'ડાઉનલોડ',
      'hi': 'डाउनलोड',
      'th': 'ดาวน์โหลด',
    },
    'tn6afg6a': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    'h9moj5ou': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'tp9rnbfj': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'jhgkmmxp': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'aumc5tg3': {
      'en': 'Books',
      'gu': 'પુસ્તકો',
      'hi': 'पुस्तकें',
      'th': 'หนังสือ',
    },
    'pcsbyjj9': {
      'en': 'Gallery',
      'gu': 'ગેલેરી',
      'hi': 'गैलरी',
      'th': 'แกลเลอรี่',
    },
    'p895aap5': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // FeaturedVideos
  {
    '9a1uutn2': {
      'en': 'Featured Videos',
      'gu': 'વિશેષતા વિડિયો',
      'hi': 'चुनिंदा वीडियो',
      'th': 'วิดีโอแนะนำ',
    },
    '7q8xj8ae': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    '5jbtawzi': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // News
  {
    'rwnge1zu': {
      'en': 'News',
      'gu': 'સમાચાર',
      'hi': 'समाचार',
      'th': 'ข่าว',
    },
    'rn7jbunk': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // InternetConnection
  {
    'fp7z961m': {
      'en': 'VVP SWAMI',
      'gu': 'વીવીપી સ્વામી',
      'hi': 'वीवीपी स्वामी',
      'th': 'วีวีพี สวามี',
    },
    'ukqw987f': {
      'en': 'Go to downloads',
      'gu': 'ડાઉનલોડ્સ પર જાઓ',
      'hi': 'डाउनलोड पर जाएं',
      'th': 'ไปที่ดาวน์โหลด',
    },
    'lx1fofd6': {
      'en':
          'Currently there is no internet access, \nYou can access your Downloads here.',
      'gu':
          'હાલમાં ઇન્ટરનેટ ઍક્સેસ નથી, \n તમે તમારા ડાઉનલોડ્સ અહીંથી ઍક્સેસ કરી શકો છો.',
      'hi':
          'वर्तमान में इंटरनेट उपलब्ध नहीं है, \nआप अपने डाउनलोड यहां देख सकते हैं।',
      'th':
          'ขณะนี้ไม่มีการเข้าถึงอินเทอร์เน็ต \nคุณสามารถเข้าถึงการดาวน์โหลดของคุณได้ที่นี่',
    },
    'tya80uh0': {
      'en': 'Try Again',
      'gu': 'ફરી પ્રયાસ કરો',
      'hi': 'पुनः प्रयास करें',
      'th': 'ลองอีกครั้ง',
    },
    'dwhx0mmk': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Chat
  {
    '4s7x7uvu': {
      'en': 'Chat',
      'gu': 'ચેટ',
      'hi': 'बात करना',
      'th': 'แชท',
    },
    'ws3vll5r': {
      'en': 'Type here',
      'gu': 'અહીં લખો',
      'hi': 'यहाँ टाइप करें',
      'th': 'พิมพ์ที่นี่',
    },
    '7pnmez6k': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // MyChats
  {
    'ffpqs1aj': {
      'en': 'Chat',
      'gu': 'ચેટ',
      'hi': 'बात करना',
      'th': 'แชท',
    },
    '98jz62r6': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // Notification
  {
    'wanu3b8k': {
      'en': 'Notification',
      'gu': 'સૂચના',
      'hi': 'अधिसूचना',
      'th': 'การแจ้งเตือน',
    },
    'btao2m3v': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '13t6p29z': {
      'en':
          'Receive divine updates and stay connected to the journey of wisdom. Turn notifications ON to be guided every step.',
      'gu':
          'દૈવી અપડેટ્સ મેળવો અને શાણપણની યાત્રા સાથે જોડાયેલા રહો. દરેક પગલા પર માર્ગદર્શન મેળવવા માટે સૂચનાઓ ચાલુ કરો.',
      'hi':
          'दिव्य अपडेट प्राप्त करें और ज्ञान की यात्रा से जुड़े रहें। हर कदम पर मार्गदर्शन पाने के लिए नोटिफ़िकेशन चालू करें।',
      'th':
          'รับข้อมูลอัปเดตจากพระเจ้าและติดตามการเดินทางแห่งปัญญา เปิดการแจ้งเตือนเพื่อรับคำแนะนำทุกขั้นตอน',
    },
    '5bgiioar': {
      'en': 'You will now receive notifications from VVPSwami App.',
      'gu': 'હવે તમને VVPSwami એપ પરથી સૂચનાઓ પ્રાપ્ત થશે.',
      'hi': 'अब आपको वी.वी.पी.स्वामी ऐप से सूचनाएं प्राप्त होंगी।',
      'th': 'ตอนนี้คุณจะได้รับการแจ้งเตือนจากแอป VVPSwami',
    },
    'z8g5ut74': {
      'en':
          'You have paused notifications. You can enable them anytime to stay connected.',
      'gu': 'હવે તમને VVPSwami એપ પરથી સૂચનાઓ પ્રાપ્ત થશે.',
      'hi': 'अब आपको वी.वी.पी.स्वामी ऐप से सूचनाएं प्राप्त होंगी।',
      'th': 'ตอนนี้คุณจะได้รับการแจ้งเตือนจากแอป VVPSwami',
    },
    'tv62ebr8': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
  },
  // SearchPage
  {
    'm66y6jhv': {
      'en': 'Search here..',
      'gu': 'અહીં શોધો..',
      'hi': 'यहां तलाश करो..',
      'th': 'ค้นหาที่นี่..',
    },
    'gf4q8b9z': {
      'en': 'Search Results',
      'gu': 'શોધ પરિણામો',
      'hi': 'खोज के परिणाम',
      'th': 'ผลการค้นหา',
    },
    'w9v7s505': {
      'en': 'Audio',
      'gu': 'ઑડિઓ',
      'hi': 'ऑडियो',
      'th': 'เสียง',
    },
    'rnm396nn': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'tfiphk2e': {
      'en': 'Prabhupada',
      'gu': 'પ્રભુપાદ',
      'hi': 'प्रभुपाद',
      'th': 'พระภูปาทา',
    },
    'l28yt37s': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    'k5d4rmiv': {
      'en': 'Video',
      'gu': 'વિડિઓ',
      'hi': 'वीडियो',
      'th': 'วีดีโอ',
    },
    '96f1ydft': {
      'en': 'Play',
      'gu': 'રમો',
      'hi': 'खेल',
      'th': 'เล่น',
    },
    '50ua0qmq': {
      'en': 'Gallery',
      'gu': 'ગેલેરી',
      'hi': 'गैलरी',
      'th': 'แกลเลอรี่',
    },
    '3qharng3': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
  },
  // SimpleAudioPlayer
  {
    'xh9bmf9b': {
      'en': '0:00',
      'gu': '૦:૦૦',
      'hi': '0:00',
      'th': '0:00',
    },
    '0n5u1yq7': {
      'en': '3:34',
      'gu': '૩:૩૪',
      'hi': '3:34',
      'th': '3:34',
    },
  },
  // BottomNavBar
  {
    'h4nu73o1': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
    '63c94nca': {
      'en': 'Search',
      'gu': 'શોધો',
      'hi': 'खोज',
      'th': 'ค้นหา',
    },
    'rtjm3l36': {
      'en': 'Radio',
      'gu': 'રેડિયો',
      'hi': 'रेडियो',
      'th': 'วิทยุ',
    },
    '7qqon4ry': {
      'en': 'Library',
      'gu': 'પુસ્તકાલય',
      'hi': 'पुस्तकालय',
      'th': 'ห้องสมุด',
    },
    'u24p03rd': {
      'en': 'Profile',
      'gu': 'પ્રોફાઇલ',
      'hi': 'प्रोफ़ाइल',
      'th': 'ประวัติโดยย่อ',
    },
  },
  // empty
  {
    '90g7chec': {
      'en': 'No Records Found',
      'gu': 'કોઈ રેકોર્ડ મળ્યાં નથી',
      'hi': 'कोई रिकॉर्ड नहीं मिला',
      'th': 'ไม่พบข้อมูล',
    },
    'ytdeeynm': {
      'en': 'It seems that there are no records.',
      'gu': 'એવું લાગે છે કે કોઈ રેકોર્ડ નથી.',
      'hi': 'ऐसा लगता है कि कोई रिकार्ड नहीं है।',
      'th': 'ดูเหมือนว่าจะไม่มีบันทึกใดๆ',
    },
    'oma1ikno': {
      'en': 'You\'re offline. Explore downloads?',
      'gu': 'તમે ઑફલાઇન છો. ડાઉનલોડ્સનું અન્વેષણ કરીએ?',
      'hi': 'आप ऑफ़लाइन हैं। डाउनलोड देखें?',
      'th': 'คุณออฟไลน์อยู่ ต้องการดาวน์โหลดหรือไม่',
    },
    'r8ss0kbg': {
      'en':
          'Access your downloaded content anytime, even offline! Simply click the link below to get started.',
      'gu':
          'તમારા ડાઉનલોડ કરેલા કન્ટેન્ટને ગમે ત્યારે ઍક્સેસ કરો, ઑફલાઇન પણ! શરૂઆત કરવા માટે ફક્ત નીચેની લિંક પર ક્લિક કરો.',
      'hi':
          'अपनी डाउनलोड की गई सामग्री को कभी भी एक्सेस करें, यहां तक ​​कि ऑफ़लाइन भी! आरंभ करने के लिए बस नीचे दिए गए लिंक पर क्लिक करें।',
      'th':
          'เข้าถึงเนื้อหาที่คุณดาวน์โหลดได้ตลอดเวลาแม้ออฟไลน์ เพียงคลิกที่ลิงค์ด้านล่างเพื่อเริ่มต้น',
    },
    'qfswa8te': {
      'en': 'Go to downloads',
      'gu': 'ડાઉનલોડ્સ પર જાઓ',
      'hi': 'डाउनलोड पर जाएं',
      'th': 'ไปที่ดาวน์โหลด',
    },
    'ul0aglnj': {
      'en':
          'Currently there is no internet access, \nYou can access your Downloads here.',
      'gu':
          'હાલમાં ઇન્ટરનેટ ઍક્સેસ નથી, \n તમે તમારા ડાઉનલોડ્સ અહીંથી ઍક્સેસ કરી શકો છો.',
      'hi':
          'वर्तमान में इंटरनेट उपलब्ध नहीं है, \nआप अपने डाउनलोड यहां देख सकते हैं।',
      'th':
          'ขณะนี้ไม่มีการเข้าถึงอินเทอร์เน็ต \nคุณสามารถเข้าถึงการดาวน์โหลดของคุณได้ที่นี่',
    },
  },
  // PledgeConfirmation
  {
    'o2f6c45a': {
      'en': 'Success!',
      'gu': 'સફળતા!',
      'hi': 'सफलता!',
      'th': 'ความสำเร็จ!',
    },
    '6ozibc6q': {
      'en': 'Our donation team will contact you soon',
      'gu': 'અમારી દાન ટીમ ટૂંક સમયમાં તમારો સંપર્ક કરશે.',
      'hi': 'हमारी दान टीम जल्द ही आपसे संपर्क करेगी',
      'th': 'ทีมรับบริจาคของเราจะติดต่อคุณเร็วๆ นี้',
    },
    '2nhd0r7z': {
      'en': 'Continue',
      'gu': 'ચાલુ રાખો',
      'hi': 'जारी रखना',
      'th': 'ดำเนินการต่อ',
    },
  },
  // MoreOption
  {
    'sukyyb5x': {
      'en': 'Save Playlist',
      'gu': 'પ્લેલિસ્ટ સાચવો',
      'hi': 'प्लेलिस्ट सहेजें',
      'th': 'บันทึกเพลย์ลิสต์',
    },
    'imjkyzf5': {
      'en': 'Download',
      'gu': 'ડાઉનલોડ કરો',
      'hi': 'डाउनलोड करना',
      'th': 'ดาวน์โหลด',
    },
    'f1ki2kjf': {
      'en': 'Share',
      'gu': 'શેર કરો',
      'hi': 'शेयर करना',
      'th': 'แบ่งปัน',
    },
  },
  // Filter
  {
    '96os8fxz': {
      'en': 'Language :',
      'gu': 'ભાષા:',
      'hi': 'भाषा :',
      'th': 'ภาษา :',
    },
    'pcxhvzuq': {
      'en': 'Year : ',
      'gu': 'વર્ષ :',
      'hi': 'वर्ष :',
      'th': 'ปี :',
    },
    'opf0ld6l': {
      'en': 'Place : ',
      'gu': 'સ્થળ:',
      'hi': 'जगह :',
      'th': 'สถานที่ :',
    },
    'fwfqpgo5': {
      'en': 'Festival :',
      'gu': 'તહેવાર :',
      'hi': 'त्योहार :',
      'th': 'งานเทศกาล :',
    },
    'zagfahj4': {
      'en': 'Parts & Chapters :',
      'gu': 'ભાગો અને પ્રકરણો :',
      'hi': 'भाग एवं अध्याय :',
      'th': 'ส่วน & บท :',
    },
    'par3d7n8': {
      'en': 'Apply',
      'gu': 'અરજી કરો',
      'hi': 'आवेदन करना',
      'th': 'นำมาใช้',
    },
    '1sqmcae5': {
      'en': 'Clear Filters',
      'gu': 'ફિલ્ટર્સ સાફ કરો',
      'hi': 'फ़िल्टर साफ़ करें',
      'th': 'ล้างตัวกรอง',
    },
  },
  // SideMenu
  {
    'n4vkajxt': {
      'en': 'VVPS',
      'gu': 'વીવીપીએસ',
      'hi': 'वीवीपीएस',
      'th': 'วีวีพีเอส',
    },
    'fwh279gv': {
      'en': 'Explore the teachings of Holiness \nVedavyasapriya Swami',
      'gu': 'પવિત્રતા \n વેદવ્યાસપ્રિય સ્વામીના ઉપદેશોનું અન્વેષણ કરો',
      'hi': 'परम पावन \nवेदव्यासप्रिय स्वामी की शिक्षाओं का अन्वेषण करें',
      'th': 'สำรวจคำสอนของความศักดิ์สิทธิ์ \nVedavyasapriya Swami',
    },
    '9ov91h6j': {
      'en': 'Donation',
      'gu': 'દાન',
      'hi': 'दान',
      'th': 'การบริจาค',
    },
    '7l5lps3n': {
      'en': 'Tutorial',
      'gu': 'ટ્યુટોરીયલ',
      'hi': 'ट्यूटोरियल',
      'th': 'บทช่วยสอน',
    },
    'wa26a6w1': {
      'en': 'Settings',
      'gu': 'સેટિંગ્સ',
      'hi': 'सेटिंग्स',
      'th': 'การตั้งค่า',
    },
    'c8bqboc9': {
      'en': 'Contact',
      'gu': 'સંપર્ક કરો',
      'hi': 'संपर्क',
      'th': 'ติดต่อ',
    },
    '4ok6f3ny': {
      'en': 'Legal Information',
      'gu': 'કાનૂની માહિતી',
      'hi': 'कानूनी जानकारी',
      'th': 'ข้อมูลทางกฎหมาย',
    },
    'l4070zr6': {
      'en': 'App Information',
      'gu': 'એપ્લિકેશન માહિતી',
      'hi': 'ऐप जानकारी',
      'th': 'ข้อมูลแอป',
    },
    'al453r76': {
      'en': 'Logout',
      'gu': 'લોગઆઉટ',
      'hi': 'लॉग आउट',
      'th': 'ออกจากระบบ',
    },
    '7kqbulpm': {
      'en': 'VVPS',
      'gu': 'વીવીપીએસ',
      'hi': 'वीवीपीएस',
      'th': 'วีวีพีเอส',
    },
  },
  // Notes
  {
    'ice792ps': {
      'en': 'Notes Taker',
      'gu': 'નોંધ લેનાર',
      'hi': 'नोट्स लेने वाला',
      'th': 'คนจดบันทึก',
    },
    '8yqmz2oh': {
      'en': 'Update',
      'gu': 'અપડેટ',
      'hi': 'अद्यतन',
      'th': 'อัปเดต',
    },
  },
  // SavetoPlaylist
  {
    'cat09hq2': {
      'en': 'Save to Playlist',
      'gu': 'પ્લેલિસ્ટમાં સાચવો',
      'hi': 'प्लेलिस्ट में सहेजें',
      'th': 'บันทึกลงในเพลย์ลิสต์',
    },
    'fe4eianh': {
      'en': 'Save',
      'gu': 'સાચવો',
      'hi': 'बचाना',
      'th': 'บันทึก',
    },
  },
  // CreatePlayList
  {
    'gzo3z7kg': {
      'en': 'Playlist Name',
      'gu': 'પ્લેલિસ્ટનું નામ',
      'hi': 'प्लेलिस्ट का नाम',
      'th': 'ชื่อเพลย์ลิสต์',
    },
    'jsnghphv': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '7tacmbkw': {
      'en': 'Name of your playlist',
      'gu': 'તમારા પ્લેલિસ્ટનું નામ',
      'hi': 'आपकी प्लेलिस्ट का नाम',
      'th': 'ชื่อเพลย์ลิสต์ของคุณ',
    },
    'wnyp9wl0': {
      'en': 'Create',
      'gu': 'બનાવો',
      'hi': 'बनाएं',
      'th': 'สร้าง',
    },
  },
  // AccountVerified
  {
    'vuiwt3kc': {
      'en': 'Account Verified',
      'gu': 'એકાઉન્ટ ચકાસાયેલ',
      'hi': 'खाता सत्यापित',
      'th': 'บัญชีได้รับการตรวจสอบแล้ว',
    },
    '16d894t3': {
      'en': 'Your Account has been verified \nsuccessfully!',
      'gu': 'તમારા એકાઉન્ટની ચકાસણી સફળતાપૂર્વક થઈ ગઈ છે \n!',
      'hi': 'आपका खाता \nसफलतापूर्वक सत्यापित हो गया है!',
      'th': 'บัญชีของคุณได้รับการตรวจสอบ\nเรียบร้อยแล้ว!',
    },
    'qlcyg34e': {
      'en': 'Continue',
      'gu': 'ચાલુ રાખો',
      'hi': 'जारी रखना',
      'th': 'ดำเนินการต่อ',
    },
  },
  // PasswordUpdated
  {
    'ayfg9z5k': {
      'en': 'Password Updated!',
      'gu': 'પાસવર્ડ અપડેટ થયો!',
      'hi': 'पासवर्ड अपडेट किया गया!',
      'th': 'อัปเดตรหัสผ่านแล้ว!',
    },
    'm5exh37a': {
      'en': 'Your Password has been updated \nsuccessfully!',
      'gu': 'તમારો પાસવર્ડ સફળતાપૂર્વક \n અપડેટ કરવામાં આવ્યો છે!',
      'hi': 'आपका पासवर्ड \nसफलतापूर्वक अपडेट कर दिया गया है!',
      'th': 'รหัสผ่านของคุณได้รับการอัปเดต \n สำเร็จแล้ว!',
    },
    'r5ftuduz': {
      'en': 'Continue',
      'gu': 'ચાલુ રાખો',
      'hi': 'जारी रखना',
      'th': 'ดำเนินการต่อ',
    },
  },
  // CustomMessage
  {
    'ohwg46yy': {
      'en': 'Continue',
      'gu': 'ચાલુ રાખો',
      'hi': 'जारी रखना',
      'th': 'ดำเนินการต่อ',
    },
  },
  // Flag
  {
    '0mr6ij82': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'hfqe6ujb': {
      'en': 'Search for an item...',
      'gu': 'કોઈ વસ્તુ શોધો...',
      'hi': 'किसी आइटम की खोज करें...',
      'th': 'ค้นหาสินค้า...',
    },
    'fj0tvctp': {
      'en': 'India',
      'gu': 'ભારત',
      'hi': 'भारत',
      'th': 'อินเดีย',
    },
    'qntmjj9h': {
      'en': 'USA',
      'gu': 'યુનાઈટેડ સ્ટેટ્સ',
      'hi': 'यूएसए',
      'th': 'สหรัฐอเมริกา',
    },
    'fikip32g': {
      'en': 'Australia',
      'gu': 'ઓસ્ટ્રેલિયા',
      'hi': 'ऑस्ट्रेलिया',
      'th': 'ออสเตรเลีย',
    },
    's89mesh3': {
      'en': 'New Zealand',
      'gu': 'ન્યૂઝીલેન્ડ',
      'hi': 'न्यूज़ीलैंड',
      'th': 'นิวซีแลนด์',
    },
  },
  // Logout
  {
    'sf6ov1uw': {
      'en': 'Logout!',
      'gu': 'લોગઆઉટ!',
      'hi': 'लॉग आउट!',
      'th': 'ออกจากระบบ!',
    },
    '3w33k67r': {
      'en': 'Are you sure you want to logout?',
      'gu': 'શું તમે ખરેખર લોગઆઉટ કરવા માંગો છો?',
      'hi': 'क्या आप लॉग आउट करना चाहते हैं?',
      'th': 'คุณแน่ใจว่าต้องการออกจากระบบหรือไม่?',
    },
    'z8cjl8uf': {
      'en': 'Cancel',
      'gu': 'રદ કરો',
      'hi': 'रद्द करना',
      'th': 'ยกเลิก',
    },
    '1fssivuo': {
      'en': 'Logout',
      'gu': 'લોગઆઉટ',
      'hi': 'लॉग आउट',
      'th': 'ออกจากระบบ',
    },
  },
  // termsAndConditions
  {
    'w8cruwd5': {
      'en': 'Terms & Conditions – Submit Pledge',
      'gu': '📄 *નિયમો અને શરતો – પ્રતિજ્ઞા સબમિટ કરો*',
      'hi': '📄 *नियम और शर्तें – प्रतिज्ञा प्रस्तुत करें*',
      'th': '📄 *ข้อกำหนดและเงื่อนไข – ส่งคำมั่นสัญญา*',
    },
    '868o2hdc': {
      'en':
          'By submitting this pledge form on the VVP Swami app, you agree to the following terms:\n\n1. Purpose of Submission:\n   This form is intended to collect your expression of interest in contributing or supporting the VVP Swami app and its associated initiatives. Submitting the form does not create any financial obligation or legally binding commitment.\n\n2. Authenticity of Information:\n   You confirm that all details provided (name, contact number, email, and description) are accurate and submitted voluntarily.\n\n3. Use of Information:\n   Your information will only be used by the VVP Swami Media Team to contact you regarding your pledge, offer related opportunities, or share updates about the app and community initiatives.\n\n4. No Guarantees or Obligations:\n   Submission of the form does not guarantee participation in any program or activity. The VVP Swami Media Team reserves the right to accept or decline any expression of interest.\n\n5. Right to Modify:\n   VVP Swami Media Team reserves the right to modify these terms at any time. Updates will be posted within the app or communicated to you via email.\n\n 🔒 Privacy Policy – Submit Pledge\n\nYour privacy is important to us. This policy explains how your data is handled when you submit a pledge via the VVP Swami app.\n\n1. Data Collected:\n   We collect the following personal information when you submit the form:\n\n   * Full Name\n   * Mobile Number\n   * Email Address\n   * Description of your pledge or message\n\n2. Purpose of Collection:\n   This data is used solely to:\n\n   * Understand your interest or intent to contribute to the app or community\n   * Contact you for follow-up or related communication\n   * Maintain internal records for engagement purposes\n\n3. Data Sharing:\n   Your data will not be shared with third parties. It will be accessed only by the VVP Swami Media Team and its technical support team (Bytesor Pvt Ltd) for internal use.\n\n4. Data Storage and Protection:\n   Your data is stored securely in compliance with industry standards. We use Amazon AWS infrastructure and take necessary precautions to prevent unauthorized access.\n\n5. Your Rights:\n   You can request access to your submitted information or ask us to delete it at any time by contacting us at: \\[Insert support email or contact method].\n\n6. No Commercial Use:\n   Your data will not be used for marketing or commercial purposes without your explicit consent.',
      'gu':
          'VVP સ્વામી એપ પર આ પ્રતિજ્ઞા ફોર્મ સબમિટ કરીને, તમે નીચેની શરતો સાથે સંમત થાઓ છો:\n\n1. સબમિશનનો હેતુ:\n\nઆ ફોર્મ VVP સ્વામી એપ અને તેની સાથે સંકળાયેલી પહેલોમાં યોગદાન આપવા અથવા સમર્થન આપવા માટે તમારી રુચિની અભિવ્યક્તિ એકત્રિત કરવાનો છે. ફોર્મ સબમિટ કરવાથી કોઈ નાણાકીય જવાબદારી કે કાયદેસર રીતે બંધનકર્તા પ્રતિબદ્ધતા ઊભી થતી નથી.\n\n2. માહિતીની અધિકૃતતા:\n\nતમે પુષ્ટિ કરો છો કે પૂરી પાડવામાં આવેલી બધી વિગતો (નામ, સંપર્ક નંબર, ઇમેઇલ અને વર્ણન) સચોટ છે અને સ્વેચ્છાએ સબમિટ કરવામાં આવી છે.\n\n3. માહિતીનો ઉપયોગ:\nતમારી માહિતીનો ઉપયોગ ફક્ત VVP સ્વામી મીડિયા ટીમ દ્વારા તમારા પ્રતિજ્ઞા અંગે સંપર્ક કરવા, સંબંધિત તકો પ્રદાન કરવા અથવા એપ્લિકેશન અને સમુદાય પહેલ વિશે અપડેટ્સ શેર કરવા માટે કરવામાં આવશે.\n\n4. કોઈ ગેરંટી અથવા જવાબદારીઓ નથી:\nફોર્મ સબમિટ કરવાથી કોઈપણ કાર્યક્રમ અથવા પ્રવૃત્તિમાં ભાગીદારીની ગેરંટી મળતી નથી. VVP સ્વામી મીડિયા ટીમ કોઈપણ રુચિની અભિવ્યક્તિ સ્વીકારવાનો અથવા નકારવાનો અધિકાર અનામત રાખે છે.\n\n5. ફેરફાર કરવાનો અધિકાર:\nVVP સ્વામી મીડિયા ટીમ કોઈપણ સમયે આ શરતોમાં ફેરફાર કરવાનો અધિકાર અનામત રાખે છે. અપડેટ્સ એપ્લિકેશનમાં પોસ્ટ કરવામાં આવશે અથવા તમને ઇમેઇલ દ્વારા સંચાર કરવામાં આવશે.\n\n🔒 ગોપનીયતા નીતિ - પ્રતિજ્ઞા સબમિટ કરો\n\nતમારી ગોપનીયતા અમારા માટે મહત્વપૂર્ણ છે. આ નીતિ સમજાવે છે કે જ્યારે તમે VVP સ્વામી એપ્લિકેશન દ્વારા પ્રતિજ્ઞા સબમિટ કરો છો ત્યારે તમારા ડેટાને કેવી રીતે હેન્ડલ કરવામાં આવે છે.\n\n1. એકત્રિત ડેટા:\n\nજ્યારે તમે ફોર્મ સબમિટ કરો છો ત્યારે અમે નીચેની વ્યક્તિગત માહિતી એકત્રિત કરીએ છીએ:\n\n* પૂરું નામ\n* મોબાઇલ નંબર\n* ઇમેઇલ સરનામું\n* તમારા પ્રતિજ્ઞા અથવા સંદેશનું વર્ણન\n\n2. સંગ્રહનો હેતુ:\n\nઆ ડેટાનો ઉપયોગ ફક્ત આ માટે થાય છે:\n\n* એપ્લિકેશન અથવા સમુદાયમાં યોગદાન આપવાના તમારા રસ અથવા ઇરાદાને સમજવા માટે\n* ફોલો-અપ અથવા સંબંધિત સંદેશાવ્યવહાર માટે તમારો સંપર્ક કરો\n* જોડાણ હેતુઓ માટે આંતરિક રેકોર્ડ જાળવો\n\n3. ડેટા શેરિંગ:\nતમારો ડેટા તૃતીય પક્ષો સાથે શેર કરવામાં આવશે નહીં. તે ફક્ત VVP સ્વામી મીડિયા ટીમ અને તેની તકનીકી સપોર્ટ ટીમ (બાઇટસર પ્રા. લિ.) દ્વારા આંતરિક ઉપયોગ માટે ઍક્સેસ કરવામાં આવશે.\n\n4. ડેટા સ્ટોરેજ અને સુરક્ષા:\nતમારો ડેટા ઉદ્યોગ ધોરણોનું પાલન કરીને સુરક્ષિત રીતે સંગ્રહિત થાય છે. અમે Amazon AWS ઇન્ફ્રાસ્ટ્રક્ચરનો ઉપયોગ કરીએ છીએ અને અનધિકૃત ઍક્સેસને રોકવા માટે જરૂરી સાવચેતી રાખીએ છીએ.\n\n૫. તમારા અધિકારો:\nતમે તમારી સબમિટ કરેલી માહિતીની ઍક્સેસની વિનંતી કરી શકો છો અથવા કોઈપણ સમયે અમારો સંપર્ક કરીને તેને કાઢી નાખવા માટે કહી શકો છો: \\[સપોર્ટ ઇમેઇલ અથવા સંપર્ક પદ્ધતિ દાખલ કરો].\n\n૬. કોઈ વાણિજ્યિક ઉપયોગ નહીં:\nતમારી સ્પષ્ટ સંમતિ વિના તમારા ડેટાનો ઉપયોગ માર્કેટિંગ અથવા વાણિજ્યિક હેતુઓ માટે કરવામાં આવશે નહીં.',
      'hi':
          'वीवीपी स्वामी ऐप पर यह प्रतिज्ञा फ़ॉर्म सबमिट करके, आप निम्नलिखित शर्तों से सहमत होते हैं:\n\n1. सबमिशन का उद्देश्य:\nइस फ़ॉर्म का उद्देश्य वीवीपी स्वामी ऐप और इससे जुड़ी पहलों में योगदान देने या उनका समर्थन करने में आपकी रुचि की अभिव्यक्ति एकत्र करना है। फ़ॉर्म सबमिट करने से कोई वित्तीय दायित्व या कानूनी रूप से बाध्यकारी प्रतिबद्धता नहीं बनती है।\n\n2. सूचना की प्रामाणिकता:\nआप पुष्टि करते हैं कि प्रदान की गई सभी जानकारी (नाम, संपर्क नंबर, ईमेल और विवरण) सटीक हैं और स्वेच्छा से सबमिट की गई हैं।\n\n3. सूचना का उपयोग:\nआपकी जानकारी का उपयोग केवल वीवीपी स्वामी मीडिया टीम द्वारा आपकी प्रतिज्ञा के बारे में आपसे संपर्क करने, संबंधित अवसर प्रदान करने या ऐप और सामुदायिक पहलों के बारे में अपडेट साझा करने के लिए किया जाएगा।\n\n4. कोई गारंटी या दायित्व नहीं:\nफ़ॉर्म सबमिट करने से किसी भी कार्यक्रम या गतिविधि में भागीदारी की गारंटी नहीं मिलती है। वीवीपी स्वामी मीडिया टीम किसी भी रुचि की अभिव्यक्ति को स्वीकार या अस्वीकार करने का अधिकार सुरक्षित रखती है।\n\n5. संशोधन का अधिकार:\nवीवीपी स्वामी मीडिया टीम किसी भी समय इन शर्तों को संशोधित करने का अधिकार सुरक्षित रखती है। अपडेट ऐप के भीतर पोस्ट किए जाएंगे या ईमेल के ज़रिए आपको सूचित किए जाएँगे।\n\n🔒 गोपनीयता नीति - प्रतिज्ञा सबमिट करें\n\nआपकी गोपनीयता हमारे लिए महत्वपूर्ण है। यह नीति बताती है कि जब आप VVP स्वामी ऐप के ज़रिए प्रतिज्ञा सबमिट करते हैं, तो आपके डेटा को कैसे हैंडल किया जाता है।\n\n1. एकत्रित किया गया डेटा:\nजब आप फ़ॉर्म सबमिट करते हैं, तो हम निम्नलिखित व्यक्तिगत जानकारी एकत्रित करते हैं:\n\n* पूरा नाम\n* मोबाइल नंबर\n* ईमेल पता\n* आपकी प्रतिज्ञा या संदेश का विवरण\n\n2. संग्रह का उद्देश्य:\nइस डेटा का उपयोग केवल निम्न के लिए किया जाता है:\n\n* ऐप या समुदाय में योगदान करने की आपकी रुचि या इरादे को समझना\n* फ़ॉलो-अप या संबंधित संचार के लिए आपसे संपर्क करना\n* जुड़ाव उद्देश्यों के लिए आंतरिक रिकॉर्ड बनाए रखना\n\n3. डेटा साझा करना:\nआपका डेटा तीसरे पक्ष के साथ साझा नहीं किया जाएगा। इसे केवल VVP स्वामी मीडिया टीम और इसकी तकनीकी सहायता टीम (बाइट्सर प्राइवेट लिमिटेड) द्वारा आंतरिक उपयोग के लिए एक्सेस किया जाएगा।\n\n4. डेटा संग्रहण और सुरक्षा:\nआपका डेटा उद्योग मानकों के अनुपालन में सुरक्षित रूप से संग्रहीत किया जाता है। हम Amazon AWS इंफ्रास्ट्रक्चर का उपयोग करते हैं और अनधिकृत पहुँच को रोकने के लिए आवश्यक सावधानी बरतते हैं।\n\n5. आपके अधिकार:\nआप अपनी सबमिट की गई जानकारी तक पहुँच का अनुरोध कर सकते हैं या हमसे किसी भी समय संपर्क करके इसे हटाने के लिए कह सकते हैं: \\[सहायता ईमेल या संपर्क विधि डालें]।\n\n6. कोई व्यावसायिक उपयोग नहीं:\nआपकी स्पष्ट सहमति के बिना आपके डेटा का उपयोग मार्केटिंग या व्यावसायिक उद्देश्यों के लिए नहीं किया जाएगा।',
      'th':
          'การส่งแบบฟอร์มคำมั่นสัญญาในแอป VVP Swami ถือว่าคุณตกลงตามเงื่อนไขต่อไปนี้:\n\n1. วัตถุประสงค์ในการส่งแบบฟอร์ม:\nแบบฟอร์มนี้มีจุดประสงค์เพื่อรวบรวมการแสดงความสนใจของคุณในการสนับสนุนหรือมีส่วนสนับสนุนแอป VVP Swami และโครงการที่เกี่ยวข้อง การส่งแบบฟอร์มนี้จะไม่ก่อให้เกิดภาระผูกพันทางการเงินหรือข้อผูกมัดทางกฎหมายใดๆ\n\n2. ความถูกต้องของข้อมูล:\nคุณยืนยันว่ารายละเอียดทั้งหมดที่ให้ไว้ (ชื่อ หมายเลขติดต่อ อีเมล และคำอธิบาย) ถูกต้องและส่งมาด้วยความสมัครใจ\n\n3. การใช้ข้อมูล:\nข้อมูลของคุณจะถูกใช้โดยทีมสื่อ VVP Swami เพื่อติดต่อคุณเกี่ยวกับคำมั่นสัญญาของคุณ เสนอโอกาสที่เกี่ยวข้อง หรือแบ่งปันข้อมูลอัปเดตเกี่ยวกับแอปและโครงการชุมชนเท่านั้น\n\n4. ไม่มีการรับประกันหรือภาระผูกพันใดๆ:\nการส่งแบบฟอร์มไม่ได้รับประกันการเข้าร่วมโปรแกรมหรือกิจกรรมใดๆ ทีมสื่อ VVP Swami ขอสงวนสิทธิ์ในการยอมรับหรือปฏิเสธการแสดงความสนใจใดๆ\n\n5. สิทธิ์ในการแก้ไข:\nทีมสื่อ VVP Swami ขอสงวนสิทธิ์ในการแก้ไขเงื่อนไขเหล่านี้ได้ตลอดเวลา การอัปเดตจะถูกโพสต์ภายในแอพหรือแจ้งให้คุณทราบทางอีเมล\n\n🔒 นโยบายความเป็นส่วนตัว – ส่งคำมั่นสัญญา\n\nความเป็นส่วนตัวของคุณมีความสำคัญต่อเรา นโยบายนี้จะอธิบายว่าข้อมูลของคุณถูกจัดการอย่างไรเมื่อคุณส่งคำมั่นสัญญาผ่านแอพ VVP Swami\n\n1. ข้อมูลที่รวบรวม:\nเราเก็บรวบรวมข้อมูลส่วนบุคคลต่อไปนี้เมื่อคุณส่งแบบฟอร์ม:\n\n* ชื่อ-นามสกุล\n* หมายเลขโทรศัพท์มือถือ\n* ที่อยู่อีเมล\n* คำอธิบายคำมั่นสัญญาหรือข้อความของคุณ\n\n2. วัตถุประสงค์ในการเก็บรวบรวม:\nข้อมูลนี้ใช้เพื่อ:\n\n* ทำความเข้าใจความสนใจหรือความตั้งใจของคุณในการมีส่วนสนับสนุนแอพหรือชุมชน\n* ติดต่อคุณเพื่อติดตามผลหรือสื่อสารที่เกี่ยวข้อง\n* รักษาบันทึกภายในเพื่อวัตถุประสงค์ในการมีส่วนร่วม\n\n3. การแบ่งปันข้อมูล:\nข้อมูลของคุณจะไม่ถูกแบ่งปันกับบุคคลที่สาม จะเข้าถึงได้เฉพาะโดยทีมสื่อ VVP Swami และทีมสนับสนุนด้านเทคนิค (Bytesor Pvt Ltd) เพื่อใช้ภายในเท่านั้น\n\n4. การจัดเก็บและการปกป้องข้อมูล:\nข้อมูลของคุณจะถูกเก็บไว้อย่างปลอดภัยตามมาตรฐานอุตสาหกรรม เราใช้โครงสร้างพื้นฐาน Amazon AWS และใช้มาตรการป้องกันที่จำเป็นเพื่อป้องกันการเข้าถึงโดยไม่ได้รับอนุญาต\n\n5. สิทธิ์ของคุณ:\nคุณสามารถขอเข้าถึงข้อมูลที่คุณส่งมาหรือขอให้เราลบข้อมูลได้ตลอดเวลาโดยติดต่อเราได้ที่: \\[ใส่อีเมลสนับสนุนหรือวิธีการติดต่อ]\n\n6. ห้ามใช้ในเชิงพาณิชย์:\nข้อมูลของคุณจะไม่ถูกใช้เพื่อการตลาดหรือเพื่อวัตถุประสงค์เชิงพาณิชย์โดยไม่ได้รับความยินยอมจากคุณอย่างชัดแจ้ง',
    },
  },
  // RadioFilter
  {
    '151qa58j': {
      'en': 'Language :',
      'gu': 'ભાષા:',
      'hi': 'भाषा :',
      'th': 'ภาษา :',
    },
    'eh9zdwns': {
      'en': 'Place : ',
      'gu': 'સ્થળ:',
      'hi': 'जगह :',
      'th': 'สถานที่ :',
    },
    '81ueuhgk': {
      'en': 'Apply',
      'gu': 'અરજી કરો',
      'hi': 'आवेदन करना',
      'th': 'นำมาใช้',
    },
    '2tgcmzeu': {
      'en': 'Clear Filters',
      'gu': 'ફિલ્ટર્સ સાફ કરો',
      'hi': 'फ़िल्टर साफ़ करें',
      'th': 'ล้างตัวกรอง',
    },
  },
  // emptyDownloads
  {
    '228ewx3y': {
      'en': 'No Records Found',
      'gu': 'કોઈ રેકોર્ડ મળ્યાં નથી',
      'hi': 'कोई रिकॉर्ड नहीं मिला',
      'th': 'ไม่พบข้อมูล',
    },
    'ttkaunep': {
      'en': 'It seems that there are no records.',
      'gu': 'એવું લાગે છે કે કોઈ રેકોર્ડ નથી.',
      'hi': 'ऐसा लगता है कि कोई रिकार्ड नहीं है।',
      'th': 'ดูเหมือนว่าจะไม่มีบันทึกใดๆ',
    },
  },
  // termsAndConditionsSignUp
  {
    'yz3fqb4o': {
      'en': '📜 Terms and Conditions',
      'gu': '📜 દાન માટેના નિયમો અને શરતો',
      'hi': '📜 दान के लिए नियम और शर्तें',
      'th': '📜 เงื่อนไขและข้อกำหนดการบริจาค',
    },
    'jekqticl': {
      'en':
          'Please read these Terms and Conditions carefully before creating an account or signing up on our platform.\n\nPurpose of Sign-Up\n\nBy signing up, you agree to access services and content provided by the VVPSwami App, which support its educational and spiritual initiatives. Your use of the platform should align with these purposes.\n\n Voluntary Sign-Up\n\nCreating an account is completely voluntary. You are responsible for the accuracy of the information you provide during registration.\n\n No Guarantees or Warranties\n\nSigning up does not guarantee access to all features or services. Availability may be subject to eligibility, approval, or other terms as specified by VVPSwami App.\n\nAccount Confirmation\n\nUpon successful registration, you may receive a confirmation email or message, which serves as a record of your sign-up.\n\nAccount Management\n\nYou are responsible for maintaining the confidentiality of your login credentials and for all activity under your account.\n\nPrivacy\n\nYour personal information will be handled as described in our Privacy Policy.\n\nChanges to Terms\n\nWe may update these Terms and Conditions from time to time without prior notice. Please review them periodically.\n\nContact Information\n\nIf you have any questions regarding these Terms and Conditions, please contact:\n\n📧 Email:\nvvpswami.media@gmail.com\n📞 Talk To Us: +61 411 450 830\n\n---\n\n\n\n 🔒 Privacy Policy for Sign-Up\n\nWe respect your privacy and are committed to protecting your personal information.\n\nInformation We Collect\n\nWhen you sign up, we may collect the following information:\n\n* Name\n* Email address\n* Phone number\n* Optional profile details\n\n How We Use Your Information\n\nWe use your information to:\n\n* Create and manage your account\n* Send you confirmations or important updates\n* Personalize your experience\n* Maintain records for administrative and legal purposes\n\nData Sharing\n\nWe do not sell, rent, or trade your personal information. Your data is only shared with trusted third parties necessary for account-related services (e.g., authentication providers).\n\nData Security\n\nWe implement reasonable security measures to protect your information from unauthorized access or disclosure.\n\nCookies and Tracking\n\nOur platform may use cookies to enhance your user experience. You can control cookie settings through your browser.\n\nYour Rights\n\nYou may request to access, update, or delete your personal information by contacting us at vvpswami.media@gmail.com\n\nChanges to Privacy Policy\n\nWe may update this Privacy Policy periodically. Changes will be posted on this page with a new effective date.\n\nContact Us\n\nFor any privacy-related concerns, please contact:\n\n📧 Email:\n vvpswami.media@gmail.com\n📞 Talk To Us: +61 411 450 830',
      'gu':
          'કોઈપણ દાન આપતા પહેલા કૃપા કરીને આ નિયમો અને શરતો કાળજીપૂર્વક વાંચો.\n\nદાનનો હેતુ\nઆ પ્લેટફોર્મ દ્વારા આપવામાં આવેલા બધા દાન VVPSwami એપ દ્વારા હાથ ધરવામાં આવતી શૈક્ષણિક અને આધ્યાત્મિક પહેલને ટેકો આપવા માટે છે. દાનનો ઉપયોગ ફક્ત સખાવતી અને શૈક્ષણિક હેતુઓ માટે કરવામાં આવશે.\n\nસ્વૈચ્છિક દાન\nબધા દાન સ્વૈચ્છિક અને પરત નપાત્ર છે. તમે ખાતરી કરવા માટે જવાબદાર છો કે તમે દાન કરેલી રકમ સાચી છે.\n\nબદલામાં કોઈ માલ કે સેવાઓ નથી\nદાન કોઈપણ મૂર્ત માલ કે સેવાઓની અપેક્ષા વિના કરવામાં આવે છે.\n\nદાનની પુષ્ટિ\nસફળ દાન પર, તમને રસીદના પુરાવા તરીકે એક પુષ્ટિકરણ ઇમેઇલ (જો લાગુ હોય તો) પ્રાપ્ત થશે.\n\nરિફંડ નીતિ\nસામાન્ય નીતિ તરીકે, દાન પરત નપાત્ર છે. જો તમને લાગે કે તમારા દાનમાં કોઈ ભૂલ થઈ છે, તો કૃપા કરીને વ્યવહારના 7 દિવસની અંદર vvpswami.media@gmail.com પર અમારો સંપર્ક કરો.\n\nગોપનીયતા\nતમારી વ્યક્તિગત માહિતી અમારી ગોપનીયતા નીતિમાં વર્ણવ્યા મુજબ નિયંત્રિત કરવામાં આવશે.\n\nશરતોમાં ફેરફાર\nઅમે પૂર્વ સૂચના વિના સમયાંતરે આ નિયમો અને શરતોને અપડેટ કરી શકીએ છીએ. કૃપા કરીને સમયાંતરે તેમની સમીક્ષા કરો.\n\nસંપર્ક માહિતી\nજો તમને આ નિયમો અને શરતો અંગે કોઈ પ્રશ્નો હોય, તો કૃપા કરીને સંપર્ક કરો:\n\nઇમેઇલ: vvpswami.media@gmail.com\nઅમારા પર સંપર્ક કરો: +61 411 450 830\n\n\n🔒 દાન માટેની ગોપનીયતા નીતિ\n\nઅમે તમારી ગોપનીયતાનો આદર કરીએ છીએ અને તમારી વ્યક્તિગત માહિતીનું રક્ષણ કરવા માટે પ્રતિબદ્ધ છીએ.\n\nઅમે એકત્રિત કરીએ છીએ તે માહિતી\nજ્યારે તમે દાન કરો છો, ત્યારે અમે નીચેની માહિતી એકત્રિત કરી શકીએ છીએ:\n\nનામ\n\nઇમેઇલ સરનામું\n\nફોન નંબર\n\nબિલિંગ માહિતી (જો લાગુ)\n\nદાનની રકમ અને હેતુ\n\nઅમે તમારી માહિતીનો ઉપયોગ કેવી રીતે કરીએ છીએ\nઅમે તમારી માહિતીનો ઉપયોગ આ માટે કરીએ છીએ:\n\nતમારા દાનની પ્રક્રિયા કરવા\n\nતમને પુષ્ટિ મોકલવા\n\nએકાઉન્ટિંગ અને નિયમનકારી હેતુઓ માટે રેકોર્ડ રાખવા\n\nમહત્વપૂર્ણ અપડેટ્સનો સંપર્ક કરવા (ફક્ત જો તમે પસંદ કરો છો)\n\nડેટા શેરિંગ\nઅમે તમારી વ્યક્તિગત માહિતી વેચતા નથી, ભાડે આપતા નથી અથવા વેપાર કરતા નથી. તમારો ડેટા ફક્ત વિશ્વસનીય તૃતીય પક્ષો સાથે શેર કરવામાં આવે છે જે તમારા દાનને સુરક્ષિત રીતે પ્રક્રિયા કરવા માટે જરૂરી છે (જેમ કે ચુકવણી ગેટવે).\n\nડેટા સુરક્ષા\nઅમે તમારી માહિતીને અનધિકૃત ઍક્સેસ અથવા ખુલાસોથી બચાવવા માટે વાજબી સુરક્ષા પગલાં અમલમાં મૂકીએ છીએ.\n\nકૂકીઝ અને ટ્રેકિંગ\nઅમારું દાન પ્લેટફોર્મ તમારા વપરાશકર્તા અનુભવને વધારવા માટે કૂકીઝનો ઉપયોગ કરી શકે છે. તમે તમારા બ્રાઉઝર દ્વારા કૂકી સેટિંગ્સને નિયંત્રિત કરી શકો છો.\n\nતમારા અધિકારો\nતમે vvpswami.media@gmail.com પર અમારો સંપર્ક કરીને તમારી વ્યક્તિગત માહિતીને ઍક્સેસ કરવા, અપડેટ કરવા અથવા કાઢી નાખવાની વિનંતી કરી શકો છો.\n\nગોપનીયતા નીતિમાં ફેરફારો\nઅમે સમયાંતરે આ ગોપનીયતા નીતિને અપડેટ કરી શકીએ છીએ. ફેરફારો આ પૃષ્ઠ પર નવી અસરકારક તારીખ સાથે પોસ્ટ કરવામાં આવશે.\n\nઅમારો સંપર્ક કરો\nકોઈપણ ગોપનીયતા સંબંધિત ચિંતાઓ માટે, કૃપા કરીને સંપર્ક કરો:\n\nઇમેઇલ: vvpswami.media@gmail.com\nઅમારા સાથે વાત કરો: +61 411 450 830',
      'hi':
          'कृपया कोई भी दान करने से पहले इन नियमों और शर्तों को ध्यान से पढ़ें।\n\nदान का उद्देश्य\nइस प्लेटफ़ॉर्म के माध्यम से किए गए सभी दान का उद्देश्य वीवीपीस्वामी ऐप द्वारा संचालित शैक्षिक और आध्यात्मिक पहलों का समर्थन करना है। दान का उपयोग केवल धर्मार्थ और शैक्षिक उद्देश्यों के लिए किया जाएगा।\n\nस्वैच्छिक दान\nसभी दान स्वैच्छिक और गैर-वापसी योग्य हैं। आप यह सुनिश्चित करने के लिए जिम्मेदार हैं कि आपके द्वारा दान की गई राशि सही है।\n\nबदले में कोई सामान या सेवा नहीं\nदान बदले में किसी भी ठोस सामान या सेवा की अपेक्षा के बिना किया जाता है।\n\nदान की पुष्टि\nसफल दान के बाद, आपको रसीद के प्रमाण के रूप में एक पुष्टिकरण ईमेल (यदि लागू हो) प्राप्त होगा।\n\nवापसी नीति\nएक सामान्य नीति के रूप में, दान वापस नहीं किया जाता है। अगर आपको लगता है कि आपके दान में कोई त्रुटि हुई है, तो कृपया लेन-देन के 7 दिनों के भीतर vvpswami.media@gmail.com पर हमसे संपर्क करें।\n\nगोपनीयता\nआपकी व्यक्तिगत जानकारी को हमारी गोपनीयता नीति में वर्णित अनुसार संभाला जाएगा। कृपया समय-समय पर उनकी समीक्षा करें।\n\nसंपर्क जानकारी\nयदि आपके पास इन नियमों और शर्तों के बारे में कोई प्रश्न हैं, तो कृपया संपर्क करें:\n\nईमेल: vvpswami.media@gmail.com\nहमसे बात करें: +61 411 450 830\n\n\n🔒 दान के लिए गोपनीयता नीति\n\nहम आपकी गोपनीयता का सम्मान करते हैं और आपकी व्यक्तिगत जानकारी की सुरक्षा के लिए प्रतिबद्ध हैं।\n\nहमारे द्वारा एकत्र की गई जानकारी\nजब आप दान करते हैं, तो हम निम्नलिखित जानकारी एकत्र कर सकते हैं:\n\nनाम\n\nईमेल पता\n\nफ़ोन नंबर\n\nबिलिंग जानकारी लागू)\n\nदान राशि और उद्देश्य\n\nहम आपकी जानकारी का उपयोग कैसे करते हैं\nहम आपकी जानकारी का उपयोग निम्नलिखित के लिए करते हैं:\n\nआपके दान को संसाधित करना\n\nआपको एक पुष्टिकरण भेजना\n\nलेखा और नियामक उद्देश्यों के लिए रिकॉर्ड रखना\n\nमहत्वपूर्ण अपडेट संप्रेषित करना (केवल यदि आप ऑप्ट-इन करते हैं)\n\nडेटा साझा करना\nहम आपकी व्यक्तिगत जानकारी को बेचते, किराए पर नहीं देते या उसका व्यापार नहीं करते हैं। आपका डेटा केवल विश्वसनीय तृतीय पक्षों के साथ साझा किया जाता है जो आपके दान को सुरक्षित रूप से संसाधित करने के लिए आवश्यक हैं (जैसे भुगतान गेटवे)।\n\nडेटा सुरक्षा\nहम आपकी जानकारी को अनधिकृत पहुँच या प्रकटीकरण से बचाने के लिए उचित सुरक्षा उपाय लागू करते हैं।\n\nकुकीज़ और ट्रैकिंग\nहमारा दान प्लेटफ़ॉर्म आपके उपयोगकर्ता अनुभव को बढ़ाने के लिए कुकीज़ का उपयोग कर सकता है। आप अपने ब्राउज़र के माध्यम से कुकी सेटिंग्स को नियंत्रित कर सकते हैं।\n\nआपके अधिकार\nआप हमसे vvpswami.media@gmail.com पर संपर्क करके अपनी व्यक्तिगत जानकारी तक पहुँचने, उसे अपडेट करने या हटाने का अनुरोध कर सकते हैं।\n\nगोपनीयता नीति में परिवर्तन\nहम समय-समय पर इस गोपनीयता नीति को अपडेट कर सकते हैं। परिवर्तन इस पृष्ठ पर नई प्रभावी तिथि के साथ पोस्ट किए जाएंगे।\n\nहमसे संपर्क करें\nगोपनीयता से संबंधित किसी भी चिंता के लिए, कृपया संपर्क करें:\n\nईमेल: vvpswami.media@gmail.com\nहमसे बात करें: +61 411 450 830',
      'th':
          'โปรดอ่านข้อกำหนดและเงื่อนไขเหล่านี้อย่างละเอียดก่อนทำการบริจาคใดๆ\n\nวัตถุประสงค์ของการบริจาค\nการบริจาคทั้งหมดผ่านแพลตฟอร์มนี้มีวัตถุประสงค์เพื่อสนับสนุนโครงการด้านการศึกษาและจิตวิญญาณที่จัดทำโดย VVPSwami App การบริจาคจะถูกใช้เพื่อการกุศลและการศึกษาเท่านั้น\n\nการบริจาคโดยสมัครใจ\nการบริจาคทั้งหมดเป็นไปโดยสมัครใจและไม่สามารถขอคืนได้ คุณมีหน้าที่รับผิดชอบในการตรวจสอบให้แน่ใจว่าจำนวนเงินที่คุณบริจาคนั้นถูกต้อง\n\nไม่มีสินค้าหรือบริการตอบแทน\nการบริจาคนั้นทำขึ้นโดยไม่คาดหวังว่าจะได้รับสินค้าหรือบริการใดๆ ตอบแทน\n\nการยืนยันการบริจาค\nเมื่อบริจาคสำเร็จ คุณจะได้รับอีเมลยืนยัน (ถ้ามี) เป็นหลักฐานการรับ\n\nนโยบายการคืนเงิน\nตามนโยบายทั่วไปแล้ว การบริจาคจะไม่สามารถขอคืนได้ หากคุณเชื่อว่ามีข้อผิดพลาดเกิดขึ้นในการบริจาคของคุณ โปรดติดต่อเราที่ vvpswami.media@gmail.com ภายใน 7 วันหลังจากทำธุรกรรม\n\nความเป็นส่วนตัว\nข้อมูลส่วนบุคคลของคุณจะได้รับการจัดการตามที่อธิบายไว้ในนโยบายความเป็นส่วนตัวของเรา\n\nการเปลี่ยนแปลงข้อกำหนด\nเราอาจอัปเดตข้อกำหนดและเงื่อนไขเหล่านี้เป็นระยะๆ โดยไม่ต้องแจ้งให้ทราบล่วงหน้า กรุณาตรวจสอบเป็นระยะๆ\n\nข้อมูลติดต่อ\nหากคุณมีคำถามใดๆ เกี่ยวกับข้อกำหนดและเงื่อนไขเหล่านี้ โปรดติดต่อ:\n\nอีเมล: vvpswami.media@gmail.com\nพูดคุยกับเรา: +61 411 450 830\n\n\nนโยบายความเป็นส่วนตัวสำหรับการบริจาค🔒\n\nเราเคารพความเป็นส่วนตัวของคุณและมุ่งมั่นที่จะปกป้องข้อมูลส่วนบุคคลของคุณ\n\nข้อมูลที่เรารวบรวม\nเมื่อคุณบริจาค เราอาจรวบรวมข้อมูลต่อไปนี้:\n\nชื่อ\n\nที่อยู่อีเมล\n\nหมายเลขโทรศัพท์\n\nข้อมูลการเรียกเก็บเงิน (หาก ใช้ได้)\n\nจำนวนเงินและวัตถุประสงค์ในการบริจาค\n\nเราใช้ข้อมูลของคุณอย่างไร\nเราใช้ข้อมูลของคุณเพื่อ:\n\nดำเนินการบริจาคของคุณ\n\nส่งการยืนยันถึงคุณ\n\nเก็บบันทึกเพื่อวัตถุประสงค์ทางการบัญชีและกฎระเบียบ\n\nแจ้งข้อมูลอัปเดตที่สำคัญ (เฉพาะเมื่อคุณเลือกเข้าร่วม)\n\nการแบ่งปันข้อมูล\nเราไม่ขาย ให้เช่า หรือแลกเปลี่ยนข้อมูลส่วนบุคคลของคุณ ข้อมูลของคุณจะถูกแบ่งปันกับบุคคลที่สามที่เชื่อถือได้เท่านั้น ซึ่งจำเป็นต่อการดำเนินการบริจาคของคุณอย่างปลอดภัย (เช่น เกตเวย์การชำระเงิน)\n\nความปลอดภัยของข้อมูล\nเราใช้มาตรการรักษาความปลอดภัยที่เหมาะสมเพื่อปกป้องข้อมูลของคุณจากการเข้าถึงหรือการเปิดเผยที่ไม่ได้รับอนุญาต\n\nคุกกี้และการติดตาม\nแพลตฟอร์มการบริจาคของเราอาจใช้คุกกี้เพื่อปรับปรุงประสบการณ์ผู้ใช้ของคุณ คุณสามารถควบคุมการตั้งค่าคุกกี้ผ่านเบราว์เซอร์ของคุณได้\n\nสิทธิของคุณ\nคุณสามารถร้องขอการเข้าถึง อัปเดต หรือลบข้อมูลส่วนบุคคลของคุณได้โดยติดต่อเราที่ vvpswami.media@gmail.com\n\nการเปลี่ยนแปลงนโยบายความเป็นส่วนตัว\nเราอาจอัปเดตนโยบายความเป็นส่วนตัวนี้เป็นระยะๆ การเปลี่ยนแปลงจะถูกโพสต์บนหน้านี้พร้อมวันที่มีผลบังคับใช้ใหม่\n\nติดต่อเรา\nสำหรับข้อกังวลใดๆ ที่เกี่ยวข้องกับความเป็นส่วนตัว โปรดติดต่อ:\n\nอีเมล: vvpswami.media@gmail.com\nพูดคุยกับเรา: +61 411 450 830',
    },
  },
  // Miscellaneous
  {
    'g2pujfp4': {
      'en': 'Hello World',
      'gu': 'હેલો વર્લ્ડ',
      'hi': 'हैलो वर्ल्ड',
      'th': 'สวัสดีโลก',
    },
    'ug5cs07b': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
    '4lv5868j': {
      'en': 'Home',
      'gu': 'ઘર',
      'hi': 'घर',
      'th': 'บ้าน',
    },
    '7vl8b6pc': {
      'en': 'Hello World',
      'gu': 'હેલો વર્લ્ડ',
      'hi': 'हैलो वर्ल्ड',
      'th': 'สวัสดีโลก',
    },
    'wepn56dm': {
      'en': 'Hello World',
      'gu': 'હેલો વર્લ્ડ',
      'hi': 'हैलो वर्ल्ड',
      'th': 'สวัสดีโลก',
    },
    'y9k2zr6b': {
      'en': 'Hello World',
      'gu': 'હેલો વર્લ્ડ',
      'hi': 'हैलो वर्ल्ड',
      'th': 'สวัสดีโลก',
    },
    'gi89e9v7': {
      'en': 'Audio permission is required to play audio',
      'gu': 'ઑડિઓ ચલાવવા માટે ઑડિઓ પરવાનગી જરૂરી છે',
      'hi': 'ऑडियो चलाने के लिए ऑडियो अनुमति आवश्यक है',
      'th': 'ต้องได้รับอนุญาตเสียงจึงจะเล่นเสียงได้',
    },
    'why7rz78': {
      'en': 'Required Permission to Save Media to your device',
      'gu': 'તમારા ઉપકરણ પર મીડિયા સાચવવા માટે જરૂરી પરવાનગી',
      'hi': 'अपने डिवाइस पर मीडिया सहेजने के लिए आवश्यक अनुमति',
      'th': 'ต้องได้รับอนุญาตในการบันทึกสื่อลงในอุปกรณ์ของคุณ',
    },
    'dsn6kneu': {
      'en': 'Notification permission is required for push notification',
      'gu': 'પુશ નોટિફિકેશન માટે નોટિફિકેશન પરવાનગી જરૂરી છે',
      'hi': 'पुश नोटिफिकेशन के लिए अधिसूचना अनुमति आवश्यक है',
      'th': 'ต้องได้รับอนุญาตในการแจ้งเตือนสำหรับการแจ้งเตือนแบบพุช',
    },
    'ie430vrc': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'hklhfdmv': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'pwd7ng2z': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'g6zxhe4g': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'q19lblga': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'mcp1ni7t': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'ql0ggrgb': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'vmqo3evl': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '7qobwqcr': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'j8pq4k1z': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'whgqx298': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'c5jn6vyb': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'jswvnpz9': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'zzj1ikov': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'konqd1qz': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'nhs0jnkd': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'fnfws378': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'n3b5oqcx': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'bvmw7b87': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '7uhia2xd': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '8ka5fo9k': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'h1gckkz0': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '5kic0epj': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    '1zc5zkdv': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
    'eygaxd2i': {
      'en': '',
      'gu': '',
      'hi': '',
      'th': '',
    },
  },
].reduce((a, b) => a..addAll(b));
