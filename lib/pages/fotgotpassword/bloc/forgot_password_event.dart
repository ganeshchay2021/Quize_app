part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class SendResetPassLinkToEmail extends ForgotPasswordEvent {
  final String email;

  const SendResetPassLinkToEmail({required this.email});
}