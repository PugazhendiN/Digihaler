import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'available_doctors_state.dart';

class AvailableDoctorsCubit extends Cubit<AvailableDoctorsState> {
  AvailableDoctorsCubit() : super(AvailableDoctorsInitial());
}
