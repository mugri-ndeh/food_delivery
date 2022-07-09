import 'package:delivery_app/util/palette.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final Function()? onTap;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: Palette.primaryColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(2, 5),
                color: Palette.primaryColor.withOpacity(0.1),
                blurRadius: 15,
              )
            ],
            borderRadius: BorderRadius.circular(32)),
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(
              color: Palette.white, fontWeight: FontWeight.bold, fontSize: 24),
        )),
      ),
    );
  }
}

class CustomCircularButton extends StatelessWidget {
  const CustomCircularButton({
    Key? key,
    required this.outlined,
    required this.onTap,
    required this.icon,
  }) : super(key: key);
  final bool outlined;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 30,
          width: 30,
          decoration: outlined
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Palette.primaryColor),
                  color: Palette.scaffoldBg)
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Palette.primaryColor),
          child: Icon(
            icon,
            color: outlined ? Palette.primaryColor : Colors.white,
          )),
    );
  }
}
