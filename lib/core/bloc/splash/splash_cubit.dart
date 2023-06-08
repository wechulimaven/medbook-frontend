import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injector.dart';
import '../../local_storage/shared_preference_helper.dart';
import '../../repository/user_repository.dart';

part 'splash_state.dart';

class StartUpCubit extends Cubit<SplashPageState> {
  final SharedHelper sharedPreferenceService;
  final PatientRepository userRepository;

  StartUpCubit(
      {required this.sharedPreferenceService, required this.userRepository})
      : super(SplashPageInitial());

  //add initialization logic here if any
  Future<void> checkAuthStatus() async {
    try {
      await inject.allReady();
      // var isSignedIn = await userRepository.isSignedIn();
      emit(const AuthStatus(loggedIn: true));
    } catch (e) {
      Fimber.e(e.toString());
      emit(const AuthStatus(loggedIn: false));
    }
  }
}
