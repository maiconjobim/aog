import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  final String label;
  final MoneyMaskedTextController controller;

  Input({@required this.label, @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "Big Shouders Display"),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: "Big Shouders Display"),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
