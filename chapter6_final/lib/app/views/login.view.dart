import 'package:flutter/material.dart';
import 'package:flutter_academy/app/view_models/auth.vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            "Login",
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20.0),
          TextField(
            controller: _email,
            decoration: InputDecoration(labelText: "enter email"),
          ),
          TextField(
            controller: _password,
            decoration: InputDecoration(labelText: "enter password"),
            obscureText: true,
          ),
          const SizedBox(height: 20.0),
          Consumer(builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                if (ref
                    .read(authVM)
                    .login(email: _email.text, password: _password.text)) {
                  //logged in
                } else {
                  // error
                  debugPrint(ref.read(authVM).error);
                }
              },
              child: Text("Login"),
            );
          })
        ],
      ),
    );
  }
}
