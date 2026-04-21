import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learn/features/auth/presentation/pages/sign_in.dart';
import 'package:learn/features/auth/presentation/widgets/auth_field.dart';
import 'package:learn/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => SignUpPage());

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(139, 65, 63, 63),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 65, 63, 63),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up.",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                AuthField(hintText: 'Name', controller: nameController),
                SizedBox(height: 15),
                AuthField(hintText: 'Email', controller: emailController),
                const SizedBox(height: 15),
                AuthField(
                  hintText: "Password",
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 15),

                AuthGradientButton(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    print("Signup button clicked");
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        AuthSignUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          name: nameController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SignInPage.route());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?  ",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
