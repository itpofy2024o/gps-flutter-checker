import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:egofly/common/data/common_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataState.initial());

  Future<void> fetchLoca() async {
    try {
      emit(UserDataState.loading());
      final serviceStatus = await Geolocator.isLocationServiceEnabled();
      print(serviceStatus);
      final permission = await Geolocator.checkPermission();
      print(permission);
      if (serviceStatus == false) {
        final requestedPermission = await Geolocator.requestPermission();
        if (requestedPermission == LocationPermission.denied) {
          emit(UserDataState.gpsNull());
        } else if (requestedPermission == LocationPermission.deniedForever) {
          emit(UserDataState.gpsNullForever());
        } else {
          final position = await Geolocator.getCurrentPosition();
          if (isLocationInBlockListRange(
              position.latitude, position.longitude)) {
            print(position.latitude);
            print(position.longitude);
            emit(UserDataState.blockList());
          } else {
            print(position.latitude);
            print(position.longitude);
            emit(
                UserDataState.success([position.latitude, position.longitude]));
          }
        }
      }
      final position = await Geolocator.getCurrentPosition();
      if (isLocationInBlockListRange(position.latitude, position.longitude)) {
        print(position.latitude);
        print(position.longitude);
        emit(UserDataState.blockList());
      } else {
        print(position.latitude);
        print(position.longitude);
        emit(UserDataState.success([position.latitude, position.longitude]));
      }
    } catch (e) {
      emit(UserDataState.error(e.toString()));
    }
  }

  bool isLocationInBlockListRange(double latitude, double longitude) {
    late bool blr = false;
    if (latitude >= 22.08 &&
        latitude <= 22.35 &&
        longitude >= 113.49 &&
        longitude <= 114.31) {
      print("hk");
      blr = true;
    } else if (latitude >= 22.0 &&
        latitude <= 32.0 &&
        longitude >= 24.0 &&
        longitude <= 37.0) {
      print("egypt");
      blr = true;
    } else if (latitude >= 44.0 &&
        latitude <= 53.0 &&
        longitude >= 22.0 &&
        longitude <= 41.0) {
      print("ukraine");
      blr = true;
    }
    return blr;
  }
}
