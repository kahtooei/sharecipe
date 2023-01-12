import 'package:flutter/material.dart';
import 'package:sharecipe/core/utils/constants.dart';

class ButtonsActionWidget extends StatelessWidget {
  final Function onPressed;
  const ButtonsActionWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 35,
      child: Row(
        children: [
          SizedBox(
            width: 160,
            height: 35,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.MAIN_COLOR,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              onPressed: () => onPressed(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Create",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Constants.MAIN_COLOR,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
