import 'package:flutter/material.dart';

class CustomDropdownButtonClass extends StatelessWidget {
  List<String> values;
  double width;

  CustomDropdownButtonClass({required this.values, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: width,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: values.first,
        items: values.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          print(newValue);
        },
        underline: Container(),
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        isExpanded: true,
        // icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
