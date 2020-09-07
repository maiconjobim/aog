import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submitForm.widget.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasController = new MoneyMaskedTextController();
  var _alcoolController = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa usar Álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(children: [
          Logo(),
          _completed
              ? Success(
                  reset: reset,
                  result: _resultText,
                )
              : SubmitForm(
                  busy: _busy,
                  alcoolController: _alcoolController,
                  gasController: _gasController,
                  submitHandle: calculate,
                )
        ]),
      ),
    );
  }

  Future calculate() {
    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });
    double alcool = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;
    double gas =
        double.parse(_gasController.text.replaceAll(new RegExp(r'[,.]'), '')) /
            100;

    double res = alcool / gas;

    return new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina";
        } else {
          _resultText = "Compensa utilizar Álcool";
        }
        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _color = Colors.deepPurple;
      _alcoolController = new MoneyMaskedTextController();
      _gasController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
