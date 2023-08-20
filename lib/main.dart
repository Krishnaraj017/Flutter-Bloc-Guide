import 'package:authentification/Sign_in/authpage.dart';
import 'package:authentification/Sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authpage(),
    );
  }
}

class Authpage extends StatelessWidget {
  const Authpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Center(
              child: Text(
            "Auth page",
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => SignInBloc(),
                            child: SignInScreen(),
                          )));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              ),
              elevation: MaterialStateProperty.all<double>(5.0),
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16.0),
              ),
            ),
            child: const Text('Sign in with email'),
          )
        ],
      ),
    );
  }
}
