import 'package:flutter/material.dart';
import '../data/vocab_data.dart';
import 'flashcard_screen.dart';
import 'quiz_screen.dart';

class TopicScreen extends StatelessWidget {
  final String mode;
  const TopicScreen({super.key, required this.mode});
  @override
  Widget build(BuildContext context) {
    final topics = vocabList.map((e) => e.topic).toSet().toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Topics')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, i) {
          final topic = topics[i];
          final list = vocabList.where((v) => v.topic == topic).toList();
          return ListTile(
            title: Text(topic),
            onTap: () {
              if (mode == 'flashcard') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FlashcardScreen(list: list, topic: topic),
                  ),
                );
              } else if (mode == 'quiz') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(list: list, topic: topic),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
