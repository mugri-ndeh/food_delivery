import 'package:delivery_app/auth/screens/login.dart';
import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/home/screens/base.dart';
import 'package:delivery_app/models/customer.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'CM';
  String? locale;
  final TextEditingController _controller = TextEditingController();
  String number = '';

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
                    validator: validateName,
                    controller: _userNameController,
                    hint: 'username',
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 8),

                  InputField(
                    validator: validateName,
                    controller: _firstNameController,
                    hint: 'firstname',
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 8),

                  InputField(
                    validator: validateName,
                    controller: _lastNameController,
                    hint: 'lastname',
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 8),

                  InputField(
                    controller: _emailController,
                    hint: 'email',
                    icon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 8),
                  IntlPhoneField(
                    dropdownIcon:
                        Icon(Icons.arrow_drop_down, color: Palette.buttonColor),
                    controller: _controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    dropdownIconPosition: IconPosition.leading,
                    initialCountryCode: initialCountry,
                    pickerDialogStyle: PickerDialogStyle(),
                    decoration: InputDecoration(
                      // hintText: 'Phone Number',
                      labelText: 'Phone Number',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: Palette.primaryColor.withOpacity(0.3),
                              width: 2.0)),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.buttonColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Palette.primaryColor.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                      setState(() {
                        number = phone.completeNumber;
                      });
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                  ),
                  const SizedBox(height: 10),
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
                      Customer user = Customer();

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
                    onTap: () {},
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account? '),
                              Text(
                                'Login',
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
