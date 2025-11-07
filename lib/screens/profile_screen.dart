import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/xp_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final xp = Provider.of<XPProvider>(context);
    final cur = xp.xp % 100;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(
              radius: 56,
              backgroundImage: const AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(height: 12),
            Text(
              'Space Learner',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Level ${xp.level} • ${xp.xp} XP',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: cur / 100,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.star, color: Colors.amber),
                    title: const Text('First Steps'),
                    subtitle: const Text('Complete first card'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.check, color: Colors.green),
                    title: const Text('Quiz Novice'),
                    subtitle: const Text('Finish quiz'),
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
