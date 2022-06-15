import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {}

class AuthLoggedIn extends AuthState {
  final UserCredential data;

  AuthLoggedIn({required this.data});

  @override
  List<Object?> get props => [];
}

class AuthLoggedOut extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}
