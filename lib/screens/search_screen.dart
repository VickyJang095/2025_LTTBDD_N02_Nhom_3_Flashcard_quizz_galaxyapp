import 'package:flutter/material.dart';
import '../data/vocab_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String q = '';
  @override
  Widget build(BuildContext context) {
    final results = vocabList
        .where(
          (v) =>
              v.en.toLowerCase().contains(q.toLowerCase()) ||
              v.vi.toLowerCase().contains(q.toLowerCase()),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              onChanged: (v) => setState(() => q = v),
              decoration: const InputDecoration(hintText: 'Search'),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (_, i) {
                  final it = results[i];
                  return ListTile(title: Text(it.en), subtitle: Text(it.vi));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
