import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextEvent>((event, emit) => {
          if (event.emailValue == " " &&
              EmailValidator.validate(event.emailValue) == false)
            {emit(SignInErrorState("Please enter a valid address"))}
          else if (event.passwordValue.length < 8)
            {emit(SignInErrorState("Please enter a valid adrees"))}
          else
            {emit(SignInInvalidState())}
        });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
