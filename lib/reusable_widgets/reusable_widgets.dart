import 'package:flutter/material.dart';

Widget reusableTextField(String text, IconData icon, bool isPasswordType, TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.black, // İmleç rengi
      style: TextStyle(color: Colors.black), // Metin rengi
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.black, // İkon rengi
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.black), // Etiket metin rengi
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.grey.shade100, // Blok rengi
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
    ),
  );
}
