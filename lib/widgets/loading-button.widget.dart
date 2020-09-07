import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  bool invert;
  Function handle;
  var text = "";

  LoadingButton({
    this.busy,
    @required this.handle,
    this.invert = false,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            height: 60,
            decoration: BoxDecoration(
                color: invert
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(60)),
            child: FlatButton(
              child: Text(
                text,
                style: TextStyle(
                    color:
                        invert ? Colors.white : Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontFamily: "Big Shouders Display"),
              ),
              onPressed: handle,
            ),
          );
  }
}