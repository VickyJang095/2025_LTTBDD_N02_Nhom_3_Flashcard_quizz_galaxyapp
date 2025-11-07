import 'package:flutter/material.dart';
import '../models/vocab.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/xp_provider.dart';

class QuizScreen extends StatefulWidget {
  final List<Vocab> list;
  final String topic;
  const QuizScreen({super.key, required this.list, required this.topic});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int idx = 0;
  int score = 0;
  bool answered = false;

  void select(String choice) {
    if (answered) return;
    setState(() {
      answered = true;
      if (choice == widget.list[idx].vi) score++;
    });
  }

  void next() {
    if (idx < widget.list.length - 1) {
      setState(() {
        idx++;
        answered = false;
      });
    } else {
      final t = AppLocalizations.of(context).t;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(t('score')),
          content: Text('$score / ${widget.list.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      Provider.of<XPProvider>(context, listen: false).addXP(score * 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.list[idx];
    final choices = List<String>.from(item.choices)..shuffle();
    final t = AppLocalizations.of(context).t;
    return Scaffold(
      appBar: AppBar(title: Text('${t('quiz')} • ${widget.topic}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Q${idx + 1}. ${item.en}',
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ...choices.map(
              (c) => Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: () => select(c),
                  child: Text(c),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(onPressed: next, child: Text(t('next'))),
          ],
        ),
      ),
    );
  }
}
