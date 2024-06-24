import 'package:flutter/material.dart';
import 'package:mentoring_udacoding_offline/core/extensions/build_context_ext.dart';
import 'package:mentoring_udacoding_offline/data/datasources/auth_local_datasource.dart';
import 'package:mentoring_udacoding_offline/data/models/auth_response_models.dart';
import 'package:mentoring_udacoding_offline/presentation/auth/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthLocalDataSource _authLocalDataSource =
      AuthLocalDataSource(); // Instance dari AuthLocalDataSource
  AuthResponseModel? _authData; // Variabel untuk menyimpan data auth

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    AuthResponseModel? authData = await _authLocalDataSource.getAuthData();
    setState(() {
      _authData = authData;
    });
  }

    Future<void> _logout() async {
    await _authLocalDataSource.removeAuthData();
    // Navigasi ke halaman login setelah logout
    context.pushReplacement(const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Home Page"),
            const SizedBox(height: 20),
            Text("Email User: ${_authData?.data!.original!.data!.email}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
