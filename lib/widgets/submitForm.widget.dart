import 'package:aog/widgets/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  Function submitHandle;
  var alcoolController = new MoneyMaskedTextController();
  var gasController = new MoneyMaskedTextController();
  var busy = false;

  SubmitForm({
    this.submitHandle,
    this.alcoolController,
    this.gasController,
    this.busy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            controller: gasController,
            label: "Gasolina",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            controller: alcoolController,
            label: "Álcool",
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          text: "CALCULAR",
          handle: submitHandle,
          busy: busy,
        ),
      ],
    );
  }
}
