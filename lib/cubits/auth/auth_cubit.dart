import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_inventory/cubits/auth/auth_state.dart';
import 'package:fruits_inventory/repositories/auth.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({
    required this.repository,
  }) : super(AuthLoggedOut());

  void signIn({
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      emit(AuthLoading());
      final data = await repository.signIn();
      emit(AuthLoggedIn(data: data));
      onSuccess();
    } catch (_) {
      emit(AuthLoggedOut());
      onFailed();
    }
  }
}
