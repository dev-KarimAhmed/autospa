import 'dart:developer';

import 'package:autospa/features/home/logic/cubit/logout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutState.initial());

  final SupabaseClient client = Supabase.instance.client;


  Future<void> logout() async {
    emit(LogoutState.loading());
    try {
      await client.auth.signOut();
      emit(LogoutState.success());
    } catch (e) {
      log(e.toString());
      emit(LogoutState.failure());
    }
  }
}
