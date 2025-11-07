import 'package:flutter/material.dart';
import '../models/vocab.dart';
import '../widgets/flashcard_widget.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/xp_provider.dart';
import 'dart:ui';

class FlashcardScreen extends StatefulWidget {
  final List<Vocab> list;
  final String topic;

  const FlashcardScreen({super.key, required this.list, required this.topic});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {
  int index = 0;
  bool finished = false;

  void next(XPProvider xp) {
    if (index < widget.list.length - 1) {
      setState(() => index++);
    } else {
      if (!finished) {
        finished = true;
        xp.addXP(50);
        showCompleteDialog();
      }
    }
  }

  void prev() {
    if (index > 0) setState(() => index--);
  }

  void showCompleteDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Completed!", style: TextStyle(color: Colors.white)),
        content: const Text(
          "You finished this topic.\n+50 XP!!",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK", style: TextStyle(color: Colors.pinkAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    final xp = Provider.of<XPProvider>(context, listen: false);
    final item = widget.list[index];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('${t('learn')} • ${widget.topic}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // ✅ Background image
          Positioned.fill(
            child: Image.asset(
              "assets/images/background2.jpg", // đổi path ảnh của bạn
              fit: BoxFit.cover,
            ),
          ),

          // ✅ Gradient overlay cho dễ nhìn text
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.2),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // ✅ Main UI content
          Column(
            children: [
              const SizedBox(height: 100),

              Hero(
                tag: 'cardHero',
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.white.withOpacity(0.05),
                        child: FlashcardWidget(front: item.en, back: item.vi),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                '${index + 1}/${widget.list.length}',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: (index + 1) / widget.list.length,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation(Colors.pinkAccent),
                  ),
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _circleBtn(Icons.arrow_back, prev),
                    const SizedBox(width: 25),
                    _circleBtn(Icons.arrow_forward, () => next(xp)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.pinkAccent, width: 2),
          color: Colors.white.withOpacity(0.05),
          boxShadow: [
            BoxShadow(
              color: Colors.pinkAccent.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
