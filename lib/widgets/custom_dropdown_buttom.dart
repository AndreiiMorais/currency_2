import 'package:currency_2/models/symbol_model.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtom extends StatefulWidget {
  final List<Symbol> items;
  final String? selectedValue;
  const CustomDropdownButtom(
      {Key? key, required this.items, this.selectedValue})
      : super(key: key);

  @override
  State<CustomDropdownButtom> createState() => _CustomDropdownButtomState();
}

class _CustomDropdownButtomState extends State<CustomDropdownButtom> {
  String _dropdownValue = 'USD';
  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.white,
        child: DropdownButton<String>(
          isExpanded: true,
          value: _dropdownValue,
          iconEnabledColor: Colors.black,
          iconSize: 30,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 25,
          ),
          selectedItemBuilder: (context) {
            return widget.items.map((symbol) {
              return Text(symbol.key);
            }).toList();
          },
          onChanged: dropdownCallback,
          items: widget.items.map((symbol) {
            return DropdownMenuItem(
              value: symbol.key,
              child: Text(symbol.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
