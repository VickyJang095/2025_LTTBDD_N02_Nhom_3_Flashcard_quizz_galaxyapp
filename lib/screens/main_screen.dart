import 'package:flutter/material.dart';
import 'package:my_learning_app/screens/login_screen.dart';
import 'splash_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Nếu đang show SplashScreen → hiển thị Splash
    if (_showSplash) return const SplashScreen();

    // Nếu SplashScreen xong → hiển thị HomeScreen
    return LoginScreen();
  }
}
