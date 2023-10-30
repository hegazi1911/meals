import 'package:flutter/material.dart';

class CussstomTextFild extends StatelessWidget {
  const CussstomTextFild(
      {super.key, required this.hint, this.mxLine = 1, this.onchange});
  final String hint;
  final int mxLine;

  final void Function(String?)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "field is required ";
        }
        return null;
      },
      cursorColor: Colors.black12,
      maxLines: mxLine,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.orange),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: Colors.blue),
      ),
    );
  }

  OutlineInputBorder buildBorder({color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.orange));
  }
}
