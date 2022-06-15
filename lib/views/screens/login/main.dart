import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/auth/auth_cubit.dart';
import 'package:fruits_inventory/cubits/auth/auth_state.dart';
import 'package:fruits_inventory/views/screens/home/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (mounted) {
        _signIn();
      }
    });
  }

  void _signIn() => context
      .read<AuthCubit>()
      .signIn(onSuccess: _onSuccess, onFailed: _onFailed);

  void _onSuccess() => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

  void _onFailed() => ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("Failed Login")));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Login"),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          if (authState is AuthLoggedOut) {
            return Center(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: ElevatedButton(
                  onPressed: _signIn,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
