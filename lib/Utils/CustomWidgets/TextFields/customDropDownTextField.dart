import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/style.dart';

class CustomDropDownTextField extends StatefulWidget {
  final String labelText;
  final String buttonHintText;
   String? selectedValue;
  final List? droplist;
   CustomDropDownTextField({Key? key, required this.labelText, required this.buttonHintText,this.droplist,this.selectedValue}) : super(key: key);

  @override
  State<CustomDropDownTextField> createState() => _CustomDropDownTextFieldState();
}

class _CustomDropDownTextFieldState extends State<CustomDropDownTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.droplist == null ? Center(child: CircularProgressIndicator(),) : Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText, style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
          // DropDownTextField(
          //     textFieldDecoration: InputDecoration(
          //       focusedBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(
          //           color: primaryColor,
          //           width: 2
          //         )
          //       ),
          //       hintText: buttonHintText,
          //       hintStyle: TextStyle(fontWeight: FontWeight.bold, color: greyColor)
          //     ),
          //     dropDownList: [
          //       DropDownValueModel(name: 'name1', value: "value1"),
          //       DropDownValueModel(
          //           name: 'name2',
          //           value: "value2",
          //           toolTipMsg:
          //           "DropDownButton is a widget that we can use to select one unique value from a set of values"),
          //       DropDownValueModel(name: 'name3', value: "value3"),
          //     ])
          DropdownButton(
            // Initial Value
            value: widget.selectedValue == null || widget.selectedValue == ""  ? "Select" : widget.selectedValue,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            // Array list of items
            items: widget.droplist!.map((items) {
              return DropdownMenuItem(
                value: items.name.toString(),
                child: Text(items.name.toString()),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: ( String? newValue) {
              setState(() {
                widget.selectedValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
