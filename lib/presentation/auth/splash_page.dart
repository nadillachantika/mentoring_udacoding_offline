import 'package:flutter/material.dart';
import 'package:mentoring_udacoding_offline/core/extensions/build_context_ext.dart';
import 'package:mentoring_udacoding_offline/presentation/auth/login_page.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.pushReplacement(const LoginPage()),
    );
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
