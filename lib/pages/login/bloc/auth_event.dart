part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String passwrod;

  const LoginEvent({
    required this.email,
    required this.passwrod,
  });

  @override
  List<Object> get props => [email, passwrod];
}

class SignInEvent extends AuthEvent {
  final String name;
  final String email;
  final String passwrod;

  const SignInEvent({
    required this.name,
    required this.email,
    required this.passwrod,
  });

  @override
  List<Object> get props => [name, email, passwrod];
}
