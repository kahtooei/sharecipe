import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sharecipe/core/utils/constants.dart';

class FunctionDurationTextField extends StatelessWidget {
  final Function onChanged;
  const FunctionDurationTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 35,
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlignVertical: TextAlignVertical.center,
        onChanged: (txt) => onChanged(txt),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.timer),
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          hintText: "Duration(m) ...",
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Constants.MAIN_COLOR)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
