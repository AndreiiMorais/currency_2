import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('Textfield'),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      cursorColor: Colors.limeAccent,
      style: const TextStyle(color: Colors.limeAccent),
      decoration: const InputDecoration(
        hintText: 'Amout to be converted',
        hintStyle: TextStyle(color: Color.fromARGB(94, 239, 255, 65)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.limeAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}
