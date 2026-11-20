import 'package:flutter/material.dart';

class AppData {

  // INFORMATIONS PERSONNELLES

  static const fullName = 'IRAKIZA SEMBA PASCALINE';

  static const headline =
      'Étudiant en sciences informatiques';

  static const location = 'Goma, Nord-Kivu, RDC';

  static const email = 'sembapisco@gmail.com';

  static const phone = '+243 999 468 876';

  static const address =
      'Goma, République démocratique du Congo';

  static const github =
      'https://github.com/PASCALINEIRAKIZA';

  static const linkedin =
      'https://www.linkedin.com/in/Piscas_Irakiza';


  // PRESENTATION

  static const about =
      "Passionné par les technologies, le développement logiciel "
      "et les réseaux informatiques. Curieux, motivé et désireux "
      "de mettre mes compétences au service de projets utiles.";


  // FORMATION

  static const education = [

    EducationItem(
      period: 'En cours',
      title: 'Sciences informatiques',
      subtitle: 'Gènie Logiciel',
      detail: 'Établissement à compléter',
    ),

  ];


  // EXPERIENCES

  static const experiences = [

    ExperienceItem(
      period: '2025-2026',
      title: 'Stage professionnel',
      organization: 'Hayatcom ',
      detail:
          'Grace à ce stage j_ai eu des comptences à reseau et télécommunication ',
    ),

    ExperienceItem(
      period: 'Mai  2025 - Juillet 2025',
      title: 'Projets informatiques',
      organization: 'AKOTHACORPORATION',
      detail:
          'Genieautopsie.page.gd, dbgoma.page.gd, chopeka.com, akothacorp.page.gd',
    ),

  ];


  // COMPETENCES TECHNIQUES

  static const technicalSkills = [

    'Flutter / Dart',
    'HTML / CSS / JavaScript',
    'Python',
    'Réseaux informatiques',
    'Microsoft Word, Excel et PowerPoint',
    'Git et GitHub',

  ];


  // LANGUES

  static const languages = [

    'Français',
    'Swahili',
    'Anglais',

  ];


  // CENTRES D'INTERET

  static const interests = [

    'Développement logiciel',
    'Intelligence artificielle',
    'Réseaux et cybersécurité',
    'Innovation technologique',

  ];


  // FAMILLE

  static const family = [

    FamilyMember(
      name: 'Paluku Justin',
      relationship: 'Père',
      profession: 'Commercant',
      initials: 'P',
      color: Color.fromARGB(255, 165, 130, 16),
    ),

    FamilyMember(
      name: 'Benny Gustave',
      relationship: 'Père',
      profession: 'Profession à compléter',
      initials: 'M',
      color: Color.fromARGB(255, 24, 16, 58),
    ),

    FamilyMember(
      name: 'Segard Safari',
      relationship: 'Frère',
      profession: 'Etudiants',
      initials: 'M',
      color: Color.fromARGB(255, 23, 12, 49),
    ),

  ];

}


// CLASSE FORMATION

class EducationItem {

  final String period;
  final String title;
  final String subtitle;
  final String detail;

  const EducationItem({
    required this.period,
    required this.title,
    required this.subtitle,
    required this.detail,
  });

}


// CLASSE EXPERIENCE

class ExperienceItem {

  final String period;
  final String title;
  final String organization;
  final String detail;

  const ExperienceItem({
    required this.period,
    required this.title,
    required this.organization,
    required this.detail,
  });

}


// CLASSE MEMBRE DE FAMILLE

class FamilyMember {

  final String name;
  final String relationship;
  final String profession;
  final String initials;
  final Color color;

  const FamilyMember({
    required this.name,
    required this.relationship,
    required this.profession,
    required this.initials,
    required this.color,
  });

}