import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/neon_button.dart';
import '../l10n/app_localizations.dart';
import 'register_screen.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  late AnimationController _starController;

  final List<Offset> stars = List.generate(
    45,
    (i) => Offset(Random().nextDouble(), Random().nextDouble()),
  );

  @override
  void initState() {
    super.initState();
    _starController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..repeat();
  }

  @override
  void dispose() {
    _starController.dispose();
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context).t;
    double screenWidth = MediaQuery.of(context).size.width;

    double boxWidth = screenWidth <= 600
        ? screenWidth * 0.9
        : screenWidth <= 1100
        ? screenWidth * 0.6
        : screenWidth * 0.45;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.45)),
          AnimatedBuilder(
            animation: _starController,
            builder: (_, __) {
              return CustomPaint(
                painter: StarPainter(stars, _starController.value),
                child: Container(),
              );
            },
          ),

          Positioned(
            top: 40,
            right: 30,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.35),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white54),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purpleAccent.withOpacity(0.4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.language, color: Colors.white),
                onSelected: (lang) {
                  context.read<LocaleProvider>().setLocale(Locale(lang));
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: "en", child: Text("English")),
                  PopupMenuItem(value: "vi", child: Text("Tiếng Việt")),
                ],
              ),
            ),
          ),

          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                child: Container(
                  width: boxWidth,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.25),
                      width: 1.2,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "GALAXY LEARNING",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Poppins",
                          letterSpacing: 1.6,
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextField(
                        controller: _userCtrl,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: t("email"),
                          hintStyle: const TextStyle(color: Colors.white70),
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _passCtrl,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: t("password"),
                          hintStyle: const TextStyle(color: Colors.white70),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.white70,
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      NeonButton(
                        text: t("login"),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          t("create new account"),
                          style: TextStyle(
                            color: Colors.purpleAccent.shade100,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// star
class StarPainter extends CustomPainter {
  final List<Offset> stars;
  final double progress;

  StarPainter(this.stars, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.85);
    for (final star in stars) {
      double x = star.dx * size.width + sin(progress * 6 + star.dx * 10) * 4;
      double y = star.dy * size.height + cos(progress * 6 + star.dy * 10) * 4;
      canvas.drawCircle(Offset(x, y), 1.5 + sin(progress * 10) * 0.7, paint);
    }
  }

  @override
  bool shouldRepaint(_) => true;
}
