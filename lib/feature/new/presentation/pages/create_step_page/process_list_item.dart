import 'package:flutter/material.dart';
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
              Icons.coffee_maker,
              color: Constants.MAIN_COLOR,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.palette),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(process.ingredient.name!),
                    const Icon(Icons.monitor_weight),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${process.amount}g"),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.cookie),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(process.function.name),
                    const Icon(Icons.timer),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("${process.duration}m"),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
