import 'package:equatable/equatable.dart';

enum UserDataStatus {
  initial,
  loading,
  success,
  error,
  gpsNull,
  blockList,
  gpsNullForever
}

class UserDataState extends Equatable {
  final UserDataStatus status;
  final List<dynamic> userData;
  final String? errorMessage;

  const UserDataState({
    this.status = UserDataStatus.initial,
    required this.userData,
    this.errorMessage,
  });

  factory UserDataState.initial() {
    return const UserDataState(
      status: UserDataStatus.initial,
      userData: [],
    );
  }

  factory UserDataState.gpsNull() {
    return const UserDataState(
      status: UserDataStatus.gpsNull,
      errorMessage: "no GPS Enabled.",
      userData: [],
    );
  }

  factory UserDataState.gpsNullForever() {
    return const UserDataState(
      status: UserDataStatus.gpsNullForever,
      errorMessage: "no GPS Enabled Forever.",
      userData: [],
    );
  }

  factory UserDataState.blockList() {
    return const UserDataState(
      status: UserDataStatus.blockList,
      errorMessage:
          "Your Ip Address is in either, Hong Kong, Canada, Ukraine, Israel where our services are limited.",
      userData: [],
    );
  }

  factory UserDataState.loading() {
    return const UserDataState(
      status: UserDataStatus.loading,
      userData: [],
    );
  }

  factory UserDataState.success(List<dynamic> userData) {
    return UserDataState(
      status: UserDataStatus.success,
      userData: userData,
    );
  }

  factory UserDataState.error(String errorMessage) {
    return UserDataState(
      status: UserDataStatus.error,
      errorMessage: errorMessage,
      userData: const [],
    );
  }

  @override
  List<Object?> get props => [status, userData, errorMessage];
}
