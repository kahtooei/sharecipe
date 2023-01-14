import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/domain/entities/step_process_entity.dart';

class ProcessListItem extends StatelessWidget {
  final StepProcessEntity process;
  const ProcessListItem({super.key, required this.process});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Constants.MAIN_COLOR,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: Row(
          children: [
            const Icon(
              FontAwesomeIcons.bowlFood,
              size: 50,
              color: Constants.MAIN_COLOR,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.bowlRice),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(process.ingredient.name!),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            const Icon(Icons.monitor_weight),
                            const SizedBox(
                              width: 2,
                            ),
                            Text("${process.amount}g"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.kitchenSet),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(process.function.name),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            const Icon(Icons.timer),
                            const SizedBox(
                              width: 2,
                            ),
                            Text("${process.duration}m"),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
