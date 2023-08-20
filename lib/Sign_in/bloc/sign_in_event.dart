part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInTextEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent {
  final String email;
  final String password;
  SignInSubmittedEvent(this.email, this.password);
}

