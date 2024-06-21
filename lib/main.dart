import 'package:flutter/material.dart';
import 'package:mentoring_udacoding_offline/data/datasources/auth_remote_datasource.dart';
import 'package:mentoring_udacoding_offline/presentation/auth/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/auth/bloc/login_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginBloc(AuthRemoteDatasource())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
      ),
    );
  }
}
