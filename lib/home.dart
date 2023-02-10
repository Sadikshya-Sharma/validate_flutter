import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passController = TextEditingController();

  bool _hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      }
                      if (!value.contains('@')) {
                        return 'Please Enter valid email';
                      }
                    },
                    decoration: InputDecoration(hintText: 'Enter Email'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                    },
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                        hintText: 'Enter Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          icon: (_hidePassword)
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined),
                        )),
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {
                _formKey.currentState!.validate();
                if (_emailController.text.isNotEmpty) {
                  print('Value is Available ${_emailController.text.trim()}');
                }
              },
              child: Text('Submit'))
        ]),
      ),
    );
  }
}
