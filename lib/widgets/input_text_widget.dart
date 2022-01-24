import 'package:flutter/material.dart';

Widget getTextFormField(
    {required String labelText,
    required myKeyboardtype,
    required controller,
    required String? Function(String?)? validFun,
    suffixFun,
    prefIcon,
    sufxIcon,
    Function(String)? onchange,
    Function(String)? onsubmitted,
    Function()? onTap,
    bool isPassword = false,
    isEnabled = true,
    isDark = true}) {
  return TextFormField(
    enabled: isEnabled,
    controller: controller,
    onFieldSubmitted: onsubmitted != null ? onsubmitted : null,
    onChanged: onchange != null ? onchange : null,
    validator: validFun,
    decoration: InputDecoration(
      fillColor: isDark ? Colors.white : Colors.white,
      filled: true,
      labelText: labelText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      prefixIcon: prefIcon != null ? Icon(prefIcon) : null,
      suffixIcon: sufxIcon != null
          ? IconButton(
              icon: Icon(sufxIcon),
              onPressed: suffixFun != null ? suffixFun! : () {},
            )
          : null,
    ),
    obscureText: isPassword,
    keyboardType: myKeyboardtype,
    onTap: onTap != null ? onTap : null,
  );
}
