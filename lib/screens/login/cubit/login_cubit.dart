import 'package:bloc/bloc.dart';
import 'package:inhaler_mobile/common/shared_preferences.dart';
import 'package:inhaler_mobile/network/auth_service.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthService authService;

  LoginCubit(this.authService) : super(LoginInitial());

  void login(String username, String password) async {
    try {
      final response = await authService.login(username, password);
      // final authToken = responseData['auth_token'];
      final userId = response['user_id'];
      SharedPreferencesSingleton().storeUidInSharedPreferences(userId);
      emit(LoginSuccess());
    } catch (e) {
      print(e);
      emit(LoginFailure());
    }
  }
}
