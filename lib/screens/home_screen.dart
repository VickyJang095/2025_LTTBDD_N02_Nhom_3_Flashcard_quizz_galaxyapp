// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:my_learning_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/xp_provider.dart';
import '../widgets/playlist_card.dart';
import 'profile_screen.dart';
import 'topic_screen.dart';
import 'search_screen.dart';
import 'player_screen.dart';
import 'settings_screen.dart';
import 'about_screen.dart';
import '../widgets/starfield.dart';
import '../widgets/planet_widget.dart';
import '../widgets/animated_grid_item.dart';
import 'package:lottie/lottie.dart';
import 'package:my_learning_app/utils/rocket_orbit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<PlaylistCard> cards = [];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    final xp = Provider.of<XPProvider>(context);

    final List<PlaylistCard> cards = [
      PlaylistCard(
        title: t('Learn'),
        subtitle: t('Learn 10 words'),
        icon: Icon(Icons.book, color: Colors.white70, size: 48),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TopicScreen(mode: 'flashcard'),
          ),
        ),
      ),
      PlaylistCard(
        title: t('Test'),
        subtitle: t('Learn 8 words'),
        icon: Icon(Icons.quiz, color: Colors.white70, size: 48),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TopicScreen(mode: 'quiz')),
        ),
      ),
      PlaylistCard(
        title: t('Listen'),
        subtitle: t('Listen pratice'),
        icon: Icon(Icons.headset, color: Colors.white70, size: 48),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PlayerScreen()),
        ),
      ),
      PlaylistCard(
        title: t('About us'),
        subtitle: t('Learn about us'),
        icon: Icon(Icons.info, color: Colors.white70, size: 48),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AboutScreen()),
        ),
      ),
      PlaylistCard(
        title: t('Settings'),
        subtitle: t('Adjust app options'),
        icon: Icon(Icons.settings, color: Colors.white70, size: 48),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SettingsScreen()),
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          const StarFieldBackground(),
          const PlanetWidget(),
          const RocketOrbit(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 34,
                          backgroundImage: AssetImage(
                            'assets/images/avatar.jpg',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi, Space Learner',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                    color: Colors.pinkAccent,
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.purpleAccent,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: LinearProgressIndicator(
                                value: (xp.xp % 100) / 100,
                                backgroundColor: Colors.white12,
                                valueColor: const AlwaysStoppedAnimation(
                                  Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              t('Level ${xp.level} • ${xp.xp} XP'),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SearchScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    t('Topics'),
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = 4;
                      double screenWidth = constraints.maxWidth;

                      if (screenWidth < 800) crossAxisCount = 3;
                      if (screenWidth < 600) crossAxisCount = 2;
                      if (screenWidth < 400) crossAxisCount = 1;

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cards.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 3.2,
                        ),
                        itemBuilder: (context, index) {
                          return AnimatedGridItem(child: cards[index]);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 200, // chiều cao Solar System
                    child: Center(
                      child: Lottie.asset(
                        "assets/lotties/solarsystem.json",
                        repeat: true,
                        fit: BoxFit.contain, // giữ tỉ lệ gốc, không bị zoom
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
