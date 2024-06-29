import 'dart:convert';

import 'package:mentoring_udacoding_offline/core/constant/variables.dart';
import 'package:mentoring_udacoding_offline/data/models/auth_response_models.dart';
import 'package:mentoring_udacoding_offline/data/models/profile_response_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', authResponseModel.toRawJson());
  }

  Future<AuthResponseModel?> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authData = prefs.getString('auth_data');

    return AuthResponseModel.fromRawJson(authData!);
  }

  Future<bool> isAuthDataExist() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_data');
  }

  // remove preference
   Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

   Future<GetProfileResponseModel?> getProfileUser(String token) async {
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/get-profile-user'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return GetProfileResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
