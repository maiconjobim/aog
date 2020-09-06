import 'package:aog/widgets/logo.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alcool ou Gasolina',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _gasController = new MoneyMaskedTextController();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(children: [
        Logo(),
        Row(
          children: [
            Container(
              width: 100,
              alignment: Alignment.centerRight,
              child: Text(
                "Gasolina",
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
                controller: _gasController,
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
        )
      ]),
    );
  }
}
