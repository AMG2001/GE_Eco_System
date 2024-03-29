import 'package:get/get.dart';

class ApplicationLocal implements Translations {
  @override

  // keys mean keys of languages which simply consist of :

  ///
  Map<String, Map<String, String>> get keys => {
        'ar': {
          'Arabic': 'عربيه',
          'EARNED': 'مكسب',
          'SAVED CO2': 'حفظ Co2',
          'RECYCLED': "اعيد تدويره",
          'Plastic': 'بلاستيك',
          'Glass': 'زجاج',
          'Paper': 'ورق',
          'Eco-friendly tips': 'طرق للحفاظ علي البيئه',
          'View All': 'اظهار الكل',
          'switch_socket': 'أغلق مآخذ التوصيل الخاصة بك',
          'switch_socket-subtitle':
              'وفر الطاقة - والمال! - بإيقاف تشغيل المقابس.',
          'Use_microwave': 'استخدم الميكروويف',
          'Use_microwave_subtitle':
              'تعد أفران الميكروويف أكثر كفاءة في استخدام الطاقة من الأفران التقليدية.',
          'Reduce_plastic': 'قلل من استهلاكك للبلاستيك',
          'Reduce_plastic_subtitle':
              "لماذا لا تلتقط الفاكهة والخضروات السائبة ، بدلاً من العبوات المغلفة مسبقًا؟ ولا تنسى حقيبتك القماشية !.",
          'reusable_water':
              'احتفظ بزجاجة ماء قابلة لإعادة الاستخدام وفنجان قهوة عليك',
          'reusable_water_subtitle':
              'سيساعدك هذا على تقليل استخدامك للنفايات البلاستيكية المفردة.',
          'public_transport': 'استخدم وسائل النقل العام',
          'public_transport_subtitle':
              'قد تكون السيارة هي الخيار الأسهل والأسرع ، ولكن من خلال ركوب الحافلة أو القطار ، أو اختيار ركوب الدراجة أو المشي ، سوف تساعد في تقليل التلوث.',
          'Hello': 'هاي',
          'Waste Categories': 'تصنيفات النفايات',
          '\$': 'نقطه',
          'g': 'جرام',
          'more page': 'المزيد',
          'user account ': 'حساب المستخدم',
          'Edit Profile': 'تعديل الملف الشخصي',
          'GREEN EGYPT SUPPORT': 'الدعم من جرين ايجيبت',
          'Transactions history': 'تاريخ المعاملات',
          'Green Egypt machines Locations': 'اماكن المكينات',
          'Contact us': 'تواصل معنا',
          'USER SETTINGS': 'اعدادات المستخدم',
          'Language': 'اللغه',
          'Select your Language :': ':اختار اللغه',
          'ENGLISH': 'انجليزي',
          'ARABIC': 'عربي',
          'English': 'انجليزي',
          'Dark Mode': 'الوضع الليلي',
          'Send feedback': 'أبعت رأيك',
          'Logout': 'تسجيل خروج',
          'home': ' الرئيسيه',
          'qr code': 'مسح ضوئي',
          'Transactions': 'احصائيات',
          'more': 'المزيد',
          'Scan a code': 'مسح الرمز الضوئي',
          'Feedback!': 'رأيك!',
          'collect:': 'عدد الازايز :',
          'Earned:': 'المكسب :',
          'you cant leave this Field empty': 'لا يمكنك ترك هذا المكان فارغ',
          'this is not enough !!': 'هذا لا يكفي !!',
          'Additional comment': 'اضافه تعليق ',
          'Submit': 'ارسل',
          'Hi ,': 'هاي',
          'How Would You Rate Our App?': 'ما هو تقيمك لتطبيقنا ؟',
          'Edit your Profile': 'تعديل ملفك الشخصي',
          'User Name :': 'اسمك :',
          'Phone Number :': 'رقم الهاتف :',
          'user name': 'اسمك',
          'phone number': 'رقم الهاتف',
          'Apply Changes': 'حفظ التغييرات',
          'Call Us': 'اتصل بنا',
          'Chat': ' محادثه',
          'Contact Us': 'تواصل معنا',
          '🍀 Our Team Would like To Hear You ! 🍀':
              '🍀 فريقنا سعيد ان يسمع لك  ! 🍀',
          'Email Us': ' البريد',
          'Your Message': 'رسالتك',
          'OR': 'او',
          'Send': 'ارسل',
          'June 12 2022': ' 12 يونيو 2022',
          '2 Plastic , 3 Kan': '2 بلاستك ,3 كانز',
          'July 18 2022': '18 يوليو 2022',
          'Jan': 'يناير',
          'Feb': 'فبراير',
          'Mar': 'مارس',
          'Apr': 'ابريل',
          'May': 'مايو',
          'Jun': 'يونيو',
          'Jul': 'يوليو',
          'Aug': 'اغسطس',
          'Sep': 'سيبتمبر',
          'Week': 'اسبوع',
          'Month': 'شهر',
          '6 Month': '6 شهور',
          'Year': 'سنه',
          'Total : 15.689 \$': 'اجمالي : 15.689 \$',
          'How to recycle ': 'كيف تعيد تدوير ',
          '1.plastic':
              'تعرف على الفرق بين الورق القابل للتدوير والورق غير القابل للتدوير. الورق المشمع أو المغلف أو المصبوغ لا يمكن إعادة تدويره. ولكن يمكنك إعادة تدوير الصحف والمجلات والتغليف والورق المقوى والظروف وورق المكتب وأي ورق من هذا النوع.',
          '2.plastic':
              'إزالة جميع الأوراق القذرة أو الدهنية. يتم إعادة تدوير الورق باستخدام الماء. في حال وجود الملوثات، فإنها يمكن أن تفسد الدفعة بأكملها، بغض النظر عما إذا كانت قابلة للذوبان في الماء أم لا.',
          '3.plastic':
              'فرز الورق. تختلف أنواع الورق المختلفة في طول الألياف وبالتالي في الجودة المختلفة. ولذلك فمن المهم فرزها حسب النوع. يذهب الكرتون إلى الكرتون، ويذهب الورق المكتبي إلى الورق المكتبي، وهكذا.',
          '4.plastic': '"أحضر ورقك المفرز إلى أقرب مركز لإعادة التدوير."',
          'There is not Transaction implemented !!': '!! لم تقم بأي عمليه بعد',
          'Good Morning': 'صباح الخير',
          'Good Afternoon': 'مساء الخير',
          'Good Evening': 'مساء الخير',
          'Good Night': 'مساء الخير',
          'Cans': 'كانز',
          'Points': 'نقاط',
          'Get Cash': 'احصل علي الكاش',
          '': '',
        },
        'en': {
          'Arabic': 'Arabic',
          'EARNED': 'earned',
          'SAVED CO2': 'saved co2',
          'RECYCLED': "recycled",
          'Plastic': 'plastic',
          'Glass': 'glass',
          'Paper': 'paper',
          'Eco-friendly tips': 'eco-friendly tips',
          'View All': 'view all',
          'switch_socket': 'Switch off your plug sockets',
          'switch_socket-subtitle':
              'Save energy - and money! - by turning off your plugs.',
          'Use_microwave': 'Use your microwave',
          'Use_microwave_subtitle':
              'microwaves are a lot more energy-efficient than conventional ovens.',
          'Reduce_plastic': 'Reduce your plastic consumption',
          'Reduce_plastic_subtitle':
              "why not pick up loose fruit and vegetable, instead of pre-wrapped packs? And don't forget your canvas bag!.",
          'reusable_water':
              'Keep a reusable water bottle and coffee cup on you',
          'reusable_water_subtitle':
              'This will help you reduce your use of single-waste plastic.',
          'public_transport': 'Use public transport',
          'public_transport_subtitle':
              'A car may be the easiest and fastest option, but by taking the bus or train, or choosing to cycle or walk, you will help to pollute less.',
          'Hello': 'Hello',
          'Waste Categories': 'Waste Categories',
          '\$': '\$',
          'g': 'g',
          'more page': 'more page',
          'user account': 'user account',
          'Edit Profile': 'Edit Profile',
          'GREEN EGYPT SUPPORT': 'GREEN EGYPT SUPPORT',
          'Transactions history': 'Transactions history',
          'Green Egypt machines Locations': 'Green Egypt machines Locations',
          'Contact us': 'Contact us',
          'USER SETTINGS': 'USER SETTINGS',
          'Language': 'Language',
          'Select your Language :': 'Select your Language :',
          'ENGLISH': 'ENGLISH',
          'ARABIC': 'ARABIC',
          'English': 'English',
          'Dark Mode': 'Dark Mode',
          'Send feedback': 'Send feedback',
          'Logout': 'Logout',
          'home': 'home',
          'qr code': 'qr code',
          'Transactions': 'Transactions',
          'more': 'more',
          'Scan a code': 'Scan a code',
          'Feedback!': 'Feedback!',
          'collect:': 'collect:',
          'Earned:': 'Earned:',
          'you cant leave this Field empty': 'you cant leave this Field empty',
          'this is not enough !!': 'this is not enough !!',
          'Additional comment': 'Additional comment',
          'Submit': 'Submit',
          'Hi ,': 'Hi ,',
          'How Would You Rate Our App?': 'How Would You Rate Our App?',
          'Edit your Profile': 'Edit your Profile',
          'User Name :': 'User Name :',
          'Phone Number :': 'Phone Number :',
          'user name': 'user name',
          'phone number': 'phone number',
          'Apply Changes': 'Apply Changes',
          'Call Us': 'Call Us',
          'Chat': 'Chat',
          'Contact Us': 'Contact Us',
          '🍀 Our Team Would like To Hear You ! 🍀':
              '🍀 Our Team Would like To Hear You ! 🍀',
          'Email Us': 'Email Us',
          'Your Message': 'Your Message',
          'OR': 'OR',
          'Send': 'Send',
          'View All': 'View All',
          'June 12 2022': 'June 12 2022',
          'Jan': 'Jan',
          'Feb': 'Feb',
          'Mar': 'Mar',
          'Apr': 'Apr',
          'May': 'May',
          'Jun': 'Jun',
          'Jul': 'Jul',
          'Aug': 'Aug',
          'Sep': 'Sep',
          'Week': 'Week',
          'Month': 'Month',
          '6 Month': '6 Month',
          'Year': 'Year',
          'Total : 15.689 \$': 'Total : 15.689 \$',
          'How to recycle ': 'How to recycle ',
          '1.plastic':
              'Find out the difference between recyclable and non-recyclable paper. Such paper as waxed, laminated or painted is not recyclable.But you can recycle newspapers, magazines, packaging, cardboard, envelopes , office paper and any other paper of this type .',
          '2.plastic':
              'Remove all dirty or greasy paper. The paper is recycled using water. In the presence of pollutants , they can spoil the entire batch, regardless of whether they are soluble in water or not.',
          '3.plastic':
              'Sort the paper . Different types of paper have a different fiber length, and thus a different quality. That\'s why it\'s important to have them sorted by type. Cardboard goes to cardboard, office paper goes to office paper, etc.',
          '4.plastic':
              'Bring your sorted paper to the closest recycling centre.',
          'There is not Transaction implemented !!':
              "There is not Transaction implemented !!"
        }
      };
}
