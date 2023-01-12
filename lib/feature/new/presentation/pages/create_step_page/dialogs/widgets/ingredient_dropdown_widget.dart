import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:sharecipe/core/utils/constants.dart';
import 'package:sharecipe/feature/new/domain/entities/ingredient_entity.dart';

class IngredientDropDownWidget extends StatelessWidget {
  final Function onChanged;
  final List<IngredientEntity> ingredientList;
  const IngredientDropDownWidget(
      {super.key, required this.onChanged, required this.ingredientList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 35,
      child: DropdownSearch<IngredientEntity>(
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
              label: Text("Select Ingredient"),
              labelStyle: TextStyle(fontSize: 14)
              // suffixIcon: Icon(Icons.search),
              ),
        ),
        popupProps: const PopupProps.dialog(
          showSelectedItems: true,
          showSearchBox: true,
        ),
        // dropdownSearchTextAlign: TextAlign.center,
        // selectedItem: getSelectedCurrency(),
        itemAsString: (item) {
          if (item == null) {
            return "Select Ingredient";
          } else {
            return item.name!;
          }
        },
        items: ingredientList,
        onChanged: (value) => onChanged(value),
        // selectedItem: "Brazil"
      ),
    );
  }
}
