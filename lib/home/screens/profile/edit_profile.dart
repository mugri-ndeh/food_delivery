import 'package:delivery_app/api/test_api.dart';
import 'package:delivery_app/auth/provider/auth.dart';
import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/models/customer.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String initialCountry = 'CM';
  String? locale;
  final TextEditingController _controller = TextEditingController();
  String number = '';
  late Authentication auth;
  late Customer user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = Provider.of<Authentication>(context, listen: false);
    user = auth.loggedUser!;
    _usernameController.text = user.username;
    _firstNameController.text = user.firstname;
    _lastNameController.text = user.lastname;
    _emailController.text = user.email;
    _controller.text = user.phonenumber.replaceAll('+237', '').trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.buttonColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Edit profile'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/illustration-1.png',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InputField(
                  validator: validateName,
                  controller: _usernameController,
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
                  validator: validateEmail,
                  controller: _emailController,
                  hint: 'email',
                  icon: const Icon(Icons.mail),
                ),
                const SizedBox(height: 20),
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
                Center(
                  child: AuthButton(
                    text: 'Save data',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Customer user = auth.loggedUser!;
                        user.username = _usernameController.text;
                        user.firstname = _firstNameController.text;
                        user.lastname = _lastNameController.text;
                        user.email = _emailController.text;
                        user.phonenumber = number;
                        showProgress(context, 'Saving info...', true);
                        TestApi.editProfile(user).then((value) {
                          auth.returnUser(user.id);
                          hideProgress();
                          showAlertDialog(context, 'Success',
                              'Details updated successfully');
                        });
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
