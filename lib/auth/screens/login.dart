import 'package:delivery_app/api/test_api.dart';
import 'package:delivery_app/auth/provider/auth.dart';
import 'package:delivery_app/auth/screens/signup.dart';
import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/home/screens/base.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/images/delivery.png')),
                  ),
                  InputField(
                    validator: validateEmail,
                    controller: _emailController,
                    hint: 'email',
                    icon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    validator: validatePassword,
                    controller: _passwordController,
                    hint: 'password',
                    password: true,
                    icon: const Icon(Icons.lock),
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text('Forgot password?'),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Palette.primaryColor,
                                ))
                          ]),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                      child: AuthButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        showProgress(context, 'logging in .....', true);
                        Provider.of<Authentication>(context, listen: false)
                            .login(context, _emailController.text,
                                _passwordController.text)
                            .then(
                          (value) {
                            setState(() {
                              hideProgress();
                            });
                            if (value != 'failed') {
                              // push(context, BaseScreen());
                              Provider.of<Authentication>(context,
                                      listen: false)
                                  .setAuthState(AuthState.loggedIn);
                            } else {
                              showSnackBar(
                                  context, 'Please check email and password');
                            }
                          },
                        );
                      }
                    },
                    text: 'Login',
                  )),
                  // const SizedBox(height: 50),
                  GestureDetector(
                    onTap: (() {
                      Provider.of<Authentication>(context, listen: false)
                          .setAuthState(AuthState.signup);
                    }),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account? '),
                              Text(
                                'Sign up',
                                style: TextStyle(color: Palette.primaryColor),
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
