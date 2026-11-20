import 'package:flutter/material.dart';

import '../data/app_data.dart';
import '../widgets/section_title.dart';

import 'familly_screen.dart';
import 'contact_screen.dart';
import 'login_screen.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {

  int _index = 0;

  final List<Widget> _pages = const [

    CvPage(),

    FamilyScreen(),

    ContactScreen(),

  ];

  final List<String> _titles = [

    'Mon CV',
    'Ma famille',
    'Contact',

  ];


  // DECONNEXION

  void _logout() {

    Navigator.of(context).pushAndRemoveUntil(

      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),

      (route) => false,

    );

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(
          _titles[_index],
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),

        actions: [

          IconButton(

            tooltip: 'Se déconnecter',

            onPressed: _logout,

            icon: const Icon(Icons.logout_rounded),

          ),

        ],

      ),


      // CONTENU DES PAGES

      body: IndexedStack(
        index: _index,
        children: _pages,
      ),


      // NAVIGATION INFERIEURE

      bottomNavigationBar: NavigationBar(

        selectedIndex: _index,

        onDestinationSelected: (value) {

          setState(() {
            _index = value;
          });

        },

        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Mon CV',
          ),

          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups),
            label: 'Famille',
          ),

          NavigationDestination(
            icon: Icon(Icons.contact_mail_outlined),
            selectedIcon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),

        ],

      ),

    );

  }

}



// PAGE DU CV

class CvPage extends StatelessWidget {

  const CvPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(

      padding: const EdgeInsets.fromLTRB(
        18, 20, 18, 30,
      ),

      children: [

        // PROFIL

        Container(

          padding: const EdgeInsets.all(22),

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(24),

            gradient: const LinearGradient(

              colors: [
                Color(0xFF101B32),
                Color.fromARGB(255, 223, 209, 16),
              ],

              begin: Alignment.topLeft,
              end: Alignment.bottomRight,

            ),

          ),

          child: Column(

            children: [

              CircleAvatar(

                radius: 48,

                backgroundColor: const Color.fromARGB(255, 90, 82, 8),

                child: Text(

                  AppData.fullName.isNotEmpty
                      ? AppData.fullName[0]
                      : 'J',

                  style: const TextStyle(
                    fontSize: 38,
                    color: Color(0xFF101B32),
                    fontWeight: FontWeight.w800,
                  ),

                ),

              ),

              const SizedBox(height: 14),

              Text(

                AppData.fullName,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),

              ),

              const SizedBox(height: 5),

              Text(

                AppData.headline,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  color: Color(0xFF7DD3FC),
                  fontWeight: FontWeight.w600,
                ),

              ),

              const SizedBox(height: 12),

              Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white70,
                    size: 16,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    AppData.location,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),

                ],

              ),

            ],

          ),

        ),


        // PRESENTATION

        const SectionTitle(
          title: 'Profil',
          subtitle: 'Quelques mots à propos de moi',
        ),

        _InfoCard(

          child: Text(
            AppData.about,

            style: const TextStyle(
              height: 1.55,
              color: Color(0xFF475569),
            ),

          ),

        ),


        // FORMATION

        const SectionTitle(
          title: 'Formation',
        ),

        ...AppData.education.map(

          (e) => _TimelineCard(

            icon: Icons.school_outlined,

            period: e.period,
            title: e.title,
            subtitle: e.subtitle,
            detail: e.detail,

          ),

        ),


        // EXPERIENCES

        const SectionTitle(
          title: 'Expériences et projets',
        ),

        ...AppData.experiences.map(

          (e) => _TimelineCard(

            icon: Icons.work_outline,

            period: e.period,
            title: e.title,
            subtitle: e.organization,
            detail: e.detail,

          ),

        ),


        // COMPETENCES

        const SectionTitle(
          title: 'Compétences techniques',
        ),

        _InfoCard(

          child: Wrap(

            spacing: 8,
            runSpacing: 9,

            children: AppData.technicalSkills.map(

              (s) => _SkillChip(label: s),

            ).toList(),

          ),

        ),


        // LANGUES

        const SectionTitle(
          title: 'Langues',
        ),

        _InfoCard(

          child: Column(

            children: AppData.languages.map(

              (s) => Padding(

                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),

                child: Row(

                  children: [

                    const Icon(
                      Icons.language,
                      color: Color.fromARGB(255, 161, 159, 15),
                      size: 19,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        s,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  ],

                ),

              ),

            ).toList(),

          ),

        ),


        // CENTRES D'INTERET

        const SectionTitle(
          title: 'Centres d’intérêt',
        ),

        _InfoCard(

          child: Wrap(

            spacing: 8,
            runSpacing: 9,

            children: AppData.interests.map(

              (s) => _SkillChip(
                label: s,
                icon: Icons.favorite_border,
              ),

            ).toList(),

          ),

        ),

        const SizedBox(height: 12),

        const Center(

          child: Text(
            'Merci de visiter mon profil.',

            style: TextStyle(
              color: Color.fromARGB(255, 116, 106, 17),
              fontWeight: FontWeight.w600,
            ),

          ),

        ),

      ],

    );

  }

}



// CARTE SIMPLE

class _InfoCard extends StatelessWidget {

  final Widget child;

  const _InfoCard({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: child,

      ),

    );

  }

}



// CARTE FORMATION / EXPERIENCE

class _TimelineCard extends StatelessWidget {

  final IconData icon;

  final String period;
  final String title;
  final String subtitle;
  final String detail;

  const _TimelineCard({

    required this.icon,
    required this.period,
    required this.title,
    required this.subtitle,
    required this.detail,

  });

  @override
  Widget build(BuildContext context) {

    return Card(

      child: Padding(

        padding: const EdgeInsets.all(16),

        child: Row(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(

              height: 42,
              width: 42,

              decoration: BoxDecoration(
                color: const Color(0xFFE0F2FE),
                borderRadius: BorderRadius.circular(13),
              ),

              child: Icon(
                icon,
                color: const Color.fromARGB(255, 133, 121, 17),
              ),

            ),

            const SizedBox(width: 13),

            Expanded(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    period.toUpperCase(),

                    style: const TextStyle(
                      color: Color.fromARGB(255, 161, 152, 16),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                    ),

                  ),

                  const SizedBox(height: 4),

                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 141, 117, 12),
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    detail,
                    style: const TextStyle(
                      color: Color(0xFF475569),
                      height: 1.4,
                    ),
                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}



// BADGE DE COMPETENCE

class _SkillChip extends StatelessWidget {

  final String label;
  final IconData? icon;

  const _SkillChip({
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Chip(

      avatar: icon == null
          ? null
          : Icon(
              icon,
              size: 15,
              color: const Color(0xFF0369A1),
            ),

      label: Text(label),

      backgroundColor: const Color(0xFFEAF6FD),

      side: BorderSide.none,

      labelStyle: const TextStyle(
        color: Color(0xFF075985),
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),

    );

  }

}