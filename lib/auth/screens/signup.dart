import 'package:delivery_app/auth/screens/login.dart';
import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/home/screens/base.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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
                    'Create account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/images/deliver.png')),
                  ),
                  InputField(
                    controller: _userNameController,
                    hint: 'username',
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 8),

                  InputField(
                    controller: _emailController,
                    hint: 'email',
                    icon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    controller: _passwordController,
                    hint: 'password',
                    password: true,
                    icon: const Icon(Icons.lock),
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    controller: _confirmPasswordController,
                    hint: 'confirm password',
                    password: true,
                    icon: const Icon(Icons.lock),
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 30),
                  Center(
                      child: AuthButton(
                    onTap: () {
                      // push(context, Completeprofile());
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => BaseScreen()));
                      // }
                    },
                    text: 'Sign Up',
                  )),
                  // const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account? '),
                              Text(
                                'Login',
                                style: TextStyle(color: Palette.primaryGreen),
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
