import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mentoring_udacoding_offline/data/datasources/auth_local_datasource.dart';
import 'package:mentoring_udacoding_offline/data/models/auth_response_models.dart';
import 'package:mentoring_udacoding_offline/data/models/profile_response_models.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthLocalDataSource _authLocalDataSource =
      AuthLocalDataSource(); // Instance dari AuthLocalDataSource
  File? _image;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  GetProfileResponseModel? _profileData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  // Fungsi untuk memuat profil pengguna
  Future<void> _loadProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      AuthResponseModel? authData = await _authLocalDataSource.getAuthData();
      if (authData?.token != null) {
        GetProfileResponseModel? profileData = await _authLocalDataSource
            .getProfileUser(authData!.token!);
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

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Fungsi untuk menyimpan perubahan profil ke backend
  // Future<void> _saveChanges() async {
  //   String apiUrl =
  //       'http://your-api-url/profile/update'; // Ganti dengan URL API Anda

  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
  //     request.fields['email'] = _emailController.text.trim();
  //     request.fields['name'] = _nameController.text.trim();

  //     if (_image != null) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'image_url',
  //         _image!.path,
  //         contentType: MediaType(
  //             'image', 'jpeg'), // Sesuaikan dengan tipe gambar yang diunggah
  //       ));
  //     }

  //     var response = await request.send();

  //     if (response.statusCode == 200) {
  //       // Berhasil menyimpan, tambahkan logika jika perlu
  //       print('Profile updated successfully');
  //       _loadProfile(); // Memuat ulang profil setelah penyimpanan berhasil
  //     } else {
  //       // Gagal menyimpan, tangani respons error dari API
  //       print('Failed to update profile: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Tangani kesalahan jaringan atau lainnya
  //     print('Error updating profile: $e');
  //   }
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Tampilkan gambar profil saat ini atau placeholder jika tidak ada
                    _image == null
                        ? _profileData?.user!.profileImage != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(_profileData!.user!.profileImage!),
                              )
                            : CircleAvatar(
                                radius: 50,
                                child: Icon(Icons.person, size: 50),
                              )
                        : CircleAvatar(
                            radius: 50,
                            backgroundImage: FileImage(_image!),
                          ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        // Pilih gambar dari galeri
                        _pickImage(ImageSource.gallery);
                      },
                      child: const Text('Pilih Gambar'),
                    ),

                    // Textfield untuk email dan nama
                    const SizedBox(height: 20),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),

                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Simpan perubahan profil ke backend
                        // _saveChanges();
                      },
                      child: const Text('Simpan Perubahan'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
