import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '../providers/xp_provider.dart';

class XPScreen extends StatelessWidget {
  const XPScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final xp = Provider.of<XPProvider>(context);
    final cur = xp.xp % 100;
    final percent = cur / 100;
    return Scaffold(
      appBar: AppBar(title: const Text('XP & Achievements')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Hero(
              tag: 'avatarHero',
              child: CircleAvatar(
                radius: 46,
                backgroundImage: const AssetImage('assets/images/avatar.png'),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Level ${xp.level}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            CircularPercentIndicator(
              radius: 100.0,
              lineWidth: 12.0,
              percent: percent,
              center: Text(
                '$cur / 100 XP',
                style: const TextStyle(color: Colors.white),
              ),
              progressColor: Colors.amberAccent,
              backgroundColor: Colors.white12,
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Achievements',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _achCard('First Steps', 'Complete first flashcard', true),
                  _achCard('Quiz Novice', 'Finish first quiz', xp.xp >= 50),
                  _achCard('Apprentice', 'Gain 100 XP', xp.xp >= 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _achCard(String title, String desc, bool unlocked) {
    return Card(
      color: unlocked ? Colors.white10 : Colors.white12,
      child: ListTile(
        leading: Icon(
          unlocked ? Icons.star : Icons.lock,
          color: unlocked ? Colors.amber : Colors.white30,
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(desc, style: const TextStyle(color: Colors.white70)),
        trailing: unlocked
            ? const Text('Unlocked', style: TextStyle(color: Colors.amber))
            : const Text('Locked', style: TextStyle(color: Colors.white30)),
      ),
    );
  }
}
