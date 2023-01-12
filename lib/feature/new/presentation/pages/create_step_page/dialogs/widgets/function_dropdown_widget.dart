import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/domain/entities/process_function_entity.dart';

class FunctionDropDownWidget extends StatelessWidget {
  final List<ProcessFunctionEntity> functionList;
  final Function onChanged;
  const FunctionDropDownWidget(
      {super.key, required this.functionList, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 35,
      child: SizedBox(
        width: 230,
        height: 35,
        child: DropdownSearch<ProcessFunctionEntity>(
          compareFn: (a, b) {
            return true;
          },
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                isCollapsed: false,
                contentPadding: EdgeInsets.all(10),
                hintText: '',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Constants.MAIN_COLOR,
                    width: 2.0,
                  ),
                ),
                hintStyle: TextStyle(fontSize: 12),
                label: Text("Select Function"),
                labelStyle: TextStyle(fontSize: 14)),
          ),
          popupProps: const PopupProps.dialog(
            showSelectedItems: true,
            showSearchBox: true,
          ),
          itemAsString: (item) {
            if (item == null) {
              return "Select Function";
            } else {
              return item.name;
            }
          },
          items: functionList,
          onChanged: (value) => onChanged(value),
          // selectedItem: "Brazil"
        ),
      ),
    );
  }
}
