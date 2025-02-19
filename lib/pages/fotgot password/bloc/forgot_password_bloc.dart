// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:quiz_app/data/repository/reset_password_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ResetPasswordRepository resetPasswordRepository;
  ForgotPasswordBloc({required this.resetPasswordRepository})
      : super(ForgotPasswordInitialState()) {
    on<SendOtpToEmail>((event, emit) async {
      emit(ForgotPasswordLoadingState());
      final result = await resetPasswordRepository.sentOtp(email: event.email);
      result.fold(
        (error) => emit(ForgotPasswordErrorState(errorMsg: error)),
        (data) => emit(
          ForgotPasswordSuccessState(),
        ),
      );
    });
  }
}
