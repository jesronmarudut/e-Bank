import 'dart:math';

import 'package:bank/models/sign_in_form_model.dart';
import 'package:bank/models/signup_form_model.dart';
import 'package:bank/models/user_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthService().checkEmail(event.email);
          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah terpakai'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

// ? REGISTER
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

// ? LOGIN
      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
