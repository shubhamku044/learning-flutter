import 'package:first_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/login.png',
                  fit: BoxFit.contain,
                  height: 400,
                  width: 500,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Welcome $name',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter username', labelText: 'Username'),
                      onChanged: (val) {
                        name = val;
                        setState(() {});
                      },
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Username cannot be empty';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter password', labelText: 'Password'),
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (val.length <= 8) {
                          return 'Password length should be greater or equal to 8';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 30 : 8),
                      color: Colors.teal,
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 60 : 180,
                          height: 60,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
