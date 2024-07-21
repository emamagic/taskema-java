import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskema/model/dto/user_register_username_password_request.dart';
import 'package:taskema/module/login/login_cubit.dart';
import 'package:taskema/module/login/login_state.dart';

class UsernamePasswordScreen extends StatelessWidget {
  UsernamePasswordScreen({super.key});
  static const path = "/login/usernamepassword";

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            switch (state) {
              case UsernameAndPasswordSuccess success:
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(success.message)));
                }
              case UsernameAndPasswordFailed _:
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text("faild")));
                }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24.0),
                Builder(
                  builder: (ctx) {
                    return ElevatedButton(
                      onPressed: () => ctx
                          .read<LoginCubit>()
                          .registerByUsernamePassword(
                              UserRegisterUsernamePasswordRequest(
                                  username: _usernameController.text,
                                  password: _passwordController.text)),
                      child: const Text('Submit'),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
