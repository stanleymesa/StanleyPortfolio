class Project {
  final int id;
  final String image;
  final String name;
  final String text;
  final String url;
  final List<String> types;

  Project({
    required this.id,
    required this.image,
    required this.name,
    required this.text,
    required this.url,
    required this.types,
  });
}

final defaultProjects = [
  Project(
    id: 1,
    image: '../../assets/images/img_soapmate_app.webp',
    name: 'Soapmate',
    text: "Soapmate is an Android app for making soap. It calculates ingredients for your recipes, lets you save and share them, and see recipes from other users. Available on the Google Play Store.",
    url: 'https://play.google.com/store/search?q=soapmate&c=apps&hl=en',
    types: [
      'Android Native',
      'Kotlin',
      'Jetpack Compose',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 2,
    image: '../../assets/images/img_moomoobee_app.webp',
    name: 'MooMooBee',
    text: "MooMooBee is the cashier app for the MooMooBee fashion store. With a modern design built using Jetpack Compose, it's user-friendly and efficient.",
    url: '',
    types: [
      'Android Native',
      'Kotlin',
      'Jetpack Compose',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 3,
    image: '../../assets/images/img_soapmate_web.webp',
    name: 'Soapmate - Web Version',
    text: "Soapmate's web version, built with Flutter, lets you calculate, save, and share soap recipes online. Enjoy the same features as our Android app, now in your browser.",
    url: 'https://soapmate.id/',
    types: [
      'Flutter Web',
      'Dart',
      'GetX',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 4,
    image: '../../assets/images/img_moomoobee_web.webp',
    name: 'MooMooBee - Web Version',
    text: 'The MooMooBee web version, built with Flutter Web, adds more features than the app. You can manage products and stock, handle users, track inventory, and see activity logs, all in your browser.',
    url: '',
    types: [
      'Flutter Web',
      'Dart',
      'GetX',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 5,
    image: '../../assets/images/img_portal_exam.webp',
    name: 'Portal Sekolah Exam',
    text: "Portal Sekolah Exam, from PT. Visi Prima Nusantara, is a secure exam app for students, with cheat detection and a safe testing environment.",
    url: '',
    types: [
      'Android Native',
      'Kotlin',
      'Jetpack Compose',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 6,
    image: '../../assets/images/img_hrms.webp',
    name: 'Portal Kerja HRMS',
    text: "Portal Kerja HRMS, from PT. Visi Prima Nusantara, is an HR app for attendance, shift requests, and leave management.",
    url:
        'https://play.google.com/store/apps/details?id=com.noblesoftware.hrms&hl=en',
    types: [
      'Android Native',
      'Kotlin',
      'Jetpack Compose',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 7,
    image: '../../assets/images/img_portal_kampus.webp',
    name: 'Portal Kampus',
    text: "Portal Kampus, from PT. Visi Prima Nusantara, is your go-to app for campus. It lets you see schedules, choose classes, and check your transcript, all in one spot.",
    url:
        'https://play.google.com/store/apps/details?id=com.noblesoftware.portalkampus&hl=en',
    types: [
      'Android Native',
      'Kotlin',
      'Jetpack Compose',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 8,
    image: '../../assets/images/img_portal_lms.webp',
    name: 'Portal Kampus LMS',
    text: "Portal Kampus LMS, from PT. Visi Prima Nusantara, is designed for online learning. It provides access to courses, materials, and assignments, expanding on the core Portal Kampus app.",
    url: '',
    types: [
      'Android Native',
      'Kotlin',
      'Jetpack Compose',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 9,
    image: '../../assets/images/img_cinebox.webp',
    name: 'Cinebox',
    text: "Cinebox is a comprehensive movie application available on the Play Store. Stay up-to-date with current releases, explore upcoming films, and access detailed information about your favorite movies.",
    url:
        'https://play.google.com/store/apps/details?id=com.stanleymesa.cinebox&hl=en',
    types: [
      'Android Native',
      'Kotlin',
      'XML',
      'Clean Architecture',
    ],
  ),
  Project(
    id: 10,
    image: '../../assets/images/img_portal_sekolah.webp',
    name: 'Portal Sekolah',
    text: "Portal Sekolah, from PT. Visi Prima Nusantara, is a complete school app for students. Access schedules, take exams, and stay connected with school activities, all within this single application.",
    url:
        'https://play.google.com/store/apps/details?id=com.diaalfabet.dia&hl=en',
    types: [
      'Android Native',
      'Kotlin',
      'XML',
      'Dagger',
    ],
  ),
];
