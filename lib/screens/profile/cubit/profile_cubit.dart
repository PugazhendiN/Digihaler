import 'package:bloc/bloc.dart';
import 'package:inhaler_mobile/common/shared_preferences.dart';
import 'package:inhaler_mobile/models/user_detail.dart';
import 'package:inhaler_mobile/network/user_service.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  UserService service = UserService();
  UserDetail? userDetail;
  ProfileCubit() : super(ProfileInitial());

  void fetchUserDetails() async {
    final uid =
        await SharedPreferencesSingleton().getUidFromSharedPreferences();
    userDetail = await service.fetchUserInfo(uid ?? 0);
    print(userDetail);
    emit(ProfileSuccess());
  }

  void logout() {
    SharedPreferencesSingleton().clearSharedPreferences();
    emit(ProfileLogout());
  }
}
