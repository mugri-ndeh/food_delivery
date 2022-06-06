// import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/home/screens/search/search.dart';
import 'package:delivery_app/util/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

String? validateName(String? value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return "Name is required";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "Name must be a-z and A-Z";
  } else if (value!.length > 8) {
    return "Name cannot be more than 8 characaters";
  }
  return null;
}

String? validateGivenNames(String? value, bool first) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return first ? "first name is required" : "last name is required";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "Name must be a-z and A-Z";
  } else if (value!.length > 20) {
    return "Name cannot be more than 8 characaters";
  }

  return null;
}

String? validateDob(String? value) {
  if (value?.isEmpty ?? true) {
    return "Date of birth is required";
  }

  return null;
}

String? validateMobile(String? value) {
  String pattern = r'(^\+?[0-9]*$)';
  RegExp regExp = RegExp(pattern);
  if (value?.isEmpty ?? true) {
    return "Mobile phone number is required";
  } else if (!regExp.hasMatch(value ?? '')) {
    return "Mobile phone number must contain only digits";
  }
  return null;
}

String? validatePassword(String? value) {
  if ((value?.length ?? 0) < 6) {
    return 'Password must be more than 5 characters';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (password != confirmPassword) {
    return 'Password doesn\'t match';
  } else if (confirmPassword?.isEmpty ?? true) {
    return 'Confirm password is required';
  } else {
    return null;
  }
}

// helper method to show progress
late ProgressDialog progressDialog;

showProgress(BuildContext context, String message, bool isDismissible) async {
  progressDialog = ProgressDialog(context,
      type: ProgressDialogType.Normal, isDismissible: isDismissible);
  progressDialog.style(
      message: message,
      borderRadius: 10.0,
      backgroundColor: Palette.primaryColor,
      progressWidget: Container(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Palette.primaryColor),
        ),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      messageTextStyle: const TextStyle(
          color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w600));
  await progressDialog.show();
}

updateProgress(String message) {
  progressDialog.update(message: message);
}

hideProgress() async {
  await progressDialog.hide();
}

//helper method to show alert dialog
showAlertDialog(BuildContext context, String title, String content) {
  // set up the AlertDialog
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

pushReplacement(BuildContext context, Widget destination) {
  Navigator.of(context)
      .pushReplacement(CupertinoPageRoute(builder: (context) => destination));
}

push(BuildContext context, Widget destination) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => destination));
}

pushAndRemoveUntil(BuildContext context, Widget destination, bool predict) {
  Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => destination),
      (Route<dynamic> route) => predict);
}

// Widget displayCircleImage(String picUrl, double size, hasBorder) =>
//     CachedNetworkImage(
//         imageBuilder: (context, imageProvider) =>
//             _getCircularImageProvider(imageProvider, size, false),
//         imageUrl: picUrl,
//         placeholder: (context, url) =>
//             _getPlaceholderOrErrorImage(size, hasBorder),
//         errorWidget: (context, url, error) =>
//             _getPlaceholderOrErrorImage(size, hasBorder));

Widget _getPlaceholderOrErrorImage(double size, hasBorder) => Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        border: Border.all(
          color: Colors.white,
          width: hasBorder ? 2.0 : 0.0,
        ),
      ),
      child: ClipOval(
          child: Image.asset(
        'assets/images/placeholder.jpg',
        fit: BoxFit.cover,
        height: size,
        width: size,
      )),
    );

Widget _getCircularImageProvider(
    ImageProvider provider, double size, bool hasBorder) {
  return ClipOval(
      child: Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        border: Border.all(
          color: Colors.white,
          style: hasBorder ? BorderStyle.solid : BorderStyle.none,
          width: 1.0,
        ),
        image: DecorationImage(
          image: provider,
          fit: BoxFit.cover,
        )),
  ));
}

bool isDarkMode(BuildContext context) {
  if (Theme.of(context).brightness == Brightness.light) {
    return false;
  } else {
    return true;
  }
}

showCustomSearch(BuildContext context, Size size, bool pickup) {
  showModalBottomSheet(
    elevation: 0,
    isDismissible: false,
    enableDrag: false,
    isScrollControlled: true,
    context: context,
    builder: (context) => SearchScreen(),
  );
}

// InputDecoration getInputDecoration(
//     {required String hint, required bool darkMode, required Color errorColor}) {
//   return InputDecoration(
//     contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//     fillColor: darkMode ? Palette.primaryGreen: Colors.white,
//     hintText: hint,
//     labelText: hint,
//     hintMaxLines: 10,
//     focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         borderSide: const BorderSide(color: , width: 2.0)),
//     errorBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: errorColor),
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: errorColor),
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.grey.shade200),
//       borderRadius: BorderRadius.circular(8.0),
//     ),
//   );
// }

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}

Widget imgplace(
    {required BuildContext context,
    required double height,
    required double width}) {
  return Center(
    child: Stack(
      children: [
        CircleAvatar(
          radius: height / 2,
          backgroundColor: Colors.grey.shade200,
          child: ClipOval(
            child: SizedBox(
                width: height,
                height: width,
                child: Icon(
                  Icons.file_open_outlined,
                  size: height / 1.7,
                  color: Colors.grey.shade300,
                )),
          ),
        ),
        Positioned(
          top: height / 1.5,
          left: height / 1.5,
          child: CircleAvatar(
            radius: height / 6,
            backgroundColor: Palette.primaryColor,
            child: ClipOval(
              child: SizedBox(
                  width: height / 3,
                  height: height / 3,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: height / 6,
                    color: Theme.of(context).backgroundColor,
                  )),
            ),
          ),
        )
      ],
    ),
  );
}
