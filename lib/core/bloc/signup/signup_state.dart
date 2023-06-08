part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupErrorState extends SignupState {
  final String message;

  const SignupErrorState(this.message);
}

class SignUpSuccessState extends SignupState {
  final PatientsModel? user;

  const SignUpSuccessState(this.user);
}
