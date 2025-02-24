// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final Uint8List? profileImage;

  const SignInEvent({
    required this.name,
    required this.email,
    required this.passwrod,
    this.profileImage,
  });

  @override
  List<Object> get props => [name, email, passwrod];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
