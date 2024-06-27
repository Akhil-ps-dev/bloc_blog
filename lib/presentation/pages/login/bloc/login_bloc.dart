import 'package:bloc/bloc.dart';
import 'package:bloc_blog/data/models/req/login_req_model.dart';
import 'package:bloc_blog/data/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';
part '../login_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(_Initial()) {
    on<_OnLoginClicked>((event, emit) async {
      emit(const _Loading());
      LoginRepository loginRepository = LoginRepository();
      final result = await loginRepository.login(LoginReqModel(
        email: event.email,
        password: event.password,
      ));
      if (result != null && result.error == null) {
        emit(const _LoginSuccess());
      } else {
        emit(_LoginFail(error: result?.message ?? "Something went wrong"));
      }
    });
  }
}
