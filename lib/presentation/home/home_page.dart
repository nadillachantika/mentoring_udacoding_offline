import 'package:flutter/material.dart';
import 'package:mentoring_udacoding_offline/core/extensions/build_context_ext.dart';
import 'package:mentoring_udacoding_offline/data/datasources/auth_local_datasource.dart';
import 'package:mentoring_udacoding_offline/data/models/auth_response_models.dart';
import 'package:mentoring_udacoding_offline/data/models/profile_response_models.dart';
import 'package:mentoring_udacoding_offline/presentation/auth/login_page.dart';
import 'package:mentoring_udacoding_offline/presentation/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource(); // Instance dari AuthLocalDataSource
  GetProfileResponseModel? _profileData; // Variabel untuk menyimpan data profil
  bool _isLoading = false; // Variabel untuk menunjukkan status loading

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      AuthResponseModel? authData = await _authLocalDataSource.getAuthData();
      if (authData?.token != null) {
        GetProfileResponseModel? profileData = await _authLocalDataSource.getProfileUser(authData!.token!);
        setState(() {
          _profileData = profileData;
        });
      }
    } catch (e) {
      print('Failed to load user profile: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshData() async {
    await _loadProfile();
  }

  Future<void> _logout() async {
    await _authLocalDataSource.removeAuthData();
    context.pushReplacement(const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Home Page"),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : Text("User name: ${_profileData?.user?.name ?? 'No name'}"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.push( ProfilePage());
                  },
                  child: const Text("Profile Page"),
                ),
                ElevatedButton(
                  onPressed: _logout,
                  child: const Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
