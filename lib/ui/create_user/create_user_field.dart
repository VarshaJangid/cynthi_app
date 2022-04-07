import 'package:flutter/material.dart';

class CreateUserField extends StatelessWidget {
  final String? labelText;
  bool? isIcon;
  bool obscureText;
  TextEditingController? controller;
  GestureTapCallback? iconPressed;

  CreateUserField({Key? key, required this.labelText, this.obscureText = false, this.isIcon = false, this.controller, this.iconPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        autocorrect: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: labelText,
          contentPadding: const EdgeInsets.only(left: 20),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 15),
          filled: true,
          fillColor: const Color(0XFFf6f2e7),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off :Icons.visibility_rounded,
              size: 20,
              color: isIcon == true ? Colors.black : Colors.transparent,
            ),
            onPressed: iconPressed,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
