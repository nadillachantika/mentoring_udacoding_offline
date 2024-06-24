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
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();

  @override
  void initState() {
    super.initState();
    _checkAuthData();
  }

  Future<void> _checkAuthData() async{
     bool isAuthExist = await _authLocalDataSource.isAuthDataExist();
    if (isAuthExist) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }



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
