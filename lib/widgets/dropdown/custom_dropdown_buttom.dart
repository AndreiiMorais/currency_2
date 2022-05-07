import 'package:currency_2/models/symbol_model.dart';
import 'package:flutter/material.dart';

class CustomDropdownButtom extends StatefulWidget {
  final List<Symbol> items;
  String? selectedValue;
  final void Function(String? value) onChange;
  CustomDropdownButtom({Key? key, required this.items, this.selectedValue, required this.onChange})
      : super(key: key);

  @override
  State<CustomDropdownButtom> createState() => _CustomDropdownButtomState();
}

class _CustomDropdownButtomState extends State<CustomDropdownButtom> {
  void dropdownCallback(String? value) {
    
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        color: Colors.white,
        child: DropdownButton<String>(
          alignment: Alignment.center,
          isDense: true,
          itemHeight: 95,
          isExpanded: true,
          value: widget.selectedValue,
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
          onChanged: widget.onChange,
          items: widget.items.map((symbol) {
            return DropdownMenuItem(
              alignment: Alignment.centerLeft,
              value: symbol.key,
              child: Text(symbol.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}
