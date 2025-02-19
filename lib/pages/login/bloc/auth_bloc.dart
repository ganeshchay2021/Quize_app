import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import 'package:quiz_app/data/repository/user_auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserAuthRepository userAuthRepository;
  AuthBloc({required this.userAuthRepository}) : super(AuthInitialState()) {

    //event for signup
    on<SignInEvent>(
      transformer: droppable(),
      (event, emit) async {
        emit(AuthLoadingState());
        final result = await userAuthRepository.signUp(
            name: event.name, email: event.email, password: event.passwrod);
        result.fold(
          (error) => emit(AuthErrorState(errorMsg: error)),
          (_) => emit(
            AuthSuccessState(),
          ),
        );
      },
    );

    //event for login
    on<LoginEvent>(
      transformer: droppable(),
      (event, emit) async {
        emit(AuthLoadingState());
        final result = await userAuthRepository.login(
            email: event.email, password: event.passwrod);
        result.fold(
          (error) => emit(AuthErrorState(errorMsg: error)),
          (_) => emit(
            AuthSuccessState(),
          ),
        );
      },
    );
  }
}
