import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';

import '../../data/requests_modelling/user_registration_request_model.dart';
import '../../repository/user_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final PatientRepository userRepository;

  SignupCubit({required this.userRepository}) : super(SignupInitial());

  void registerUser(PatientsModel userRequestModel) async {
    emit(SignupLoadingState());
    try {
      var user = await userRepository.registerUser(userRequestModel);
      emit(SignUpSuccessState(user));
    } catch (e) {
      Fimber.e("SIGNUP EXCEPTION $e");
      emit(SignupErrorState('$e'));
    }
  }
}
