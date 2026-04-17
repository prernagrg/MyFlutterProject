import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/bloc/password_bloc.dart';

class PasswordToggle extends StatelessWidget {
  const PasswordToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Password Toggle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: BlocBuilder<PasswordBloc, PasswordState>(
          builder: (context, state) {
            return TextField(
              obscureText: state.isHidden,
              decoration: InputDecoration(
                labelText: "Password",
                border: const OutlineInputBorder(),

                suffixIcon: IconButton(
                  onPressed: () {
                    context.read<PasswordBloc>().add(
                      TogglePasswordVisibility(),
                    );
                  },
                  icon: Icon(
                    state.isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
