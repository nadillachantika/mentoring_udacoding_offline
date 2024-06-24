import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoring_udacoding_offline/core/extensions/build_context_ext.dart';
import 'package:mentoring_udacoding_offline/data/datasources/auth_local_datasource.dart';
import 'package:mentoring_udacoding_offline/presentation/auth/bloc/login_bloc.dart';
import 'package:mentoring_udacoding_offline/presentation/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: emailController,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              controller: passwordController,
            ),
            const SizedBox(height: 20),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: (data) {

                    // save data auth with shared preferences
                    AuthLocalDataSource().saveAuthData(data);
                
                    context.pushReplacement(const HomePage());
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );
                  },
                );
                
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginEvent.login(emailController.text,
                                      passwordController.text),
                                );
                          },
                          child: const Text('Login'));
                    },
                    loading: () => const CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
