import 'package:flutter/material.dart';
import 'package:mentoring_udacoding_offline/core/extensions/build_context_ext.dart';
import 'package:mentoring_udacoding_offline/data/datasources/auth_local_datasource.dart';
import 'package:mentoring_udacoding_offline/presentation/auth/login_page.dart';
import 'package:mentoring_udacoding_offline/presentation/home/home_page.dart';

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
    return Scaffold(
      body: FutureBuilder(
        future: AuthLocalDataSource().isAuthDataExist(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data! == true) {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const HomePage()),
              );
            } else {
              Future.delayed(
                const Duration(seconds: 2),
                () => context.pushReplacement(const LoginPage()),
              );
            }
          }

          return const Center(
            child: Text("Splash Screen"),
          );
        },
      ),
    );
  }
}
