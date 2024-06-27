import 'package:bloc/bloc.dart';
import 'package:bloc_blog/data/models/res/home_res_model.dart';
import 'package:bloc_blog/data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';
part '../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(_Initial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  Future<HomeResModel?> featchData() async {
    final HomeRepository homeRepository = HomeRepository();
    final data = await homeRepository.getHomeRes();
    return data;
  }
}
