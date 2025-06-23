import 'package:autospa/features/google_signin/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';




class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());


    GoogleSignInAccount? googleUser;
    final SupabaseClient  client = Supabase.instance.client;
  Future<AuthResponse> googleSignIn() async {
    emit(LoginState.loading());
    final webClientId =
        dotenv.env['GOOGLE_WEB_CLIENT_ID']!;

    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(LoginState.failure());
      return AuthResponse();
    }
    final response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    emit(LoginState.success());
    return response;
  }
}
