part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class SendOtpToEmail extends ForgotPasswordEvent {
  final String email;

  const SendOtpToEmail({required this.email});
}
