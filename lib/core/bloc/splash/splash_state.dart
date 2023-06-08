part of 'splash_cubit.dart';

abstract class SplashPageState extends Equatable {
  const SplashPageState();

  @override
  List<Object> get props => [];
}

class SplashPageInitial extends SplashPageState {}

class AuthStatus extends SplashPageState {
  final bool loggedIn;

  const AuthStatus({
    this.loggedIn = false,
  });

  @override
  List<Object> get props => [loggedIn];
}
