import 'package:delivery_app/auth/widgets/custom_Button.dart';
import 'package:delivery_app/auth/widgets/custom_fields.dart';
import 'package:delivery_app/util/helper.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
                  controller: _emailController,
                  hint: 'email',
                  icon: const Icon(Icons.mail),
                ),
                const SizedBox(height: 10),
                InputField(
                  controller: _usernameController,
                  hint: 'username',
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
                      if (_formKey.currentState!.validate()) {}
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
