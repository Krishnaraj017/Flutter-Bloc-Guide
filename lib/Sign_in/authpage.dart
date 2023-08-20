import 'package:authentification/Sign_in/bloc/sign_in_bloc.dart';
import 'package:authentification/Sign_in/bloc/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(children: [
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is SignInErrorState) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 22),
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: emailController,
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(SignInTextEvent(
                  emailController.text, passwordController.text));
            },
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(
            height: 12,
          ),
          TextField(
            controller: passwordController,
            onChanged: (val) {
              BlocProvider.of<SignInBloc>(context).add(SignInTextEvent(
                  emailController.text, passwordController.text));
            },
            decoration: const InputDecoration(hintText: "Enter password"),
          ),
          const SizedBox(
            height: 12,
          ),
          BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              return BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return const CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  }
                  return CupertinoButton(
                      color: (state is SignInInvalidState)
                          ? Colors.red
                          : Colors.blue, // Example color
                      // minSize: 40.0, // Example minimum size
                      // padding: const EdgeInsets.all(12.0), // Example padding
                      child: const Text('Click Me'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SuccessAuth()));
                      });
                },
              );
            },
          ),
        ]),
      ),
    );
  }
}
